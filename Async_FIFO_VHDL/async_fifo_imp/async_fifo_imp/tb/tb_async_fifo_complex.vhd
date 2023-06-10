LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tb_async_fifo_complex IS
	generic(
		pol_rst		: BOOLEAN := false;		-- low active reset
		data_width 	: NATURAL := 8;
		fifo_size  	: NATURAL := 16;
		depth		: NATURAL := 4			-- log2 of fifo_size
	);
END tb_async_fifo_complex;

ARCHITECTURE rtl OF tb_async_fifo_complex IS
	COMPONENT async_fifo IS
	   GENERIC( 
		  pol_rst    : BOOLEAN := false;      --low active reset
		  data_width : NATURAL := 8;
		  fifo_size  : NATURAL := 4;
		  depth      : NATURAL := 2           --log2 of fifo_size
	   );
	   PORT( 
		  wclk      : IN     STD_LOGIC;
		  wclk_en_n : IN     STD_LOGIC;
		  wclk_rst  : IN     STD_LOGIC;
		  rclk      : IN     STD_LOGIC;
		  rclk_en_n : IN     STD_LOGIC;
		  rclk_rst  : IN     STD_LOGIC;
		  din       : IN     STD_LOGIC_VECTOR (data_width-1 downto 0);
		  rd        : IN     STD_LOGIC;
		  wr        : IN     STD_LOGIC;
		  dout      : OUT    STD_LOGIC_VECTOR (data_width-1 downto 0);
		  rhf       : OUT    STD_LOGIC;
		  ef        : OUT    STD_LOGIC;
		  ff        : OUT    STD_LOGIC;
		  rlevel    : OUT    STD_LOGIC_VECTOR (depth downto 0);
		  wlevel    : OUT    STD_LOGIC_VECTOR (depth downto 0);
		  whf       : OUT    STD_LOGIC
	   );

	-- Declarations

	END COMPONENT async_fifo ;
	
	SIGNAL tb_wclk      : STD_LOGIC;
	SIGNAL tb_wclk_en_n : STD_LOGIC;
	SIGNAL tb_wclk_rst  : STD_LOGIC;
	SIGNAL tb_rclk      : STD_LOGIC;
	SIGNAL tb_rclk_en_n : STD_LOGIC;
	SIGNAL tb_rclk_rst  : STD_LOGIC;
	SIGNAL tb_din       : STD_LOGIC_VECTOR (data_width-1 downto 0);
	SIGNAL tb_rd        : STD_LOGIC;
	SIGNAL tb_wr        : STD_LOGIC;
	SIGNAL tb_dout      : STD_LOGIC_VECTOR (data_width-1 downto 0);
	SIGNAL tb_rhf       : STD_LOGIC;
	SIGNAL tb_ef        : STD_LOGIC;
	SIGNAL tb_ff        : STD_LOGIC;
	SIGNAL tb_rlevel    : STD_LOGIC_VECTOR (depth downto 0);
	SIGNAL tb_wlevel    : STD_LOGIC_VECTOR (depth downto 0);
	SIGNAL tb_whf       : STD_LOGIC;
	
BEGIN

	uu1 : async_fifo
	GENERIC MAP(
		pol_rst 	=> pol_rst,
		data_width	=> data_width,
		fifo_size 	=> fifo_size,
		depth		=> depth
	)
	PORT MAP(
		wclk      =>	tb_wclk,
		wclk_en_n =>	tb_wclk_en_n,
		wclk_rst  => 	tb_wclk_rst,
		rclk      =>	tb_rclk,
		rclk_en_n =>	tb_rclk_en_n,
		rclk_rst  =>	tb_rclk_rst,
		din       => 	tb_din,
		rd        =>	tb_rd,
		wr        =>	tb_wr,
		dout      =>	tb_dout,
		rhf       => 	tb_rhf,
		ef        =>	tb_ef,
		ff        =>	tb_ff,
		rlevel    =>	tb_rlevel,
		wlevel    =>	tb_wlevel,
		whf       =>	tb_whf
	);
	
	write_clock_proc : PROCESS
	BEGIN
		tb_wclk <= '0';
		WAIT FOR 20000 ps;
		tb_wclk	<= '1';
		WAIT FOR 20000 ps;
	END PROCESS write_clock_proc;
	
	read_clock_proc : PROCESS
	BEGIN
		tb_rclk <= '0';
		WAIT FOR 10000 ps;
		tb_rclk <= '1';
		WAIT FOR 10000 ps;
	END PROCESS read_clock_proc;
	
	reset_process : PROCESS 
	BEGIN
		
		tb_rclk_rst <= '0';
		tb_wclk_rst <= '0';
		tb_rclk_en_n <= '1';
		tb_wclk_en_n <= '1';
		tb_wr <= '0';
		tb_rd <= '0';
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rclk_rst <= '1';
		tb_wclk_rst <= '1';
		tb_wclk_en_n <= '0';
		-- writing FIFO starts
		
		-- #1
		WAIT UNTIL rising_edge(tb_wclk);
		tb_din <= "00000011";	
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			
		WAIT UNTIL rising_edge(tb_wclk);
		
		
		-- #2
		tb_din <= "00000111";
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rclk_en_n <= '0';
		tb_rd <= '1';
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			
		WAIT UNTIL rising_edge(tb_wclk);
		
		
		-- #3
		tb_din <= "00011001";	
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			
		--WAIT UNTIL rising_edge(tb_wclk);
		--tb_wr <= '0';
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '1';
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';
		WAIT UNTIL rising_edge(tb_wclk);
		
		-- #4
		tb_din <= "11000001";	
		--WAIT UNTIL rising_edge(tb_wclk);
		--tb_wr <= '1';		
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '1';
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			
		WAIT UNTIL rising_edge(tb_wclk);
		
		-- #5
		tb_din <= "00000011";	
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '1';
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			
		WAIT UNTIL rising_edge(tb_wclk);
		
		-- #6
		tb_din <= "00000111";
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '1';
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';
		--WAIT UNTIL rising_edge(tb_wclk);
		--tb_wr <= '0';			
		WAIT UNTIL rising_edge(tb_wclk);

		-- #7
		tb_din <= "00011001";	
		--WAIT UNTIL rising_edge(tb_wclk);
		--tb_wr <= '1';			
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			
		WAIT UNTIL rising_edge(tb_wclk);
		
		-- #8
		tb_din <= "11000001";	
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			
		--WAIT UNTIL rising_edge(tb_wclk);
		--tb_wr <= '0';	
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '1';
		WAIT UNTIL rising_edge(tb_wclk);
		
		--#9
		tb_din <= "00000011";
		--WAIT UNTIL rising_edge(tb_wclk);
		--tb_wr <= '1';			
		--WAIT UNTIL rising_edge(tb_wclk);
		--tb_wr <= '0';		
		
		WAIT UNTIL rising_edge(tb_wclk);
		
		-- #10
		tb_din <= "00000111";	
		--WAIT UNTIL rising_edge(tb_wclk);
		--tb_wr <= '1';			
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_wclk_en_n <= '1';	WAIT UNTIL rising_edge(tb_wclk);
		tb_rclk_en_n <= '1';
		
		WAIT;
	END PROCESS reset_process;
	
END rtl;