-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- THIS FILE: c05xc_a1.vhd - last edited: 2021-1202
-- --------------------------------------------------------------------
-- c05xc : a 5-state-counter, no enable, has carry
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- some GHDL-cmds:   ghdl -s xxx.vhd  : Syntax check
--                   ghdl -a xxx.vhd  : Assembles file xxx.vhd
--                   ghdl -e xyz      : Elaborates xyz
-- prepare waveform: ghdl -r xxx_TB1 --wave=xxx_TB1_wave.ghw
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- check page 27, Counter, no enable, USAGE: Time-Base-Unit
-- carry is calculated using a boolean equation
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
-- --------------------------------------------------------------------
  ARCHITECTURE a1 OF c05xc
  IS
  CONSTANT  s0 : STD_LOGIC_VECTOR ( 2 DOWNTO 0) := "000";
  CONSTANT  s1 : STD_LOGIC_VECTOR ( 2 DOWNTO 0) := "001";
  CONSTANT  s2 : STD_LOGIC_VECTOR ( 2 DOWNTO 0) := "010";
  CONSTANT  s3 : STD_LOGIC_VECTOR ( 2 DOWNTO 0) := "011";
  CONSTANT  s4 : STD_LOGIC_VECTOR ( 2 DOWNTO 0) := "100"; -- carry
   
  SIGNAL  st_s : STD_LOGIC_VECTOR ( 2 DOWNTO 0);
-- --------------------------------------------------------------------
  BEGIN
-- --------------------------------------------------------------------
  ccc05: PROCESS(rb_i,cp_i)
  BEGIN
  IF (rb_i='0') THEN st_s <= s0;  
  ELSIF (cp_i='1' AND cp_i'EVENT)
  THEN
    CASE st_s IS
     WHEN  s0    => st_s <=  s1;
     WHEN  s1    => st_s <=  s2;
     WHEN  s2    => st_s <=  s3;
     WHEN  s3    => st_s <=  s4;
     WHEN  s4    => st_s <=  s0;
     WHEN OTHERS => st_s <=  s0;
    END CASE;
  END IF;
  END PROCESS ccc05;
-- --------------------------------------------------------------------
  co_o <= st_s(2) AND (NOT st_s(1)) AND (NOT st_s(0)) ;
-- --------------------------------------------------------------------
  END a1;
-- --------------------------------------------------------------------

