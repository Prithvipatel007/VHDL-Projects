LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY NX;
USE NX.nxPackage.ALL;

ENTITY twoport_ram IS
   GENERIC(data_width : integer := 8;
           address_width :integer := 8 );
    PORT(
            wclk:  IN std_logic;
			qclk:  IN std_logic;
            wren:  IN std_logic;
            waddr: IN std_logic_vector(address_width-1 DOWNTO 0);
            wdata: IN std_logic_vector(data_width-1 DOWNTO 0);
            rclk:  IN std_logic;
            rden:  IN std_logic;
            raddr: IN std_logic_vector(address_width-1 DOWNTO 0);
            rdata: OUT std_logic_vector(data_width-1 DOWNTO 0);
			COR : OUT STD_LOGIC;
			ERR  : OUT STD_LOGIC
			);
END twoport_ram;


ARCHITECTURE rtl OF twoport_ram IS

    TYPE   mem_array IS ARRAY(0 TO 2**(address_width) -1) OF std_logic_vector(data_width-1 DOWNTO 0);
    SIGNAL mem : mem_array;
    --ATTRIBUTE syn_ramstyle : string;
    --ATTRIBUTE syn_ramstyle of mem : signal is "registers"; --"uram,no_rw_check" ;
    
--	SIGNAL rdata_sig : STD_LOGIC_VECTOR(data_width-1 DOWNTO 0);
--	SIGNAL ckd : STD_LOGIC := '0';
	
begin

useram_ecc : NX_ECC
port map(
	CKD => qclk,
	CHK => rdata(0),
	COR => COR,
	ERR => ERR
);


write_ram : 
   PROCESS (wclk) 
   BEGIN
      IF rising_edge(wclk) THEN
         IF (wren = '1') THEN
            mem(to_integer(unsigned(waddr))) <= wdata;
         END IF;
      END IF;
    END PROCESS write_ram;

read_ram : 
   PROCESS (rclk) 
   BEGIN
      IF rising_edge(rclk) THEN
         IF (rden = '1') THEN
	         rdata <= mem(to_integer(unsigned(raddr)));
         END IF;
      END IF;
   END PROCESS read_ram;

--   rdata <= rdata_sig;

end rtl; 

