-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- filename: c16ecl_a1.vhd, last modified: 2021-1202
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
  ARCHITECTURE a1 OF c16ecl
  IS
  CONSTANT  s00 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "00000";
  CONSTANT  s01 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "00001";
  CONSTANT  s02 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "00010";
  CONSTANT  s03 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "00011";
  CONSTANT  s04 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "00100";
  CONSTANT  s05 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "00101";
  CONSTANT  s06 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "00110";
  CONSTANT  s07 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "00111";
  CONSTANT  s08 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "01000";
  CONSTANT  s09 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "01001";
  CONSTANT  s10 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "01010";
  CONSTANT  s11 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "01011";
  CONSTANT  s12 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "01100";
  CONSTANT  s13 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "01101";
  CONSTANT  s14 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "01110";
  CONSTANT  s15 : STD_LOGIC_VECTOR ( 4 DOWNTO 0) := "11111";
   
  SIGNAL   st_s : STD_LOGIC_VECTOR ( 4 DOWNTO 0);
--
  BEGIN
  ccc16: PROCESS(rb_i,cp_i,en_i,cl_i)
  BEGIN
  IF (rb_i='0') THEN st_s <= s00;  
  ELSIF (cp_i='1' AND cp_i'EVENT)
  THEN
  IF (cl_i='1')
   THEN st_s <=  s00;
   ELSE
    CASE st_s IS
     WHEN  s00    => IF (en_i ='1') THEN st_s <=  s01; END IF;
     WHEN  s01    => IF (en_i ='1') THEN st_s <=  s02; END IF;
     WHEN  s02    => IF (en_i ='1') THEN st_s <=  s03; END IF;
     WHEN  s03    => IF (en_i ='1') THEN st_s <=  s04; END IF;
     WHEN  s04    => IF (en_i ='1') THEN st_s <=  s05; END IF;
     WHEN  s05    => IF (en_i ='1') THEN st_s <=  s06; END IF;
     WHEN  s06    => IF (en_i ='1') THEN st_s <=  s07; END IF;
     WHEN  s07    => IF (en_i ='1') THEN st_s <=  s08; END IF;
     WHEN  s08    => IF (en_i ='1') THEN st_s <=  s09; END IF;
     WHEN  s09    => IF (en_i ='1') THEN st_s <=  s10; END IF;
     WHEN  s10    => IF (en_i ='1') THEN st_s <=  s11; END IF;
     WHEN  s11    => IF (en_i ='1') THEN st_s <=  s12; END IF;
     WHEN  s12    => IF (en_i ='1') THEN st_s <=  s13; END IF;
     WHEN  s13    => IF (en_i ='1') THEN st_s <=  s14; END IF;
     WHEN  s14    => IF (en_i ='1') THEN st_s <=  s15; END IF;
     WHEN  s15    => IF (en_i ='1') THEN st_s <=  s00; END IF;
     WHEN OTHERS => st_s <=  s00;
    END CASE;
    END IF;
  END IF;
  END PROCESS ccc16;
 
  co_o <= en_i AND st_s(4);
   q_o <= st_s(3 DOWNTO 0);
   
  END a1;
-- --------------------------------------------------------------------

