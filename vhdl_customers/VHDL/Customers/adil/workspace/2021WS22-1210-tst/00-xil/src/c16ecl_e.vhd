-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- filename: c16ecl_e.vhd, last modified: 2021-1202
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

  ENTITY c16ecl IS   -- counter, mod16, has ena,clear, has carry, has q_o
  PORT (rb_i       :  IN STD_LOGIC;
        cp_i       :  IN STD_LOGIC;
        en_i       :  IN STD_LOGIC;           -- enable counting
        cl_i       :  IN STD_LOGIC;           -- clears counter
         q_o       : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0) ;
        co_o       : OUT STD_LOGIC
       );
  END c16ecl;
-- ------------------------------------------------------------


