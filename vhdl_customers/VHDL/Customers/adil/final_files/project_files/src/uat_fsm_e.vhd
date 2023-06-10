-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- filename: uat_fsm_e.vhd, last modified: 2021-1202
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- some GHDL-cmds:   ghdl -s xxx.vhd  : Syntax check
--                   ghdl -a xxx.vhd  : Assembles file xxx.vhd
--                   ghdl -e xyz      : Elaborates xyz, no packages
-- prepare waveform: ghdl -r xxx_TB1 --wave=xxx_TB1_wave.ghw
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
 -- ---------------------------------------------------------------------------
  ENTITY uat_fsm IS
  PORT (rb_i   :  IN STD_LOGIC;                     -- Reset, active low
        cp_i   :  IN STD_LOGIC;                     -- Syscp, @ 12MHz
        dv_i   :  IN STD_LOGIC;                     -- Have new RTC or GPS-Data
        br_i   :  IN STD_LOGIC;                     -- Baud-Rate to ena Counter
       dne_i   :  IN STD_LOGIC;                     -- Last Bit transmitted
       ldr_o   : OUT STD_LOGIC;                     -- enable register load
       clr_o   : OUT STD_LOGIC;                     -- clear Bit-Counters
       inc_o   : OUT STD_LOGIC                      -- next Bit, inc count
       );
  END uat_fsm;
-- ----------------------------------------------------------------------------

