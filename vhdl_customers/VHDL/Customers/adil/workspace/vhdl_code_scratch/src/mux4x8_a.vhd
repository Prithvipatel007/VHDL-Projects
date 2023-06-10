library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-------------------------------------------------------------------------------------------------------------------------
ARCHITECTURE arch OF mux4x8_e IS
BEGIN

WITH seld_i SELECT
ascii_digit_o    <=     h_1_i WHEN "000",
                        h_0_i WHEN "001",
                        m_1_i WHEN "010",
                        m_0_i WHEN "011",
                        s_1_i WHEN "100",
                        s_0_i WHEN "101",
                        cr_i WHEN "110",
                        lf_i WHEN "111",
                        h_1_i WHEN OTHERS;
END arch;
