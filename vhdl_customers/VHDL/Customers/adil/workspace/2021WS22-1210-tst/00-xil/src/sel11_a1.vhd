-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- file: sel11_a1.vhd, last modified: 2021-1202
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- some GHDL-cmds:   ghdl -s xxx.vhd  : Syntax check
--                   ghdl -a xxx.vhd  : Assembles file xxx.vhd
--                   ghdl -e xyz      : Elaborates xyz
-- prepare waveform: ghdl -r xxx_TB1 --wave=xxx_TB1_wave.ghw
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
-- ----------------------------------------------------------------------------
  ARCHITECTURE a1 OF sel11 IS
  BEGIN
   WITH a_i SELECT
   d_o <=  d_i(87 DOWNTO 80)  WHEN "0000", 
           d_i(79 DOWNTO 72)  WHEN "0001", 
           d_i(71 DOWNTO 64)  WHEN "0010", 
           d_i(63 DOWNTO 56)  WHEN "0011", 
           d_i(55 DOWNTO 48)  WHEN "0100", 
           d_i(47 DOWNTO 40)  WHEN "0101", 
           d_i(39 DOWNTO 32)  WHEN "0110", 
           d_i(31 DOWNTO 24)  WHEN "0111", 
           d_i(23 DOWNTO 16)  WHEN "1000", 
           d_i(15 DOWNTO  8)  WHEN "1001", 
           d_i( 7 DOWNTO  0)  WHEN "1010", 
           "00111111"         WHEN OTHERS;
  END a1;
-- ----------------------------------------------------------------------------
