-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- filename: uat_tb1.vhd, last edited: 2021-1202
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
  ENTITY uat_tb1 IS END uat_tb1;
-- --------------------------------------------------------------------
  ARCHITECTURE a1 OF uat_tb1 IS
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- The component/s we want to expose to test-patterns
-- --------------------------------------------------------------------
  CONSTANT c_dat  : STD_LOGIC_VECTOR(87 DOWNTO 0):= X"0000_0000_0000_0000_0000_00";
  CONSTANT c_dat1 : STD_LOGIC_VECTOR(87 DOWNTO 0):= X"3031_3233_3435_3637_3839_3E";
-- --------------------------------------------------------------------

  COMPONENT uat IS
   PORT (rb_i     :  IN STD_LOGIC;
         cp_i     :  IN STD_LOGIC;
          d_i     :  IN STD_LOGIC_VECTOR(87 DOWNTO 0);
         dv_i     :  IN STD_LOGIC;
         br_i     :  IN STD_LOGIC;
         txd_o    : OUT STD_LOGIC;
         trg_o    : OUT STD_LOGIC);
  END COMPONENT;

-- --------------------------------------------------------------------
-- The connecting cables between components to wire up our DUT
-----------------------------------------------------------------------
  SIGNAL  rb_s  : STD_LOGIC;                         -- RESET
  SIGNAL  cp_s  : STD_LOGIC;                         -- SYS-CLOCK
  SIGNAL   d_s  : STD_LOGIC_VECTOR(87 DOWNTO 0);     -- 11x8 Bits
  SIGNAL  dv_s  : STD_LOGIC;
  SIGNAL  br_s  : STD_LOGIC;
  SIGNAL txd_s  : STD_LOGIC;
  SIGNAL trg_s  : STD_LOGIC;
  
--FOR ALL : c05xc USE ENTITY WORK.c05xc(a1);  -- choose architectures?
--FOR ALL : cuu1  USE ENTITY WORK.c05xc(a2);  -- cuu1 uses c05xc-a2
--FOR ALL : cuu2  USE ENTITY WORK.c05xc(a1);  -- cuu2 uses c05xc-a1
  
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
  PROCEDURE do_br (SIGNAL  br_s,cp_s : OUT STD_LOGIC) 
  IS
  BEGIN
    cp_s <= '1'; WAIT FOR 100 NS; -- SYScp => log1
    cp_s <= '0'; WAIT FOR 100 NS; -- SYScp => log0
    cp_s <= '1'; WAIT FOR 100 NS; -- SYScp => log1
    cp_s <= '0'; WAIT FOR 100 NS; -- SYScp => log0
    cp_s <= '1'; WAIT FOR 100 NS; -- SYScp => log1
    cp_s <= '0'; WAIT FOR 100 NS; -- SYScp => log0
    cp_s <= '1'; WAIT FOR 100 NS; -- SYScp => log1
    cp_s <= '0'; WAIT FOR 100 NS; -- SYScp => log0
    br_s <= '1'; WAIT FOR 100 NS; -- BAUDr => log1
    cp_s <= '1'; WAIT FOR 100 NS; -- SYScp => log1
    cp_s <= '0'; WAIT FOR 100 NS; -- SYScp => log0
    br_s <= '0'; WAIT FOR 100 NS; -- BAUDr => log0
    cp_s <= '1'; WAIT FOR 100 NS; -- SYScp => log1
    cp_s <= '0'; WAIT FOR 100 NS; -- SYScp => log0
    cp_s <= '1'; WAIT FOR 100 NS; -- SYScp => log1
    cp_s <= '0'; WAIT FOR 100 NS; -- SYScp => log0
    cp_s <= '1'; WAIT FOR 100 NS; -- SYScp => log1
    cp_s <= '0'; WAIT FOR 100 NS; -- SYScp => log0
    cp_s <= '1'; WAIT FOR 100 NS; -- SYScp => log1
    cp_s <= '0'; WAIT FOR 100 NS; -- SYScp => log0
  END do_br;  
  
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- Now we describe the "Device Under Test", (DUT)
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  BEGIN

   uu1: uat PORT MAP
        (rb_s, 
         cp_s, 
          d_s, 
         dv_s, 
         br_s, 
         txd_s, 
         trg_s
        );
-- --------------------------------------------------------------------
-- FIRST STEP, VERY IMPORTANT: Define ---> ALL <--- Primary Inputs
-- --------------------------------------------------------------------
  runxxx: PROCESS                         -- FIRST STEP, VERY IMPORTANT
   BEGIN                                  -- Define ALL Primary Inputs
    rb_s <= '1';                          -- Init reset cable
    cp_s <= '0';                          -- Init Syscp 
     d_s <= c_dat;                        -- Here we use a constant
    dv_s <= '0'; 
    br_s <= '0'; 
    
    WAIT FOR 100 NS;
    ASSERT (d_s = c_dat) REPORT "RB1??" SEVERITY WARNING;
-- --------------------------------------------------------------------
    rb_s <= '0';                                -- Start a RESET-CYCLE
    WAIT FOR 100 NS;                            -- Start a RESET-CYCLE
    ASSERT (d_s = c_dat) REPORT "RB2?" SEVERITY WARNING;
    rb_s <= '1';                                -- End the RESET-CYCLE
    WAIT FOR 100 NS;                            -- End the RESET-CYCLE
    ASSERT (d_s = c_dat) REPORT "RB3?" SEVERITY WARNING;
-- --------------------------------------------------------------------
    FOR dotimes IN 1 TO 20                      -- Do Test-Pattern now
    LOOP
     cp_s<='1'; WAIT FOR 100 NS;
     cp_s<='0'; WAIT FOR 100 NS;
    END LOOP;
    
    d_s  <= c_dat1; WAIT FOR 100 NS; do_cp(cp_s); do_cp(cp_s);
    dv_s <=    '1'; WAIT FOR 100 NS; do_cp(cp_s);
    dv_s <=    '0'; WAIT FOR 100 NS; do_cp(cp_s);
   
    FOR dotimes IN 1 TO 200                     -- Count an generate
    LOOP                                        -- Carry-Outputs
     do_br(br_s,cp_s); WAIT FOR 100 NS;
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

