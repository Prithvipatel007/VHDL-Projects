-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- THIS FILE: brg_e.vhd - last edited: 2021-1202
-- --------------------------------------------------------------------
-- brg - the baud-rate-generator
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

  ENTITY brg IS   
   PORT (rb_i,cp_i  :  IN STD_LOGIC;
         co_o       : OUT STD_LOGIC;  -- one-second-carry
         br_o       : OUT STD_LOGIC;  -- baud-rate 9k6 (80ns log1)
         sec_o      : OUT STD_LOGIC); -- one-second-pulse, Ti/T=2/6
  END brg;
-- --------------------------------------------------------------------
