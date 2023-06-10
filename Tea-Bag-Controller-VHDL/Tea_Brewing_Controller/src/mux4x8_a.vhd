library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-------------------------------------------------------------------------------------------------------------------------
ARCHITECTURE arch OF mux4x8_e IS
BEGIN

WITH seld_i SELECT
ascii_digit_o    <=     hour_1_i WHEN "000",
                        hour_0_i WHEN "001",
                        minutes_1_i WHEN "010",
                        minutes_0_i WHEN "011",
                        seconds_1_i WHEN "100",
                        seconds_0_i WHEN "101",
                        cr_i WHEN "110",
                        lf_i WHEN "111",
                        hour_1_i WHEN OTHERS;
END arch;
