-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- filename: brg_tb1.vhd, last edited: 2021-1202
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
  ENTITY brg_tb1 IS END brg_tb1;
-- --------------------------------------------------------------------
  ARCHITECTURE a1 OF brg_tb1 IS
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- These is the component we will need in our circuit
-- --------------------------------------------------------------------
  COMPONENT brg IS   
   PORT (rb_i,cp_i  :  IN STD_LOGIC;
         co_o       : OUT STD_LOGIC;
         br_o       : OUT STD_LOGIC;
         sec_o      : OUT STD_LOGIC);
  END COMPONENT;
  
-- --------------------------------------------------------------------
-- Connections between components of device(s) under test 
-----------------------------------------------------------------------
  SIGNAL  rb_s   : STD_LOGIC;               -- reset, aktive low
  SIGNAL  cp_s   : STD_LOGIC;               -- sysclock, 12MHz
  SIGNAL  co_s   : STD_LOGIC;               -- carry, T=1sec
  SIGNAL  br_s   : STD_LOGIC;               -- Baud-Rate, 9k6
  SIGNAL  sec_s  : STD_LOGIC;               -- one-second-pulse to LED

  FOR ALL : brg USE ENTITY WORK.brg(a1);    -- several architectures?

-- --------------------------------------------------------------------
-- Nice to have: a procedure to generate one single system-clock pulse
-- --------------------------------------------------------------------
  PROCEDURE do_cp (SIGNAL  cp_s : OUT STD_LOGIC) 
  IS
  BEGIN
    cp_s <= '1'; WAIT FOR 100 NS; -- SYScp => log1
    cp_s <= '0'; WAIT FOR 100 NS; -- SYScp => log0
  END do_cp;  
  
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- Now we describe the "Device(s) Under Test", (DUT)
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  BEGIN
   
   brg_u1: brg PORT MAP (rb_s,cp_s,co_s,br_s,sec_s);

-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- NEXT: Test-Patterns to verify the circuit description.
-- NOTE: The process "runxxx" has an EMPTY process sensitivity-list
-- NOTE: That means: it will repeat itself over and over again.
-- NOTE: It will never stop and run forever and again
-- NOTE: Use the WAIT-statement to stop the process 
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- THE FOLLOWING CODE IS TO GENERATE TEST-PATTERN
-- --------------------------------------------------------------------
-- FIRST STEP, VERY IMPORTANT: Define ---> ALL <--- Primary Inputs
-- --------------------------------------------------------------------
  runxxx: PROCESS
   BEGIN
    rb_s <= '1';   -- Alle inputs initialisieren
    cp_s <= '0';   -- Alle inputs initialisieren
    WAIT FOR 100 NS;
    ASSERT (co_s = '0') REPORT "RB1?" SEVERITY WARNING;
    
-- --------------------------------------------------------------------
-- SECOND STEP: Generate a RESET-CYCLE
-- --------------------------------------------------------------------
    rb_s <= '0';
    WAIT FOR 100 NS;
    ASSERT (co_s = '0') REPORT "RB2?" SEVERITY WARNING;
    rb_s <= '1';
    WAIT FOR 100 NS;
    ASSERT (co_s = '0') REPORT "RB3?" SEVERITY WARNING;
     
-- --------------------------------------------------------------------
-- THIRD: PATTERNS to test the CIRCUIT
-- --------------------------------------------------------------------
-- PROBLEM: if you want to see activities on sec_o,
--          you will have extremly long simulation times and
--          produce very, very, very long trace-files.
--          So, we need some clever ideas to solve that problem!
--          To increase the loop-count is NO GOOD IDEA!
-- --------------------------------------------------------------------
    FOR dotimes IN 1 TO 100000        -- suggestion: do not touch that!
    LOOP
    cp_s<='1'; WAIT FOR 100 NS; cp_s<='0'; WAIT FOR 100 NS;
    END LOOP;
    
    cp_s<='1'; WAIT FOR 100 NS; cp_s<='0'; WAIT FOR 100 NS; 

-- --------------------------------------------------------------------
    WAIT;          -- !!!!!!! This avoids endless pattern-files !!!!!!!
-- --------------------------------------------------------------------
   END PROCESS runxxx;
-- --------------------------------------------------------------------
  END a1;
-- --------------------------------------------------------------------

