-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- THIS FILE: c06eqc_e.vhd - last edited: 2021-1202
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- c06eqc : a 6-state-counter, has enable, has q-output, has carry
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

  ENTITY c06eqc IS
   PORT (rb_i,cp_i  :  IN STD_LOGIC;
         en_i       :  IN STD_LOGIC;  -- enable counting
         qx_o       : OUT STD_LOGIC;
         co_o       : OUT STD_LOGIC);
  END c06eqc;
-- --------------------------------------------------------------------
