-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
-- filename: uat_fsm_a1.vhd, last modified: 2021-1202
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
-- some GHDL-cmds:   ghdl -s xxx.vhd  : Syntax check
--                   ghdl -a xxx.vhd  : Assembles file xxx.vhd
--                   ghdl -e xyz      : Elaborates xyz, no packages
-- prepare waveform: ghdl -r xxx_TB1 --wave=xxx_TB1_wave.ghw
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
--USE WORK.uat_pack.ALL;
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
  ARCHITECTURE ar1 OF uat_fsm IS
--                                                            -- +------------+
  TYPE state_name IS (wtdv_st,ldrg_st,wtb0_st,cinc_st,wt2_st);-- !            !
  SIGNAL now_st,nxt_st : state_name;                          -- !rb_i        !
-- ------------------------------------------------------------- !cp_i        !
  BEGIN                                                       -- !dv_i   ldr_o!
-- ------------------------------------------------------------- !br_i   clr_o!
  clkd: PROCESS (rb_i,cp_i)                                   -- !dne_i  inc_o!
  BEGIN                                                       -- !            !
   IF (rb_i='0') THEN now_st <= wtdv_st;                      -- +------------+
   ELSIF (cp_i'EVENT AND cp_i='1') THEN now_st <= nxt_st;
   END IF;
  END PROCESS clkd;
-- ----------------------------------------------------------------------------
  st_trans: PROCESS (now_st,dv_i,br_i,dne_i)
  begin
    nxt_st <= wtdv_st;
    CASE now_st IS
     WHEN wtdv_st  => IF  (dv_i ='1') THEN nxt_st <= ldrg_st; -- new 16x8-DATA
	              ELSE                 nxt_st <= wtdv_st; -- no, wait
                      END IF;
     WHEN ldrg_st  =>                      nxt_st <= wtb0_st; -- save 16x8-DATA

     WHEN wtb0_st  => IF  (br_i ='1') THEN nxt_st <= cinc_st; -- baudrate ok?
                      ELSE                 nxt_st <= wtb0_st; -- no, wait
                      END IF;
     WHEN cinc_st  =>                      nxt_st <= wt2_st;  -- bit to txd!
     WHEN wt2_st   => IF  (dne_i='1') THEN nxt_st <= wtdv_st; -- all done?
                      ELSE                 nxt_st <= wtb0_st; -- no, more to go
                      END IF;     
    END CASE;
  END PROCESS st_trans;
-- ----------------------------------------------------------------------------
  ausgabe : PROCESS (now_st)
  BEGIN
    CASE now_st IS
     WHEN wtdv_st => clr_o <= '1'; inc_o  <= '0'; ldr_o <= '0';
     WHEN ldrg_st => clr_o <= '0'; inc_o  <= '0'; ldr_o <= '1';
     WHEN wtb0_st => clr_o <= '0'; inc_o  <= '0'; ldr_o <= '0';
     WHEN cinc_st => clr_o <= '0'; inc_o  <= '1'; ldr_o <= '0';	
     WHEN wt2_st  => clr_o <= '0'; inc_o  <= '0'; ldr_o <= '0';	
    END CASE;
  END PROCESS ausgabe;
-- ----------------------------------------------------------------------------
  end ar1;
-- ----------------------------------------------------------------------------
