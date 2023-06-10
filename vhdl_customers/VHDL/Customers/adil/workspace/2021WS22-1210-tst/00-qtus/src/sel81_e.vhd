-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- file: sel81_e.vhd, last modified: 2021-1202
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

  ENTITY sel81 IS                                -- 8-bit-data-selector
   PORT (
         d_i  :  IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
         a_i  :  IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
       txd_o  : OUT STD_LOGIC
        );
  END sel81;
-- ------------------------------------------------------------
