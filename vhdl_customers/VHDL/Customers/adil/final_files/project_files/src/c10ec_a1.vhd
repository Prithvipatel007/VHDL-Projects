-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- THIS FILE: c10ec_a1.vhd - last edited: 2021-1202
-- --------------------------------------------------------------------
-- c10ec : a 10-state-counter, has enable, has carry
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
  ARCHITECTURE a1 OF c10ec
  IS
  CONSTANT  s0 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "00000";
  CONSTANT  s1 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "00001";
  CONSTANT  s2 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "00010";
  CONSTANT  s3 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "00011";
  CONSTANT  s4 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "00100";
  CONSTANT  s5 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "01001";
  CONSTANT  s6 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "01000";
  CONSTANT  s7 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "01011";
  CONSTANT  s8 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "01010";
  CONSTANT  s9 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "11101";
   
  SIGNAL  st_s : STD_LOGIC_VECTOR ( 4 DOWNTO 0);
-- --------------------------------------------------------------------
  BEGIN
-- --------------------------------------------------------------------
  ccc10: PROCESS(rb_i,cp_i,en_i)
  BEGIN
  IF (rb_i='0') THEN st_s <= s0;  
  ELSIF (cp_i='1' AND cp_i'EVENT)
  THEN
    CASE st_s IS
     WHEN  s0    => IF (en_i ='1') THEN st_s <=  s1; END IF;
     WHEN  s1    => IF (en_i ='1') THEN st_s <=  s2; END IF;
     WHEN  s2    => IF (en_i ='1') THEN st_s <=  s3; END IF;
     WHEN  s3    => IF (en_i ='1') THEN st_s <=  s4; END IF;
     WHEN  s4    => IF (en_i ='1') THEN st_s <=  s5; END IF;
     WHEN  s5    => IF (en_i ='1') THEN st_s <=  s6; END IF;
     WHEN  s6    => IF (en_i ='1') THEN st_s <=  s7; END IF;
     WHEN  s7    => IF (en_i ='1') THEN st_s <=  s8; END IF;
     WHEN  s8    => IF (en_i ='1') THEN st_s <=  s9; END IF;
     WHEN  s9    => IF (en_i ='1') THEN st_s <=  s0; END IF;
     WHEN OTHERS => st_s <=  s0;
    END CASE;
  END IF;
  END PROCESS ccc10;
-- --------------------------------------------------------------------
  co_o <= en_i AND st_s(4);
-- --------------------------------------------------------------------
  END a1;
-- --------------------------------------------------------------------

