LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------------------------------------------------------------------------------------------
ENTITY mux4x8_e IS
    PORT(
        digit3_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        digit2_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        digit1_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        digit0_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        cr_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        lf_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        seld_i : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        ascii_digit_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END mux4x8_e;
