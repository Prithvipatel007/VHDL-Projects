-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- THIS FILE: c05ec_e.vhd - last edited: 2021-1202
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- c05ec : a 5-state-counter, has enable, has carry
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

  ENTITY c05ec IS                     -- counter, mod5, has ena+carry
   PORT (rb_i,cp_i  :  IN STD_LOGIC;
         en_i       :  IN STD_LOGIC;  -- enable counting
         co_o       : OUT STD_LOGIC);
  END c05ec;
-- --------------------------------------------------------------------

