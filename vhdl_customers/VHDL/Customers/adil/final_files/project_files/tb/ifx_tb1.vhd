-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- filename: ifx_tb1.vhd, last edited: 2021-1202
-- --------------------------------------------------------------------
-- some GHDL-cmds:   ghdl -s xxx.vhd  : syntax check
--                   ghdl -a xxx.vhd  : assembles file xxx.vhd
--                   ghdl -e xyz      : elaborates xyz, not packages
-- prepare waveform: ghdl -r xxx_TB1 --wave=xxx.ghw
-- show waveform:    gtkwave xxx.ghw
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
--USE WORK.ifx_pack.ALL;
-- --------------------------------------------------------------------
  ENTITY ifx_tb1 IS END ifx_tb1;
-- --------------------------------------------------------------------
  ARCHITECTURE a1 OF ifx_tb1 IS
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- These are the components we will need in our circuit
-- --------------------------------------------------------------------
  COMPONENT ifx IS
  PORT (rb_i   :  IN STD_LOGIC;                     -- rb, active low
        cp_i   :  IN STD_LOGIC;                     -- Syscp, @ 12MHz
       sdi_i   :  IN STD_LOGIC;                     -- Serial Data 
       sdv_i   :  IN STD_LOGIC;                     -- sdi valid
       stx_i   :  IN STD_LOGIC;                     -- transmitting now
         q_o   : OUT STD_LOGIC_VECTOR(87 DOWNTO 0); -- data
        dv_o   : OUT STD_LOGIC);                    -- data valid
  END COMPONENT;
  
-- --------------------------------------------------------------------
-- Connections from component to component
-----------------------------------------------------------------------
  CONSTANT c_q0 : STD_LOGIC_VECTOR(87 DOWNTO 0):= X"0000_0000_0000_0000_0000_00";

  SIGNAL  rb_s  : STD_LOGIC;                      -- RESET
  SIGNAL  cp_s  : STD_LOGIC;                      -- SYSCP
  SIGNAL sdi_s  : STD_LOGIC;                      -- serial data
  SIGNAL sdv_s  : STD_LOGIC;                      -- serial data valid
  SIGNAL stx_s  : STD_LOGIC;                      -- serial active 
  SIGNAL   q_s  : STD_LOGIC_VECTOR(87 DOWNTO 0);  -- received data
  SIGNAL  dv_s  : STD_LOGIC;                      -- data valid
  SIGNAL syn_s  : STD_LOGIC;                      -- SYNC Pulse

--FOR ALL : sr08e USE ENTITY WORK.sr08e(a1);      -- architectures?
--FOR ALL : reg8e USE ENTITY WORK.reg8e(a1);      -- architectures?
-- --------------------------------------------------------------------
-- Nice to have: a procedure to generate one single system-clock pulse:
-- --------------------------------------------------------------------
  PROCEDURE do_cp (SIGNAL  cp_s : OUT STD_LOGIC) 
  IS
  BEGIN
    cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;
  END do_cp;  
  
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
-- --------------------------------------------------------------------
-- Now we describe the "Device Under Test", (DUT)
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  BEGIN
   
  uu1: ifx
       PORT MAP
       (rb_s, -- :  IN STD_LOGIC;                     -- rb, active low
        cp_s, -- :  IN STD_LOGIC;                     -- Syscp, @12MHz
       sdi_s, -- :  IN STD_LOGIC;                     -- sdi, serial in
       sdv_s, -- :  IN STD_LOGIC;                     -- sdi valid
       stx_s, -- :  IN STD_LOGIC;                     -- receiving
         q_s, -- : OUT STD_LOGIC_VECTOR(87 DOWNTO 0); -- received data
        dv_s  -- : OUT STD_LOGIC                      -- q_s is valid
       );
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- Now we start to verify the function of our circuit description.
-- NOTE: The process "runxxx" has an EMPTY process sensitivity-list
-- NOTE: It will repeat itself over and over again.
-- NOTE: It will never stop and run forever and again
-- NOTE: Use the WAIT-statement to stop it 
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- The following code is for pattern generation
-- FIRST STEP, VERY IMPORTANT: Define ---> ALL <--- Primary Inputs
-- --------------------------------------------------------------------
  
  runxxx: PROCESS
   BEGIN
     rb_s <= '1';   -- Alle inputs initialisieren
     cp_s <= '0';   -- Alle inputs initialisieren
    sdi_s <= '0';   -- Alle inputs initialisieren
    sdv_s <= '0';   -- Alle inputs initialisieren
    stx_s <= '0';   -- Alle inputs initialisieren
    WAIT FOR 100 NS;
    ASSERT (q_s=X"0000_0000_0000_0000_0000_00")
    REPORT "RB1?" SEVERITY WARNING;
    
-- --------------------------------------------------------------------
-- Generate a RESET-CYCLE
-- ---------------------
     rb_s <= '0';
     WAIT FOR 100 NS;
     ASSERT (q_s=X"0000_0000_0000_0000_0000_11") 
     REPORT "RB2?" SEVERITY WARNING;
--   ASSERT (q_s=X"0000_0000_0000_0000_0000_00") 
--   REPORT "RB3?" SEVERITY WARNING;
     ASSERT (q_s=c_q0) REPORT "RB3?" SEVERITY WARNING;
     rb_s <= '1';
     WAIT FOR 100 NS;
     ASSERT (q_s=X"0000_0000_0000_0000_0000_00") REPORT "RB4?" SEVERITY WARNING;
     
-- --------------------------------------------------------------------
-- Some basic statements. We shift a pattern into the shift-register
-- --------------------------------------------------------------------
     cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;
     cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;
--
    sdi_s <= '1';
    sdv_s <= '1'; WAIT FOR 100 NS;
     cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;
--
    sdi_s <= '0';
    sdv_s <= '0'; WAIT FOR 100 NS;
     cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;
     cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;
     cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;
     cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;
     
    sdv_s <= '1'; WAIT FOR 100 NS;
     cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;
    sdv_s <= '0'; WAIT FOR 100 NS;
     cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;
      
-- --------------------------------------------------------------------
-- Example: Data via TWI: 10:01:20E<CR><LF>
-- Binary:  00110001,00110000,00100000,
--          00110000,00110001,00100000,
--          00110010,00110000,01000101,
--          00001101,00001010
-- --------------------------------------------------------------------
    stx_s <= '1'; WAIT FOR 100 NS;
     cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;
     cp_s <= '1'; WAIT FOR 100 NS; cp_s <= '0'; WAIT FOR 100 NS;  
-- --------------------------------------------------------------------
    syn_s <= '1';  WAIT FOR 100 NS;
    syn_s <= '0';  WAIT FOR 100 NS;
    sdi_s <= '1';  wr_sr(cp_s,sdv_s); -- 0x31, 00110001, LSB, Byte 01
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
-- --------------------------------------------------------------------
    syn_s <= '1';  WAIT FOR 100 NS;
    syn_s <= '0';  WAIT FOR 100 NS;
    sdi_s <= '0';  wr_sr(cp_s,sdv_s); -- 0x30, 00110000, LSB, Byte 02
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
-- --------------------------------------------------------------------
    syn_s <= '1';  WAIT FOR 100 NS;
    syn_s <= '0';  WAIT FOR 100 NS;
    sdi_s <= '0';  wr_sr(cp_s,sdv_s); -- 0x20, 00100000, LSB, Byte 03
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
-- --------------------------------------------------------------------
    syn_s <= '1';  WAIT FOR 100 NS;
    syn_s <= '0';  WAIT FOR 100 NS;
    sdi_s <= '0';  wr_sr(cp_s,sdv_s); -- 0x30, 00110000, LSB, Byte 04
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
-- --------------------------------------------------------------------
    syn_s <= '1';  WAIT FOR 100 NS;
    syn_s <= '0';  WAIT FOR 100 NS;
    sdi_s <= '1';  wr_sr(cp_s,sdv_s); -- 0x31, 00110001, LSB, Byte 05
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
-- --------------------------------------------------------------------
    syn_s <= '1';  WAIT FOR 100 NS;
    syn_s <= '0';  WAIT FOR 100 NS;
    sdi_s <= '0';  wr_sr(cp_s,sdv_s); -- 0x20, 00100000, LSB, Byte 06
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
-- --------------------------------------------------------------------
    syn_s <= '1';  WAIT FOR 100 NS;
    syn_s <= '0';  WAIT FOR 100 NS;
    sdi_s <= '0';  wr_sr(cp_s,sdv_s); -- 0x32, 00110010, LSB, Byte 07
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
-- --------------------------------------------------------------------
    syn_s <= '1';  WAIT FOR 100 NS;
    syn_s <= '0';  WAIT FOR 100 NS;
    sdi_s <= '0';  wr_sr(cp_s,sdv_s); -- 0x30, 00110000, LSB, Byte 08
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
-- --------------------------------------------------------------------
    syn_s <= '1';  WAIT FOR 100 NS;
    syn_s <= '0';  WAIT FOR 100 NS;
    sdi_s <= '1';  wr_sr(cp_s,sdv_s); -- 0x45, 00100101, LSB, Byte 09
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
-- --------------------------------------------------------------------
    syn_s <= '1';  WAIT FOR 100 NS;
    syn_s <= '0';  WAIT FOR 100 NS;
    sdi_s <= '1';  wr_sr(cp_s,sdv_s); -- 0x0D, 00001101, LSB, Byte 10
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
-- --------------------------------------------------------------------
    syn_s <= '1';  WAIT FOR 100 NS;
    syn_s <= '0';  WAIT FOR 100 NS;
    sdi_s <= '0';  wr_sr(cp_s,sdv_s); -- 0x0A, 00001010, LSB, Byte 11
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '1';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
    sdi_s <= '0';  wr_sr(cp_s,sdv_s);
-- --------------------------------------------------------------------
    syn_s <= '1';  WAIT FOR 100 NS;
    syn_s <= '0';  WAIT FOR 100 NS;
-- --------------------------------------------------------------------
    
-- --------------------------------------------------------------------
    FOR dotimes IN 1 TO 20
    LOOP  cp_s<='1'; WAIT FOR 100 NS;
          cp_s<='0'; WAIT FOR 100 NS;  END LOOP;
    
    stx_s <='0'; WAIT FOR 100 NS; 
    
    FOR dotimes IN 1 TO 20
    LOOP  cp_s<='1'; WAIT FOR 100 NS;
          cp_s<='0'; WAIT FOR 100 NS;  END LOOP;
    
    WAIT FOR 1000 NS;
    cp_s<='1'; WAIT FOR 100 NS; cp_s<='0'; WAIT FOR 100 NS;
-- --------------------------------------------------------------------
    WAIT;   -- !!!!!!! This avoids endless pattern-files !!!!!!!
-- --------------------------------------------------------------------
   END PROCESS runxxx;
-- --------------------------------------------------------------------
  END a1;
-- --------------------------------------------------------------------

