library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity async_fifo is
   generic( 
      pol_rst    : BOOLEAN := false;      --low active reset
      data_width : NATURAL := 16;
      fifo_size  : NATURAL := 1024;
	  afull		 : INTEGER := 1020;			-- always has to be positive
	  aempty	 : INTEGER := 4;			-- always has to be positive
      depth      : NATURAL := 10           --log2 of fifo_size
   );
   port( 
      wclk      : in     STD_LOGIC;
	  qclk		: in 	 STD_LOGIC;
      wclk_en_n : in     STD_LOGIC;
      wclk_rst  : in     STD_LOGIC;
      rclk      : in     STD_LOGIC;
      rclk_en_n : in     STD_LOGIC;
      rclk_rst  : in     STD_LOGIC;
      din       : in     STD_LOGIC_VECTOR (data_width-1 downto 0);
      rd        : in     STD_LOGIC;
      wr        : in     STD_LOGIC;
      dout      : out    STD_LOGIC_VECTOR (data_width-1 downto 0);
      rhf       : out    STD_LOGIC;
      ef        : out    STD_LOGIC;
	  aef		: out	 STD_LOGIC;
      ff        : out    STD_LOGIC;
	  aff		: out 	 STD_LOGIC;
      rlevel    : out    STD_LOGIC_VECTOR (depth downto 0);
      wlevel    : out    STD_LOGIC_VECTOR (depth downto 0);
      whf       : out    STD_LOGIC;
	  SB_CORRECT: out 	 STD_LOGIC;
	  DB_DETECT : out 	 STD_LOGIC
   );

-- Declarations

end async_fifo ;


ARCHITECTURE rtl OF async_fifo IS

  FUNCTION gray_to_bin (data : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
    VARIABLE bin_temp : STD_LOGIC_VECTOR(data'range);
  BEGIN
    FOR i IN data'range LOOP
      IF i = data'high THEN
        bin_temp(i) := data(i);
      ELSE
        bin_temp(i) := bin_temp(i+1) XOR data(i);
      END IF;
    END LOOP;
    RETURN bin_temp;
  END FUNCTION;


  FUNCTION bin_to_gray (data : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
    VARIABLE gray_temp : STD_LOGIC_VECTOR(data'range);
  BEGIN
    FOR i IN data'range LOOP
      IF i = data'high THEN
        gray_temp(i) := data(i);
      ELSE
        gray_temp(i) := data(i+1) XOR data(i);
      END IF;
    END LOOP;
    RETURN gray_temp;
  END FUNCTION;


  FUNCTION gray_inc (data : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
  BEGIN
    --RETURN bin_to_gray(gray_to_bin(data) + 1);
	RETURN bin_to_gray(STD_LOGIC_VECTOR(UNSIGNED(gray_to_bin(data)) + 1));
  END FUNCTION;

  SUBTYPE pointer IS STD_LOGIC_VECTOR (depth DOWNTO 0);
  SIGNAL wr_pointer     : pointer;
  SIGNAL rd_pointer     : pointer;
  SIGNAL wr_pointer_d   : pointer;
  SIGNAL rd_pointer_d   : pointer;
  SIGNAL wr_pointer_dd  : pointer;
  SIGNAL rd_pointer_dd  : pointer;
  SIGNAL wr_pointer_inc : pointer;
  SIGNAL rd_pointer_inc : pointer;
  SIGNAL wr_addr        : STD_LOGIC_VECTOR(depth - 1 DOWNTO 0);
  SIGNAL rd_addr        : STD_LOGIC_VECTOR(depth - 1 DOWNTO 0);
  SIGNAL rclk_en        : STD_LOGIC;

  SIGNAL wrst               : STD_LOGIC;
  SIGNAL rrst               : STD_LOGIC;
  SIGNAL wr_sig             : STD_LOGIC;
  SIGNAL rd_sig             : STD_LOGIC;
  SIGNAL ff_sig             : STD_LOGIC;
  SIGNAL ef_sig             : STD_LOGIC;
  SIGNAL wr_pointer_dd_bin  : STD_LOGIC_VECTOR(wr_pointer_dd'range);
  SIGNAL rd_pointer_bin     : STD_LOGIC_VECTOR(rd_pointer'range);
  SIGNAL rd_pointer_inc_bin : STD_LOGIC_VECTOR(rd_pointer'range);
  SIGNAL wr_pointer_bin     : STD_LOGIC_VECTOR(wr_pointer'range);
  SIGNAL rd_pointer_dd_bin  : STD_LOGIC_VECTOR(rd_pointer_dd'range);
  SIGNAL rlevel_i           : UNSIGNED(depth DOWNTO 0);
  SIGNAL wlevel_i           : UNSIGNED(depth DOWNTO 0);
  SIGNAL wlevel_sig			: UNSIGNED(depth DOWNTO 0);
  SIGNAL rlevel_sig			: UNSIGNED(depth DOWNTO 0);
  
  SIGNAL aFull_level : STD_LOGIC_VECTOR(depth DOWNTO 0);
  SIGNAL aEmpty_level : STD_LOGIC_VECTOR(depth DOWNTO 0);
  
  SIGNAL temp_wlevel : UNSIGNED(depth DOWNTO 0);
  SIGNAL temp_rlevel : UNSIGNED(depth DOWNTO 0);
  
  
  COMPONENT twoport_ram IS
    GENERIC(data_width    : INTEGER := 8;
            address_width : INTEGER := 8);
    PORT(
      wclk  : IN  STD_LOGIC;
	  qclk  : IN STD_LOGIC;
      wren  : IN  STD_LOGIC;
      waddr : IN  STD_LOGIC_VECTOR(address_width-1 DOWNTO 0);
      wdata : IN  STD_LOGIC_VECTOR(data_width-1 DOWNTO 0);
      rclk  : IN  STD_LOGIC;
      rden  : IN  STD_LOGIC;
      raddr : IN  STD_LOGIC_VECTOR(address_width-1 DOWNTO 0);
      rdata : OUT STD_LOGIC_VECTOR(data_width-1 DOWNTO 0);
	  COR 	: OUT STD_LOGIC;
	  ERR  	: OUT STD_LOGIC
	  );
  END COMPONENT twoport_ram;
  
  SIGNAL SB_CORRECT_sig : STD_LOGIC;
  SIGNAL DB_DETECT_sig  : STD_LOGIC; 

BEGIN
 
  aFull_level <= STD_LOGIC_VECTOR(to_unsigned(afull, depth+1));
  aEmpty_level <= STD_LOGIC_VECTOR(to_unsigned(aempty, depth+1));
  
  wrst <= wclk_rst WHEN pol_rst ELSE NOT wclk_rst;
  rrst <= rclk_rst WHEN pol_rst ELSE NOT rclk_rst;

  wr_sig <= wr AND NOT ff_sig WHEN wclk_en_n='0' else '0';
  rd_sig <= rd AND NOT ef_sig;

  ff <= ff_sig;
  ef <= ef_sig;

  ------------------------
  -- Write pointer
  ------------------------
  -- next value of wr_pointer
  wr_pointer_inc <= gray_inc(wr_pointer) WHEN (wr_sig = '1') ELSE wr_pointer;
  wr_proc : PROCESS (wrst, wclk)
  BEGIN
    IF wrst = '1' THEN
      wr_pointer <= (OTHERS => '0');
    ELSIF RISING_EDGE(wclk) THEN
      IF wclk_en_n='0' THEN
        wr_pointer <= wr_pointer_inc;
      END IF;
    END IF;
  END PROCESS;

  ------------------------
  -- Read pointer
  ------------------------
--   -- next value of rd_pointer
  rd_pointer_inc <= gray_inc(rd_pointer) WHEN (rd_sig = '1') ELSE rd_pointer;
  rd_proc : PROCESS (rrst, rclk)
  BEGIN
    IF rrst = '1' THEN
      rd_pointer <= (OTHERS => '0');
    ELSIF RISING_EDGE(rclk) THEN
      IF rclk_en_n='0' THEN
        rd_pointer <= rd_pointer_inc;
      END IF;
    END IF;
  END PROCESS;

  ------------------------------------------------------
  -- Write pointer synchronization to read-clock domain
  ------------------------------------------------------
  w2r_proc : PROCESS (rrst, rclk)
  BEGIN
    IF rrst = '1' THEN
      wr_pointer_d  <= (OTHERS => '0');
      wr_pointer_dd <= (OTHERS => '0');
    ELSIF RISING_EDGE (rclk) THEN
      IF rclk_en_n='0' THEN
        wr_pointer_d  <= wr_pointer;
        wr_pointer_dd <= wr_pointer_d;
      END IF;
    END IF;
  END PROCESS;

  ------------------------------------------------------
  -- Read pointer synchronization to write-clock domain
  ------------------------------------------------------
  r2w_proc : PROCESS (wrst, wclk)
  BEGIN
    IF wrst = '1' THEN
      rd_pointer_d  <= (OTHERS => '0');
      rd_pointer_dd <= (OTHERS => '0');
    ELSIF RISING_EDGE (wclk) THEN
      IF wclk_en_n='0' THEN
        rd_pointer_d  <= rd_pointer;
        rd_pointer_dd <= rd_pointer_d;
      END IF;
    END IF;
  END PROCESS;

  ------------------------------------------------------
  -- Generated FIFO Full flag
  ------------------------------------------------------
  ff_proc : PROCESS (wrst, wclk)
  BEGIN
    IF wrst = '1' THEN
      ff_sig <= '0';
    ELSIF RISING_EDGE (wclk) THEN
      IF wclk_en_n='0' THEN
        IF depth = 1 THEN
          IF wr_pointer_inc(depth) /= rd_pointer_dd(depth) AND
            wr_pointer_inc(depth -1) /= rd_pointer_dd(depth -1) THEN
            ff_sig <= '1';
          ELSE
            ff_sig <= '0';
          END IF;
        ELSE
          IF wr_pointer_inc(depth) /= rd_pointer_dd(depth) AND
            wr_pointer_inc(depth -1) /= rd_pointer_dd(depth -1) AND
            wr_pointer_inc(depth -2 DOWNTO 0) = rd_pointer_dd(depth -2 DOWNTO 0) THEN
            ff_sig <= '1';
          ELSE
            ff_sig <= '0';
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS;

  ------------------------------------------------------
  -- Generated FIFO empty flag
  ------------------------------------------------------
  ef_proc : PROCESS (rrst, rclk)
  BEGIN
    IF rrst = '1' THEN
      ef_sig <= '1';
    ELSIF RISING_EDGE (rclk) THEN
      IF rclk_en_n='0' THEN
        IF wr_pointer_dd = rd_pointer_inc THEN
          ef_sig <= '1';
        ELSE
          ef_sig <= '0';
        END IF;
      END IF;
    END IF;
  END PROCESS;

  ------------------------------------------------------
  -- Generate fill level signal for read clock
  ------------------------------------------------------
  rlevel_proc : PROCESS (rrst, rclk)
  BEGIN
    IF rrst = '1' THEN
      rlevel_i <= (OTHERS => '0');
    ELSIF RISING_EDGE (rclk) THEN
      IF rclk_en_n='0' THEN
        IF UNSIGNED(wr_pointer_dd_bin(depth -1 DOWNTO 0)) >= UNSIGNED(rd_pointer_bin(depth -1 DOWNTO 0)) THEN
          rlevel_i <= UNSIGNED('0' & wr_pointer_dd_bin(depth-1 DOWNTO 0)) - UNSIGNED('0' & rd_pointer_bin(depth-1 DOWNTO 0));
        ELSE
          rlevel_i <= TO_UNSIGNED(fifo_size, depth+1) - UNSIGNED('0' & rd_pointer_bin(depth-1 DOWNTO 0)) + UNSIGNED('0' & wr_pointer_dd_bin(depth-1 DOWNTO 0));
		 -- rlevel_i <= TO_UNSIGNED(fifo_size, depth+1) + temp_rlevel;
        END IF;
        -- the MSB of rlevel_i shall be the fifo_full flag
        IF rd_pointer_bin(depth-1 DOWNTO 0) = wr_pointer_dd_bin(depth-1 DOWNTO 0) AND rd_pointer_bin(depth) /= wr_pointer_dd_bin(depth) THEN
          rlevel_i(depth) <= '1';
        ELSE
          rlevel_i(depth) <= '0';
        END IF;
      END IF;
    END IF;
  END PROCESS;

  wr_pointer_dd_bin  <= gray_to_bin(wr_pointer_dd);
  rd_pointer_bin     <= gray_to_bin(rd_pointer);
  rd_pointer_inc_bin <= gray_to_bin(rd_pointer_inc);
  --temp_rlevel 		<= UNSIGNED('0' & wr_pointer_dd_bin(depth-1 DOWNTO 0)) - UNSIGNED('0' & rd_pointer_bin(depth-1 DOWNTO 0));

  ------------------------------------------------------
  -- Generate fill level signal for write clock
  ------------------------------------------------------
  wlevel_proc : PROCESS (wrst, wclk)
  BEGIN
    IF wrst = '1' THEN
      wlevel_i <= (OTHERS => '0');
    ELSIF RISING_EDGE (wclk) THEN
      IF wclk_en_n='0' THEN
        IF UNSIGNED(wr_pointer_bin(depth -1 DOWNTO 0)) >= UNSIGNED(rd_pointer_dd_bin(depth -1 DOWNTO 0)) THEN
          wlevel_i <= UNSIGNED('0' & wr_pointer_bin(depth -1 DOWNTO 0)) - UNSIGNED('0' & rd_pointer_dd_bin(depth -1 DOWNTO 0));
        ELSE
          wlevel_i <= TO_UNSIGNED(fifo_size, depth+1) - UNSIGNED('0' & rd_pointer_dd_bin(depth -1 DOWNTO 0)) + UNSIGNED('0' & wr_pointer_bin(depth -1 DOWNTO 0));
		  --wlevel_i <= TO_UNSIGNED(fifo_size, depth+1) + temp_wlevel;
        END IF;
      END IF;
    END IF;
  END PROCESS;

  wr_pointer_bin    <= gray_to_bin(wr_pointer);
  rd_pointer_dd_bin <= gray_to_bin(rd_pointer_dd);
  --temp_wlevel		<= UNSIGNED('0' & wr_pointer_bin(depth -1 DOWNTO 0)) - UNSIGNED('0' & rd_pointer_dd_bin(depth -1 DOWNTO 0));


  ---------------------------------
  -- Half-full flags
  ---------------------------------
  whf <= wlevel_i(depth -1) OR ff_sig;
  rhf <= rlevel_i(depth -1) OR rlevel_i(depth);

  wlevel_sig(depth-1 DOWNTO 0) <= wlevel_i(depth-1 DOWNTO 0);
  wlevel_sig(depth)            <= ff_sig WHEN wlevel_i = 0 ELSE '0';

  rlevel_sig <= rlevel_i;
  
  aff <= '1' WHEN (wlevel_sig >= UNSIGNED(aFull_level)) ELSE '0';
  aef <= '1' WHEN (rlevel_sig <= UNSIGNED(aEmpty_level)) ELSE '0';
  
  rlevel <= STD_LOGIC_VECTOR(rlevel_sig);
  wlevel <= STD_LOGIC_VECTOR(wlevel_sig);
  --------------------------------------------
  -- CORE RAM
  --------------------------------------------

  wr_addr <= wr_pointer_bin(depth -1 DOWNTO 0);
  rd_addr <= rd_pointer_inc_bin(depth -1 DOWNTO 0);
  rclk_en <= not rclk_en_n;
  
  fifo_ram : twoport_ram
    GENERIC MAP(
      data_width    => data_width,
      address_width => depth
      )
    PORT MAP (
      wclk  => wclk,
	  qclk	=> qclk,
      wren  => wr_sig,
      waddr => wr_addr,
      wdata => din,
      rclk  => rclk,
      rden  => rclk_en,
      raddr => rd_addr,
      rdata => dout,
	  COR 	=> SB_CORRECT_sig,
	  ERR 	=> DB_DETECT_sig
      );
	
	SB_CORRECT <= SB_CORRECT_sig;
	DB_DETECT  <= DB_DETECT_sig;

END ARCHITECTURE rtl;
