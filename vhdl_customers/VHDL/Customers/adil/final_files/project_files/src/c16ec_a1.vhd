-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- THIS FILE: c16ec_a1.vhd - last edited: 2021-1201
-- --------------------------------------------------------------------
-- c16ec :  a 16-state-counter, has enable, has carry
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
  ARCHITECTURE a1 OF c16ec
  IS
  CONSTANT  st00 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
  CONSTANT  st01 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00001";
  CONSTANT  st02 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00010";
  CONSTANT  st03 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00011";
  CONSTANT  st04 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00100";
  CONSTANT  st05 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00101";
  CONSTANT  st06 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00110";
  CONSTANT  st07 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00111";
  CONSTANT  st08 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "01000";
  CONSTANT  st09 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "01001";
  CONSTANT  st10 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "01010";
  CONSTANT  st11 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "01011";
  CONSTANT  st12 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "01100";
  CONSTANT  st13 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "01101";
  CONSTANT  st14 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "01110";
  CONSTANT  st15 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "11111";
   
  SIGNAL    st_s : STD_LOGIC_VECTOR ( 4 DOWNTO 0);
-- --------------------------------------------------------------------
  BEGIN
-- --------------------------------------------------------------------
  cccx: PROCESS(rb_i,cp_i,en_i)
  BEGIN
  IF (rb_i='0') THEN st_s <= st00;  
  ELSIF (cp_i='1' AND cp_i'EVENT)
  THEN
    CASE st_s IS
     WHEN  st00    => IF (en_i ='1') THEN st_s <=  st01; END IF;
     WHEN  st01    => IF (en_i ='1') THEN st_s <=  st02; END IF;
     WHEN  st02    => IF (en_i ='1') THEN st_s <=  st03; END IF;
     WHEN  st03    => IF (en_i ='1') THEN st_s <=  st04; END IF;
     WHEN  st04    => IF (en_i ='1') THEN st_s <=  st05; END IF;
     WHEN  st05    => IF (en_i ='1') THEN st_s <=  st06; END IF;
     WHEN  st06    => IF (en_i ='1') THEN st_s <=  st07; END IF;
     WHEN  st07    => IF (en_i ='1') THEN st_s <=  st08; END IF;
     WHEN  st08    => IF (en_i ='1') THEN st_s <=  st09; END IF;
     WHEN  st09    => IF (en_i ='1') THEN st_s <=  st10; END IF;
     WHEN  st10    => IF (en_i ='1') THEN st_s <=  st11; END IF;
     WHEN  st11    => IF (en_i ='1') THEN st_s <=  st12; END IF;
     WHEN  st12    => IF (en_i ='1') THEN st_s <=  st13; END IF;
     WHEN  st13    => IF (en_i ='1') THEN st_s <=  st14; END IF;
     WHEN  st14    => IF (en_i ='1') THEN st_s <=  st15; END IF;
     WHEN  st15    => IF (en_i ='1') THEN st_s <=  st00; END IF;
     WHEN OTHERS => st_s <=  st00;
    END CASE;
  END IF;
  END PROCESS cccx;
-- --------------------------------------------------------------------
  co_o <= en_i AND st_s(4);
-- --------------------------------------------------------------------
  END a1;
-- --------------------------------------------------------------------

