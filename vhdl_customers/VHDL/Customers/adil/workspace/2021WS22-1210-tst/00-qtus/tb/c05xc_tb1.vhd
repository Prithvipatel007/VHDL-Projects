-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- filename: c05xc_tb1.vhd, last edited: 2021-1201
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
  ENTITY c05xc_tb1 IS END c05xc_tb1;
-- --------------------------------------------------------------------
  ARCHITECTURE a1 OF c05xc_tb1 IS
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- The component/s we want to expose to test-patterns
-- --------------------------------------------------------------------
--COMPONENT c05xc IS   
-- PORT (rb_i,cp_i  :  IN STD_LOGIC;
--       co_o       : OUT STD_LOGIC);
--END COMPONENT;

  COMPONENT cuu1 IS PORT (rb_i,cp_i: IN STD_LOGIC; co_o: OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT cuu2 IS PORT (rb_i,cp_i  :  IN STD_LOGIC;
                          co_o       : OUT STD_LOGIC);
  END COMPONENT;
  
-- --------------------------------------------------------------------
-- The connecting cables between components to wire up our DUT
-----------------------------------------------------------------------
  SIGNAL  rb_s         : STD_LOGIC;           -- RESET
  SIGNAL  cp_s         : STD_LOGIC;           -- SYS-CLOCK
  SIGNAL  co1_s,co2_s  : STD_LOGIC;           -- CARRY OUT

--FOR ALL : c05xc USE ENTITY WORK.c05xc(a1);  -- choose architectures?
  FOR ALL : cuu1  USE ENTITY WORK.c05xc(a2);  -- cuu1 uses c05xc-a2
  FOR ALL : cuu2  USE ENTITY WORK.c05xc(a1);  -- cuu2 uses c05xc-a1
  
-- --------------------------------------------------------------------
-- Saves work: a procedure to generate one single system-clock pulse:
-- --------------------------------------------------------------------
  PROCEDURE do_cp (SIGNAL  cp_s : OUT STD_LOGIC) 
  IS
  BEGIN
    cp_s <= '1'; WAIT FOR 100 NS; -- SYScp => log1
    cp_s <= '0'; WAIT FOR 100 NS; -- SYScp => log0
  END do_cp;  
  
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- Now we describe the "Device Under Test", (DUT)
-- In this example, the DUT is the counter c05xc
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  BEGIN
   
   uu1: cuu1 PORT MAP (rb_s,cp_s,co1_s);      
   uu2: cuu2 PORT MAP (rb_s,cp_s,co2_s);

-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- These are test-patterns to verify the functionality
-- of our VHDL-circuit description.
-- NOTE: the process "runxxx" has an EMPTY process sensitivity-list
-- NOTE: that means: it will repeat itself over and over again.
-- NOTE: it never stops, runs forever and produces bit pattern-files 
-- NOTE: use the WAIT-statement to stop it 
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- The following code generates the patterns
-- FIRST STEP, VERY IMPORTANT: Define ---> ALL <--- Primary Inputs
-- --------------------------------------------------------------------
  runxxx: PROCESS
   BEGIN
    rb_s <= '1';                                -- Init all inputs
    cp_s <= '0';                                -- Init all inputs 
    WAIT FOR 100 NS;
    ASSERT (co1_s = '0') REPORT "RB1?" SEVERITY WARNING;
-- --------------------------------------------------------------------
    rb_s <= '0';                                -- Start a RESET-CYCLE
    WAIT FOR 100 NS;                            -- Start a RESET-CYCLE
    ASSERT (co1_s = '0') REPORT "RB2?" SEVERITY WARNING;
    rb_s <= '1';                                -- End the RESET-CYCLE
    WAIT FOR 100 NS;                            -- End the RESET-CYCLE
    ASSERT (co1_s = '0') REPORT "RB3?" SEVERITY WARNING;
-- --------------------------------------------------------------------
    FOR dotimes IN 1 TO 22                      -- Count an generate
    LOOP                                        -- Carry-Outputs
     cp_s<='1'; WAIT FOR 100 NS;
     cp_s<='0'; WAIT FOR 100 NS;
    END LOOP;
    
    cp_s <= '1'; WAIT FOR 100 NS;
    cp_s <= '0'; WAIT FOR 100 NS; 
-- --------------------------------------------------------------------
    WAIT;   -- !!!!!!!!!!! This avoids endless pattern-files !!!!!!!!!!
-- --------------------------------------------------------------------
   END PROCESS runxxx;
-- --------------------------------------------------------------------
  END a1;
-- --------------------------------------------------------------------

