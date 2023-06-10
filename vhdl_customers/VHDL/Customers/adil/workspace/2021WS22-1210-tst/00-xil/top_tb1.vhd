-- --------------------------------------------------------------------
-- top_tb1.vhd, last edited: 2021-1208
-- --------------------------------------------------------------------
--
-- TTTTT  H   H  EEEE      CCCC   OOO   DDDD   EEEE     I  SSSS 
--   T    H   H  E        C      O   O  D   D  E        I  S   
--   T    HHHHH  EEEE     C      O   O  D   D  EEEE     I  SSSS
--   T    H   H  E        C      O   O  D   D  E        I     S
--   T    H   H  EEEE      CCCC   OOO   DDDD   EEEE     I  SSSS
--
-- TTTTT  H   H  EEEE     DDDD    OOO    CCCC  U   U    
--   T    H   H  E        D   D  O   O  C      U   U    
--   T    HHHHH  EEEE     D   D  O   O  C      U   U     
--   T    H   H  E        D   D  O   O  C      U   U     
--   T    H   H  EEEE     DDDD    OOO    CCCC   UUU  
--
-- --------------------------------------------------------------------
-- FPGA-chip: 10M16SAU169C8G (most likely)
-- --------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
  USE WORK.is21WS22_pack.ALL;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  ENTITY top_tb1 IS END top_tb1;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  ARCHITECTURE a1 OF top_tb1 IS
-- --------------------------------------------------------------------

-- --------------------------------------------------------------------
  PROCEDURE do_cp1 (SIGNAL  cp_s : OUT STD_LOGIC) 
  IS
  BEGIN
    cp_s <= '1'; WAIT FOR 100 NS; 
    cp_s <= '0'; WAIT FOR 100 NS;
  END do_cp1;  
-- --------------------------------------------------------------------
  PROCEDURE do_cp8 (SIGNAL  cp_s : OUT STD_LOGIC) 
  IS
  BEGIN
    FOR x8times IN 1 TO 10
    LOOP  cp_s<='1'; WAIT FOR 100 NS;
          cp_s<='0'; WAIT FOR 100 NS;
    END LOOP;
  END do_cp8;  
  
-- --------------------------------------------------------------------
-- Procedure to write one bit into the shift-register:
-- --------------------------------------------------------------------
-- First: generate some (three) system-clocks
-- next:  set shift-enable=log1
-- next:  generated system-clock shifts data into shift-reg
-- next:  set shift-enable=log0 (otherwise you keep on shifting)
-- last:  run system-clock again
-- --------------------------------------------------------------------
  PROCEDURE wr_sr (SIGNAL  cp_s : OUT STD_LOGIC;
                   SIGNAL sdv_s : OUT STD_LOGIC) 
  IS
  BEGIN
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
   sdv_s <= '1'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
   sdv_s <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
    cp_s <= '1'; WAIT FOR 100 NS; cp_s  <= '0'; WAIT FOR 100 NS;
  END wr_sr;  
  -- --------------------------------------------------------------------
   SIGNAL       rb_s :  STD_LOGIC;   -- reset, active low
   SIGNAL       cp_s :  STD_LOGIC;   -- sys_cp, 12MHz
   SIGNAL      sdi_s :  STD_LOGIC;   -- serial gps data in
   SIGNAL      sdv_s :  STD_LOGIC;   -- serial gps data valid
   SIGNAL      stx_s :  STD_LOGIC;   -- serial gps transfer
   SIGNAL       s0_s :  STD_LOGIC;   -- select brewing time
   SIGNAL       s1_s :  STD_LOGIC;   -- select brewing time
   SIGNAL      snd_s :  STD_LOGIC;   -- sound output
   SIGNAL      txd_s :  STD_LOGIC;   -- txd, to RS232-Driver
   SIGNAL      trg_s :  STD_LOGIC;   -- txd, to RS232-Driver
-- --------------------------------------------------------------------
   SIGNAL    rb_ld_s :  STD_LOGIC;   -- led ld0, reset 
   SIGNAL   sec_ld_s :  STD_LOGIC;   -- led ld1, Ti/T
   SIGNAL   sdi_ld_s :  STD_LOGIC;   -- led ld2, echo sdi
   SIGNAL   sdv_ld_s :  STD_LOGIC;   -- led ld3, echo sdv
   SIGNAL   stx_ld_s :  STD_LOGIC;   -- led ld4, echo stx
   SIGNAL    s0_ld_s :  STD_LOGIC;   -- led ld5, brewing time
   SIGNAL    s1_ld_s :  STD_LOGIC;   -- led ld6, brewing time
   SIGNAL   txd_ld_s :  STD_LOGIC;   -- led ld7, at txd-pin
-- --------------------------------------------------------------------
-- FOR ALL : top USE ENTITY WORK.top(ghdl);
   FOR ALL : top USE ENTITY WORK.top(qtus);
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  BEGIN

  uu1: top     
       PORT MAP                     -- FPGA-chip: 10M16SAU169C8G
       (  rb_s, -- :  IN STD_LOGIC; -- reset, active low
          cp_s, -- :  IN STD_LOGIC; -- sys_cp, 12MHz
         sdi_s, -- :  IN STD_LOGIC; -- serial TWI data in
         sdv_s, -- :  IN STD_LOGIC; -- serial TWI data valid
         stx_s, -- :  IN STD_LOGIC; -- serial TWI transfer
          s0_s, -- :  IN STD_LOGIC; -- select brewing time
          s1_s, -- :  IN STD_LOGIC; -- select brewing time
         snd_s, -- : OUT STD_LOGIC; -- sound output
         txd_s, -- : OUT STD_LOGIC; -- txd, to RS232-Driver
         trg_s, -- : OUT STD_LOGIC; -- trigger, e.g. to scope
       rb_ld_s, -- : OUT STD_LOGIC; -- led ld0, reset 
      sec_ld_s, -- : OUT STD_LOGIC; -- led ld1, one sec hi, one low
      sdi_ld_s, -- : OUT STD_LOGIC; -- led ld2, serial data in
      sdv_ld_s, -- : OUT STD_LOGIC; -- led ld3, serial data valid
      stx_ld_s, -- : OUT STD_LOGIC; -- led ld4, serial transfer on
       s0_ld_s, -- : OUT STD_LOGIC; -- led ld5, brewing time led
       s1_ld_s, -- : OUT STD_LOGIC; -- led ld6, brewing time led
      txd_ld_s  -- : OUT STD_LOGIC  -- led ld7, at txd-pin
       );
-- --------------------------------------------------------------------
  runpatt : PROCESS
  BEGIN
-- --------------------------------------------------------------------
     rb_s <= '1';  -- Primary input
     cp_s <= '0';  -- SysCP
    sdi_s <= '0';  -- serial TWI data in
    sdv_s <= '0';  -- serial TWI data valid
    stx_s <= '0';  -- serial TWI transfer
     s0_s <= '1';  -- select brewing time
     s1_s <= '1';  -- select brewing time
     WAIT FOR 100 NS;
-- --------------------------------------------------------------------
     rb_s <= '0'; WAIT FOR 100 NS; rb_s <= '1'; WAIT FOR 100 NS;
-- --------------------------------------------------------------------
     cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;
     cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;
-- --------------------------------------------------------------------
     do_cp1(cp_s) ;
     do_cp8(cp_s) ;
     stx_s   <= '1'; WAIT FOR 100 NS; do_cp8(cp_s);  
      
      sdi_s  <= '1';   WAIT FOR 100 NS; do_cp8(cp_s); wr_sr(cp_s,sdv_s);
      sdi_s  <= '0';   WAIT FOR 100 NS; do_cp8(cp_s); wr_sr(cp_s,sdv_s);
      sdi_s  <= '1';   WAIT FOR 100 NS; do_cp8(cp_s); wr_sr(cp_s,sdv_s);
      sdi_s  <= '0';   WAIT FOR 100 NS; do_cp8(cp_s); wr_sr(cp_s,sdv_s);
      sdi_s  <= '0';   WAIT FOR 100 NS; do_cp8(cp_s); wr_sr(cp_s,sdv_s);
      sdi_s  <= '0';   WAIT FOR 100 NS; do_cp8(cp_s); wr_sr(cp_s,sdv_s);
      sdi_s  <= '1';   WAIT FOR 100 NS; do_cp8(cp_s); wr_sr(cp_s,sdv_s);
      sdi_s  <= '0';   WAIT FOR 100 NS; do_cp8(cp_s); wr_sr(cp_s,sdv_s);
        
     stx_s   <= '0'; WAIT FOR 100 NS; do_cp8(cp_s);

    FOR xxtimes IN 1 TO 100
    LOOP  do_cp8(cp_s);
    END LOOP;
       
    WAIT;
  END PROCESS runpatt;

-- --------------------------------------------------------------------
  END a1;
-- --------------------------------------------------------------------

