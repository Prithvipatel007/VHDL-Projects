library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-------------------------------------------------------------------------------------------------------------------------
ARCHITECTURE arch OF mux4x8_e IS
BEGIN

WITH seld_i SELECT
ascii_digit_o    <=     digit3_i WHEN "000",
                        digit2_i WHEN "001",
                        digit1_i WHEN "010",
                        digit0_i WHEN "011",
                        cr_i WHEN "100",
                        lf_i WHEN "101",
                        digit3_i WHEN OTHERS;
END arch;
