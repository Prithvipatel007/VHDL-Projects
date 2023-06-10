-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
-- THIS FILE: ifx_fsm_e.vhd - last edited: 2021-1202
-- ----------------------------------------------------------------------------
-- ifx_fsm: The Serial Input Section, ifx_fsm
-- ----------------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
-- ----------------------------------------------------------------------------
  ENTITY ifx_fsm
  IS                              -- FSM for ifx:            +-----+ +-----+
  PORT (rb_i   :  IN STD_LOGIC;   -- Reset, active low    -->!rb_i +-+     ! 
        cp_i   :  IN STD_LOGIC;   -- Syscp, @ 12MHz       -->!cp_i         !
       sdv_i   :  IN STD_LOGIC;   -- Serial Data valid    -->!sdv_i        !
       stx_i   :  IN STD_LOGIC;   -- Serial Transmission  -->!stx_i        !
       sde_o   : OUT STD_LOGIC;   -- Shift Enable            !        sde_o!-->
        dv_o   : OUT STD_LOGIC);  -- All SR-Data valid       !         dv_o!-->
  END ifx_fsm;                    --                         +-------------+
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

