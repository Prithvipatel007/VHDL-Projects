library ieee;
use ieee.std_logic_1164.all;
-----------------------------------------------------
entity transmission_e is
    port(
        rst_i   : in std_logic;
        clk_i   : in std_logic;	
        bdr_i   : in std_logic;
        ascii_i : in std_logic_vector (7 downto 0);
        dv_i   : in std_logic;
        serial_o  : out std_logic
    );
end transmission_e;
-----------------------------------------
