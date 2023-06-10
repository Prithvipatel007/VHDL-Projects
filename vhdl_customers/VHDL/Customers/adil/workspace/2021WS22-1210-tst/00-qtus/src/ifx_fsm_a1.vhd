-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- THIS FILE: ifx_fsm_a1.vhd - last edited: 2021-1202
-- --------------------------------------------------------------------
-- The FSM for the Serial Input Section
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
-- --------------------------------------------------------------------
  ARCHITECTURE a1 OF ifx_fsm IS      -- 
                          
  TYPE state_name IS (wt00_st,  -- enter, when rb_i='0'
                       stx_st,  -- stx_i changed from log0 to 1
                        sh_st,  -- enable shift register, shift right
                       sdv_st,  -- wait, until sdv_i is log0
                       chk_st,  -- entered, when sdv_i is back to log0
                        dv_st   -- entered, when stx='0'
                     );

  SIGNAL now_st,nxt_st : state_name;
-- --------------------------------------------------------------------
  BEGIN 
-- --------------------------------------------------------------------
  clkd: PROCESS (rb_i,cp_i)
  BEGIN
   IF (rb_i='0') THEN now_st <= wt00_st;
   ELSIF (cp_i'EVENT AND cp_i='1') THEN now_st <= nxt_st;
   END IF;
  END PROCESS clkd;

-- --------------------------------------------------------------------
-- State Transition Table                                            --
-- --------------------------------------------------------------------
-- Actual: stx sdv   Next:                                           --
-- --------------------------------------------------------------------
-- wt00_st  0   X  wt00_st   entered after reset, waiting for stx=1  --
--          1   X   stx_st                                           -- 
-- --------------------------------------------------------------------
--  stx_st  0   X  wt00_st   exit when stx=0                         --
--          1   0   sdx_st   wait here for sdv=1                     --
--          1   1   sde_st   sdv=1, next must be shift enable        --
-- --------------------------------------------------------------------
--   sh_st  X   X   sdv_st   shift enable                            --
-- --------------------------------------------------------------------
--  sdv_st  0   0  wt00_st   unexpected stx=0, exit                  --
--          0   1  wt00_st   unexpected stx=0, exit                  --
--          1   0   chk_st   stx active, sdv=0, got a bit, check end --
--          1   1   sdv_st   stx active, wait here for sdv=0         --
-- --------------------------------------------------------------------
--  chk_st  0   0    dv_st   last bit found, goto dv_st, set flag    --
--          0   1  wt00_st   unexpected stx=0, bad timing            --
--          1   0   chk_st   wait here for a possible next valid bit --
--          1   1   stx_st   got a new sdv=1, we have a new bit      --
-- --------------------------------------------------------------------
--   dv_st  X   X   stx_st   frame done, set dv and enter wt00_st    --
-- --------------------------------------------------------------------
  st_trans: PROCESS (now_st,stx_i,sdv_i)
  BEGIN
   nxt_st <= wt00_st;
   CASE now_st IS
-- --------------------------------------------------------------------
    WHEN wt00_st   => 
      IF (stx_i ='1')    THEN nxt_st <=  stx_st;   -- stx=1: SOF
      ELSE                    nxt_st <= wt00_st;   -- wait for stx=1
      END IF;
-- --------------------------------------------------------------------
    WHEN stx_st    => 
      IF    (stx_i ='0') THEN nxt_st <= wt00_st;   -- unexpected stx
      ELSIF (sdv_i ='1') THEN nxt_st <=   sh_st;   -- valid bit now
      ELSE                    nxt_st <=  stx_st;   -- wait for valid
      END IF;
-- --------------------------------------------------------------------
    WHEN sh_st     =>         nxt_st <=  sdv_st;   -- shift enable
-- --------------------------------------------------------------------  
    WHEN sdv_st    =>
      IF    ((stx_i='0')AND(sdv_i='0')) THEN nxt_st<=wt00_st; -- badstx
      ELSIF ((stx_i='0')AND(sdv_i='1')) THEN nxt_st<=wt00_st; -- badstx
      ELSIF ((stx_i='1')AND(sdv_i='0')) THEN nxt_st<= chk_st; -- bitdne
      ELSIF ((stx_i='1')AND(sdv_i='1')) THEN nxt_st<= sdv_st; -- wait
      END IF;
-- --------------------------------------------------------------------
    WHEN chk_st    =>
      IF    ((stx_i='0')AND(sdv_i='0')) THEN nxt_st<=  dv_st; -- all done 
      ELSIF ((stx_i='0')AND(sdv_i='1')) THEN nxt_st<=wt00_st; -- timing? 
      ELSIF ((stx_i='1')AND(sdv_i='0')) THEN nxt_st<= chk_st; -- more, wait!
      ELSIF ((stx_i='1')AND(sdv_i='1')) THEN nxt_st<= stx_st; -- next bit!
      END IF;
-- --------------------------------------------------------------------
    WHEN dv_st     =>                        nxt_st <= wt00_st; -- dv=1
-- --------------------------------------------------------------------
   END CASE;
  END PROCESS st_trans;
-- --------------------------------------------------------------------
  ausgabe : PROCESS (now_st)
  BEGIN
    CASE now_st IS
     WHEN  wt00_st =>  sde_o <= '0'; dv_o <= '0';
     WHEN   stx_st =>  sde_o <= '0'; dv_o <= '0';
     WHEN    sh_st =>  sde_o <= '1'; dv_o <= '0';
     WHEN   sdv_st =>  sde_o <= '0'; dv_o <= '0';	
     WHEN   chk_st =>  sde_o <= '0'; dv_o <= '0';	
     WHEN    dv_st =>  sde_o <= '0'; dv_o <= '1';	
    END CASE;
  END PROCESS ausgabe;
  end a1;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

