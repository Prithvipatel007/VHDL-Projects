
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- --------------------------------------------------------------------
ENTITY gen_snd_e IS
 PORT (rb_i     :  IN STD_LOGIC;                   -- Reset, when low
       cp_i     :  IN STD_LOGIC;                   -- Syscp
       off_btn_i:  IN STD_LOGIC;
        d_i     :  IN STD_LOGIC_VECTOR(7 DOWNTO 0);-- start, when 'E'
       dv_i     :  IN STD_LOGIC;                   -- d_i is valid
       s0_i     :  IN STD_LOGIC;                   -- 00:2min,01:3min
       s1_i     :  IN STD_LOGIC;                   -- 10:4min,11:5min
      ci1_i     :  IN STD_LOGIC;                   -- one second
      sig_1k_i  :   IN  STD_LOGIC;                 -- 1k signal
      snd_o     : OUT STD_LOGIC);                  -- sound output
END gen_snd_e;
 
