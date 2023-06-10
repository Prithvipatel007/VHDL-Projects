-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- THIS FILE: c05ec_a1.vhd - last edited: 2021-1202
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
-- --------------------------------------------------------------------
  ARCHITECTURE a1 OF c05ec
  IS
  CONSTANT  s0 : STD_LOGIC_VECTOR ( 2 DOWNTO 0) := "000";
  CONSTANT  s1 : STD_LOGIC_VECTOR ( 2 DOWNTO 0) := "001";
  CONSTANT  s2 : STD_LOGIC_VECTOR ( 2 DOWNTO 0) := "010";
  CONSTANT  s3 : STD_LOGIC_VECTOR ( 2 DOWNTO 0) := "011";
  CONSTANT  s4 : STD_LOGIC_VECTOR ( 2 DOWNTO 0) := "100";
   
  SIGNAL  st_s : STD_LOGIC_VECTOR ( 2 DOWNTO 0); 
-- --------------------------------------------------------------------
  BEGIN
  ccc05: PROCESS(rb_i,cp_i,en_i)
-- --------------------------------------------------------------------
  BEGIN
  IF (rb_i='0') THEN st_s <= s0;  
  ELSIF (cp_i='1' AND cp_i'EVENT)
  THEN
    CASE st_s IS
     WHEN  s0    => IF (en_i ='1') THEN st_s <=  s1; END IF;
     WHEN  s1    => IF (en_i ='1') THEN st_s <=  s2; END IF;
     WHEN  s2    => IF (en_i ='1') THEN st_s <=  s3; END IF;
     WHEN  s3    => IF (en_i ='1') THEN st_s <=  s4; END IF;
     WHEN  s4    => IF (en_i ='1') THEN st_s <=  s0; END IF;
     WHEN OTHERS => st_s <=  s0;
    END CASE;
  END IF;
  END PROCESS ccc05;
-- --------------------------------------------------------------------
  co_o <= en_i AND st_s(2) AND (NOT st_s(1)) AND (NOT st_s(0)) ;
-- --------------------------------------------------------------------
  END a1;
-- --------------------------------------------------------------------
