-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- THIS FILE: c06eqc_a1.vhd - last edited: 2021-1201
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
-- --------------------------------------------------------------------
  ARCHITECTURE a1 OF c06eqc
  IS
  CONSTANT  st0 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";
  CONSTANT  st1 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "001";
  CONSTANT  st2 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "010";
  CONSTANT  st3 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "011";
  CONSTANT  st4 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "100";
  CONSTANT  st5 : STD_LOGIC_VECTOR (2 DOWNTO 0) := "101";
   
  SIGNAL  st_s : STD_LOGIC_VECTOR (2 DOWNTO 0); 
-- --------------------------------------------------------------------
  BEGIN
-- --------------------------------------------------------------------
cccx: PROCESS(rb_i,cp_i,en_i)
-- --------------------------------------------------------------------
  BEGIN
  IF (rb_i='0') THEN st_s <= st0;  
  ELSIF (cp_i='1' AND cp_i'EVENT)
  THEN
    CASE st_s IS
     WHEN  st0    => IF (en_i ='1') THEN st_s <=  st1; END IF;
     WHEN  st1    => IF (en_i ='1') THEN st_s <=  st2; END IF;
     WHEN  st2    => IF (en_i ='1') THEN st_s <=  st3; END IF;
     WHEN  st3    => IF (en_i ='1') THEN st_s <=  st4; END IF;
     WHEN  st4    => IF (en_i ='1') THEN st_s <=  st5; END IF;
     WHEN  st5    => IF (en_i ='1') THEN st_s <=  st0; END IF;
     WHEN OTHERS => st_s <=  st0;
    END CASE;
  END IF;
  END PROCESS cccx;
-- --------------------------------------------------------------------
  qx_o <= st_s(2) ;
  co_o <= en_i AND st_s(2) AND (NOT st_s(1)) AND st_s(0);
-- --------------------------------------------------------------------
  END a1;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------


