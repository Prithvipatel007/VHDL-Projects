LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------------------
ENTITY BCD_to_ASCII_e IS
    PORT(
        digit0_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        digit1_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        digit2_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        digit3_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        digit3_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        digit2_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        digit1_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        digit0_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        cr_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        lf_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END BCD_to_ASCII_e;
------------------------------------------------------------------------------------
