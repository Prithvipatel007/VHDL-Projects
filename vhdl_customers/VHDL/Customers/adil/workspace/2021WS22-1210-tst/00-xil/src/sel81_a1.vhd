-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- file: sel81_a1.vhd, last modified: 2021-1202
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
  ARCHITECTURE a1 OF sel81 IS
  BEGIN
   WITH a_i SELECT
   txd_o <=   '1'  WHEN "0000", 
              '0'  WHEN "0001", 
           d_i(0)  WHEN "0010", 
           d_i(1)  WHEN "0011", 
           d_i(2)  WHEN "0100", 
           d_i(3)  WHEN "0101", 
           d_i(4)  WHEN "0110", 
           d_i(5)  WHEN "0111", 
           d_i(6)  WHEN "1000", 
           d_i(7)  WHEN "1001", 
              '1'  WHEN OTHERS;
  END a1;
-- ----------------------------------------------------------------------------
