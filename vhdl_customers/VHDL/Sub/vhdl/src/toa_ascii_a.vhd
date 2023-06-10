LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
--------------------------------------------------------------------------------------------------------------
ARCHITECTURE toa_ascii_a OF toa_ascii_e IS
BEGIN

    toc_hour_0_o    <= "0011" & toc_hour_0_i;
    toc_hour_1_o    <= "0011" & toc_hour_1_i;
    toc_minutes_1_o <= "0011" & toc_minutes_1_i;
    toc_minutes_0_o <= "0011" & toc_minutes_0_i;
    toc_seconds_1_o <= "0011" & toc_seconds_1_i;
    toc_seconds_0_o <= "0011" & toc_seconds_0_i;
    cr_o <= "00001101";
    lf_o <= "00001010";

END toa_ascii_a;


