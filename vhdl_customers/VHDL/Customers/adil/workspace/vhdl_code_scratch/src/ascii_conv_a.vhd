LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

ARCHITECTURE ascii_conv_a OF ascii_conv_e IS
BEGIN

    toc_h_0_o    <= "0011" & toc_h_0_i;
    toc_h_1_o    <= "0011" & toc_h_1_i;
    toc_m_1_o <= "0011" & toc_m_1_i;
    toc_m_0_o <= "0011" & toc_m_0_i;
    toc_s_1_o <= "0011" & toc_s_1_i;
    toc_s_0_o <= "0011" & toc_s_0_i;
    cr_o <= "00001101";
    lf_o <= "00001010";

END ascii_conv_a;


