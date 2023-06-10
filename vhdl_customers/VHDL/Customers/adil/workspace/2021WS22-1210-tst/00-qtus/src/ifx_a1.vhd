-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
-- THIS FILE: ifx_a1.vhd - last edited: 2021-1208
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
-- ifx- The Serial Input Section
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
  USE WORK.is21WS22_pack.ALL;
-- ----------------------------------------------------------------------------
  ARCHITECTURE a1 OF ifx IS

  SIGNAL sde_s   : STD_LOGIC;                       -- SHIFT Enable
  SIGNAL  qs_s   : STD_LOGIC_VECTOR(87 DOWNTO 0);   -- Data from shift-register
  SIGNAL  dv_s   : STD_LOGIC;                       -- Data valid

  FOR ALL : sr08e USE ENTITY WORK.sr08e(a1);
-- ----------------------------------------------------------------------------
  BEGIN

   s_fsm :ifx_fsm PORT MAP (rb_i,cp_i,sdv_i,stx_i,sde_s,dv_s);
   sr_u11:  sr08e PORT MAP (rb_i,cp_i,sde_s,   sdi_i, qs_s(87 DOWNTO 80) );--0
   sr_u10:  sr08e PORT MAP (rb_i,cp_i,sde_s,qs_s(80), qs_s(79 DOWNTO 72) );--0
   sr_u09:  sr08e PORT MAP (rb_i,cp_i,sde_s,qs_s(72), qs_s(71 DOWNTO 64) );--:
   sr_u08:  sr08e PORT MAP (rb_i,cp_i,sde_s,qs_s(64), qs_s(63 DOWNTO 56) );--0
   sr_u07:  sr08e PORT MAP (rb_i,cp_i,sde_s,qs_s(56), qs_s(55 DOWNTO 48) );--0
   sr_u06:  sr08e PORT MAP (rb_i,cp_i,sde_s,qs_s(48), qs_s(47 DOWNTO 40) );--:
   sr_u05:  sr08e PORT MAP (rb_i,cp_i,sde_s,qs_s(40), qs_s(39 DOWNTO 32) );--0
   sr_u04:  sr08e PORT MAP (rb_i,cp_i,sde_s,qs_s(32), qs_s(31 DOWNTO 24) );--0
   sr_u03:  sr08e PORT MAP (rb_i,cp_i,sde_s,qs_s(24), qs_s(23 DOWNTO 16) );--E
   sr_u02:  sr08e PORT MAP (rb_i,cp_i,sde_s,qs_s(16), qs_s(15 DOWNTO  8) );--LF
   sr_u01:  sr08e PORT MAP (rb_i,cp_i,sde_s,qs_s( 8), qs_s( 7 DOWNTO  0) );--CR
 
   q_o  <=  qs_s;
   dv_o <=  dv_s;

  END a1;
-- ----------------------------------------------------------------------------

