-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- THIS FILE: brg_a1.vhd - last edited: 2021-1208
-- --------------------------------------------------------------------
-- brg - the baud-rate-generator
-- --------------------------------------------------------------------
-- ATTENTION: Baud-Rate might be wired to a higher speed as 9k6
-- --------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
  USE WORK.is21WS22_pack.ALL;
-- --------------------------------------------------------------------
  ARCHITECTURE a1 OF brg
  IS
-- --------------------------------------------------------------------
  SIGNAL        ci2_s,ci3_s,ci4_s,ci5_s,ci6_s,ci7_s,ci8_s : STD_LOGIC;
  SIGNAL  co1_s,co2_s,co3_s,co4_s,co5_s,co6_s,co7_s,co8_s : STD_LOGIC;
  SIGNAL  qx_s : STD_LOGIC;
-- --------------------------------------------------------------------
  BEGIN                                                       -- 12.MHz
                uu1: c05xc  PORT MAP (rb_i,cp_i,co1_s);       -- 2.4MHz
  ci2_s<=co1_s; uu2: c05ec  PORT MAP (rb_i,cp_i,ci2_s,co2_s); -- 480kHz
  ci3_s<=co2_s; uu3: c05ec  PORT MAP (rb_i,cp_i,ci3_s,co3_s); --  96kHz
  ci4_s<=co3_s; uu4: c10ec  PORT MAP (rb_i,cp_i,ci4_s,co4_s); -- 9.6kHz

  ci5_s<=co4_s; uu5: c10ec  PORT MAP (rb_i,cp_i,ci5_s,co5_s); --  960Hz
  ci6_s<=co5_s; uu6: c10ec  PORT MAP (rb_i,cp_i,ci6_s,co6_s); --   96Hz
  ci7_s<=co6_s; uu7: c16ec  PORT MAP (rb_i,cp_i,ci7_s,co7_s); --    6Hz
  ci8_s<=co7_s; uu8: c06eqc PORT MAP (rb_i,cp_i,ci8_s,qx_s,co8_s);--1Hz
  
  br_o <=co2_s;  -- Baud-Rate, fast test...............<-----CHECK THAT
--br_o <=co4_s;  -- Baud-Rate, 9k6.....................<-----CHECK THAT
  sec_o<= qx_s;  -- One-Second-Pulse, Ti/T=2/6.........<-----CHECK THAT
  co_o <=co8_s;  -- One-Second-Period,Ti=SysPeriod.....<-----CHECK THAT
  
  END a1;
-- --------------------------------------------------------------------
