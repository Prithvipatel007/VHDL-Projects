library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
------------------------------------------------------------------------------------------------------
ENTITY mux16_txd_e is
    PORT(
        ascii_digit_i  :  IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        seld_i         :  IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        txd_o          :  OUT STD_LOGIC);
END mux16_txd_e;
-------------------------------------------------------------------------------------------------------
