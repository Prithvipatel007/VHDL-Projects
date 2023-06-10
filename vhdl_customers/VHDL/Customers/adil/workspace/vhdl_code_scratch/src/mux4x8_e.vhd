LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------------------------------------------------------------------------------------------
ENTITY mux4x8_e IS
    PORT
    (
        h_1_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        h_0_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        m_1_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        m_0_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        s_1_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        s_0_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        cr_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        lf_i : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        seld_i : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        ascii_digit_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END mux4x8_e;
