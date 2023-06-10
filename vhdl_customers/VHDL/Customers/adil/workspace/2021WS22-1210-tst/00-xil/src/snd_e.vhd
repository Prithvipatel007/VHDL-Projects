-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- file: snd_e.vhd, last modified: 2021-1208
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
--USE WORK.is21WS22_pack.ALL;
-- --------------------------------------------------------------------
ENTITY snd IS
   PORT (rb_i     :  IN STD_LOGIC;                   -- Reset, when low
         cp_i     :  IN STD_LOGIC;                   -- Syscp
          d_i     :  IN STD_LOGIC_VECTOR(7 DOWNTO 0);-- start, when 'E'
         dv_i     :  IN STD_LOGIC;                   -- d_i is valid
         s0_i     :  IN STD_LOGIC;                   -- 00:2min,01:3min
         s1_i     :  IN STD_LOGIC;                   -- 10:4min,11:5min
        ci1_i     :  IN STD_LOGIC;                   -- one second
        snd_o     : OUT STD_LOGIC);                  -- sound output
  END snd;
-- --------------------------------------------------------------------
   
