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
  SIGNAL  ci3_s : STD_LOGIC;
  SIGNAL  co3_s : STD_LOGIC;
  SIGNAL  ci4_s : STD_LOGIC;
  SIGNAL  co4_s : STD_LOGIC;
  SIGNAL  ci5_s : STD_LOGIC;
  SIGNAL  co5_s : STD_LOGIC;
  SIGNAL  ci6_s : STD_LOGIC;
  SIGNAL  co6_s : STD_LOGIC;
  SIGNAL  snd_s : STD_LOGIC;-- goes to loudspeaker
  SIGNAL   qx_s : STD_LOGIC;                     
-- --------------------------------------------------------------------
  BEGIN
 
   snd_u1 : reg08  PORT MAP (rb_i,cp_i,dv_i,d_i,qr_s);

   WITH qr_s SELECT  en_s <= '1' WHEN "01000101", '0' WHEN OTHERS;
  
   ci1_s <= s0_i AND s1_i AND en_s;              -- enables uu1
   
   uu1: c05ec   PORT MAP (rb_i,cp_i,ci1_s,co1_s);

   ci2_s<=co1_s;                                 -- carry to uu2

   uu2: c05ec   PORT MAP (rb_i,cp_i,ci2_s,co2_s);
   
   ci3_s<=co2_s;  
   
   uu3: c05ec   PORT MAP (rb_i,cp_i,ci3_s,co3_s);
   
   ci4_s<=co3_s;  
   
   uu4: c05ec   PORT MAP (rb_i,cp_i,ci4_s,co4_s);
   
   ci5_s<=co4_s;  
   
   uu5: c05ec   PORT MAP (rb_i,cp_i,ci5_s,co5_s);
   
   ci6_s<=co5_s;  

   uu6: c06eqc  PORT MAP (rb_i,cp_i,ci6_s,qx_s,co6_s);

   gen_sound : gen_snd_e PORT MAP (rb_i, cp_i, off_btn_i, d_i, dv_i, s0_i, s1_i, ci1_i, qx_s, snd_s);
  
   snd_o <=snd_s;                                 -- snd_s is "sound"
  
  END a1;
