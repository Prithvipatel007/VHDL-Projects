-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- THIS FILE: snd_a1.vhd - last edited: 2021-1208
-- --------------------------------------------------------------------
-- snd - the sound-generator
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- so far, this architecture of snd is NOT working properly
-- this file MUST be modified
-- consult the data-sheet for details
-- suggestion: draw a block-diagram of this architecture
--             and add the necessary improvements
-- --------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
  USE WORK.is21WS22_pack.ALL;
-- --------------------------------------------------------------------
  ARCHITECTURE a1 OF snd
  IS
-- --------------------------------------------------------------------
  SIGNAL  qr_s  : STD_LOGIC_VECTOR (7 DOWNTO 0); -- should be an 'E'
  SIGNAL  dt_s  : STD_LOGIC;                     -- log1, when qr_s='E'
  SIGNAL   en_s : STD_LOGIC;                     -- enable counter
  SIGNAL  ci1_s : STD_LOGIC;
  SIGNAL  co1_s : STD_LOGIC;
  SIGNAL  ci2_s : STD_LOGIC;
  SIGNAL  co2_s : STD_LOGIC;
  SIGNAL   qx_s : STD_LOGIC;                     -- goes to loudspeaker
-- --------------------------------------------------------------------
  BEGIN
 
   snd_u1 : reg08  PORT MAP (rb_i,cp_i,dv_i,d_i,qr_s);

   WITH qr_s SELECT  en_s <= '1' WHEN "01000101", '0' WHEN OTHERS;
  
   ci1_s <= s0_i AND s1_i AND en_s;              -- enables uu1
   
   uu1: c05ec   PORT MAP (rb_i,cp_i,ci1_s,co1_s);

   ci2_s<=co1_s;                                 -- carry to uu2

   uu2: c06eqc  PORT MAP (rb_i,cp_i,ci2_s,qx_s,co2_s);
  
   snd_o <=qx_s;                                 -- qx_s is "sound"
  
  END a1;
-- --------------------------------------------------------------------
-- so far, the architecture of snd is NOT working properly
-- consult the data-sheet for details
-- --------------------------------------------------------------------
