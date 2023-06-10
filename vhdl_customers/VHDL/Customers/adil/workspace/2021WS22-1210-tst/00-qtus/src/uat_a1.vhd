-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- filename: uat_a1.vhd, last modified: 2021-1208
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
  USE WORK.is21WS22_pack.ALL;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  ARCHITECTURE a1 OF uat IS
-- --------------------------------------------------------------------
--FOR ALL : a1x_c05xc USE ENTITY WORK.c05xc (a1);
--FOR ALL : c05xc USE ENTITY WORK.c05xc (a2);    -- <======= check that
-- --------------------------------------------------------------------
  SIGNAL dr_s  : STD_LOGIC_VECTOR(87 DOWNTO 0);  -- 11 byte input to
  SIGNAL qr_s  : STD_LOGIC_VECTOR(87 DOWNTO 0);  -- storage register
  SIGNAL db_s  : STD_LOGIC_VECTOR( 7 DOWNTO 0);  -- byte for txd

  SIGNAL ldr_s : STD_LOGIC;                      -- load register

  SIGNAL inc_s : STD_LOGIC;                      -- inc counters
  SIGNAL clr_s : STD_LOGIC;                      -- clr counters
  SIGNAL cq_s  : STD_LOGIC_VECTOR(7 DOWNTO 0);   -- bit adress cnt
  SIGNAL co0_s : STD_LOGIC;                      -- carry, bit counter
  SIGNAL co1_s : STD_LOGIC;                      -- carry, byte-counter
  SIGNAL dne_s : STD_LOGIC;                      -- we are done

  SIGNAL txd_s : STD_LOGIC;                      -- serial data out

-- --------------------------------------------------------------------
  BEGIN  
   dr_s <= d_i;
   rg_u11 : reg08
   PORT MAP (rb_i,cp_i,ldr_s,dr_s(87 DOWNTO 80),qr_s(87 DOWNTO 80) );
   rg_u10 : reg08 
   PORT MAP (rb_i,cp_i,ldr_s,dr_s(79 DOWNTO 72),qr_s(79 DOWNTO 72) );
   rg_u09 : reg08 
   PORT MAP (rb_i,cp_i,ldr_s,dr_s(71 DOWNTO 64),qr_s(71 DOWNTO 64) );
   rg_u08 : reg08 
   PORT MAP (rb_i,cp_i,ldr_s,dr_s(63 DOWNTO 56),qr_s(63 DOWNTO 56) );
   rg_u07 : reg08 
   PORT MAP (rb_i,cp_i,ldr_s,dr_s(55 DOWNTO 48),qr_s(55 DOWNTO 48) );
   rg_u06 : reg08 
   PORT MAP (rb_i,cp_i,ldr_s,dr_s(47 DOWNTO 40),qr_s(47 DOWNTO 40) );
   rg_u05 : reg08 
   PORT MAP (rb_i,cp_i,ldr_s,dr_s(39 DOWNTO 32),qr_s(39 DOWNTO 32) );
   rg_u04 : reg08 
   PORT MAP (rb_i,cp_i,ldr_s,dr_s(31 DOWNTO 24),qr_s(31 DOWNTO 24) );
   rg_u03 : reg08 
   PORT MAP (rb_i,cp_i,ldr_s,dr_s(23 DOWNTO 16),qr_s(23 DOWNTO 16) );
   rg_u02 : reg08 
   PORT MAP (rb_i,cp_i,ldr_s,dr_s(15 DOWNTO  8),qr_s(15 DOWNTO  8) );
   rg_u01 : reg08 
   PORT MAP (rb_i,cp_i,ldr_s,dr_s( 7 DOWNTO  0),qr_s( 7 DOWNTO  0) );

   usbyte : sel11 PORT MAP (qr_s,cq_s(7 DOWNTO 4), db_s); -- 11to1 Byte
   usbits : sel81 PORT MAP (db_s,cq_s(3 DOWNTO 0),txd_s); --  8to1 Bit

  ufsm : uat_fsm PORT MAP
          (rb_i,             -- Primary Input, Reset, active low
           cp_i,             -- Primary Input, Syscp, @ 12MHz
           dv_i,             -- dv_i, new reg-data
           br_i,             -- br_i, Baudrate
          dne_s,             -- dne_i, fsm, last Bit transmitted
          ldr_s,             -- ldr_o, fsm, register load
          clr_s,             -- clr_o, fsm, clears Bit-Counter
          inc_s);            -- inc_o, fsm, next Bit, inc count
        
  uadr0 : c16ecl PORT MAP
          (rb_i,cp_i, 
           inc_s,clr_s,
           cq_s(3 DOWNTO 0), -- adress, 1 of 8 txd-bits
           co0_s);
          
  uadr1 : c16ecl PORT MAP
          (rb_i,cp_i,
           co0_s,clr_s,
           cq_s(7 DOWNTO 4), -- adress, 1 of 11 bytes
           co1_s);                       -- stop at 10110000
           
  dne_s <= cq_s(7) AND (NOT cq_s(6) ) AND cq_s(5) AND cq_s(4);

  txd_o <= txd_s;            -- serial data out, TTL, 8N2,9k2
  trg_o <= NOT clr_s;        -- 000/111, slope at start-bit

-- --------------------------------------------------------------------
  END a1;
-- --------------------------------------------------------------------   
 

