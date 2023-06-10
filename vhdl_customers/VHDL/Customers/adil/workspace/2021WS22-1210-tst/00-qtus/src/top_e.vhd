-- --------------------------------------------------------------------
-- top_e.vhd, last edited: 2021-1208
-- --------------------------------------------------------------------
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
-- --------------------------------------------------------------------
-- FPGA-chip: 10M16SAU169C8G (most likely)
-- --------------------------------------------------------------------
  LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
--USE WORK.top_pack.ALL;
-- --------------------------------------------------------------------
  ENTITY top IS                 -- FPGA-chip: 10M16SAU169C8G
  PORT ( rb_i  :  IN STD_LOGIC; -- reset, active low
         cp_i  :  IN STD_LOGIC; -- sys_cp, 12MHz
         off_btn_i:  IN STD_LOGIC; -- turn off the sound
        sdi_i  :  IN STD_LOGIC; -- serial TWI data in
        sdv_i  :  IN STD_LOGIC; -- serial TWI data valid
        stx_i  :  IN STD_LOGIC; -- serial TWI transfer
         s0_i  :  IN STD_LOGIC; -- select brewing time
         s1_i  :  IN STD_LOGIC; -- select brewing time
        snd_o  : OUT STD_LOGIC; -- sound output
        txd_o  : OUT STD_LOGIC; -- txd, to RS232-Driver
        trg_o  : OUT STD_LOGIC; -- trigger, e.g. to scope
      rb_ld_o  : OUT STD_LOGIC; -- led ld0, reset 
     sec_ld_o  : OUT STD_LOGIC; -- led ld1, one sec hi, one low
     sdi_ld_o  : OUT STD_LOGIC; -- led ld2, serial data in
     sdv_ld_o  : OUT STD_LOGIC; -- led ld3, serial data valid
     stx_ld_o  : OUT STD_LOGIC; -- led ld4, serial transfer on
      s0_ld_o  : OUT STD_LOGIC; -- led ld5, brewing time led
      s1_ld_o  : OUT STD_LOGIC; -- led ld6, brewing time led
     txd_ld_o  : OUT STD_LOGIC  -- led ld7, at txd-pin
       );
  END top;
-- --------------------------------------------------------------------
-----------------------------------------------------------------------
-- FPGA-PIN-ASSIGNMENT. SUBJECT TO BE CHANGED AT ANY TIME
-- POWER SUPPLY: VCC5V to J2,Pin 13 (has priority) or via USB-Bus
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- 12MHz:    H6          +-------------------+
-- Optcp:    G5          +     --USB--       +
-- USER-Btn: E6          +     --USB--     o +1  LED1 A8
--                       +     -------     o +2  LED2 A9
--         J4 JTAG       +                 o +3  LED3 A11
--         +1 GROUND     +                 o +4  LED4 A10
--         +2 E5 JTAGEN  +                 o +5  LED5 B10
--         +3 G2 TCK     +                 o +6  LED6 C9
--         +4 F6 TDO     +                 o +7  LED7 C10
--         +5 F5 TDI     +                 o +8  LED8 D8
--         +6 G1 TMS     +                   +
--                    J1 + J3            J4  J2
--              D3 AREF 1+ +1 AIN  D2    +1  +1  +5V
--              E1 AIN0 2+ +2            +2  +2  VIN--<--EXT.VCC.IN
--              C2 AIN1 3+ +3 AIN7 B1    +3  +3  +3.3V
--              C1 AIN2 4+               +4  +4  GROUND
--              D1 AIN3 5+               +5  +5  RES E7
--              E3 AIN4 6+               +6  +6  D14 G12
--              F1 AIN5 7+                   +7  D13 H13
--              E4 AIN6 8+                   +8  D12 H10
--              H8 D0   9+                   +9  D11 J10
--             K10 D1  10+                   +10 D10 K12
--              H5 D2  11+                   +11 D9  K11
--              H4 D3  12+                   +12 D8  J13
--              J1 D4  13+   V G M M L M     +13 D7  J12
--              J2 D5  14+   C N 1 2 3 3     +14 D6  L12
--                           C D         
--                           6 5 4 3 2 1 
--                  PIO_04   + + + + + + J6 PIO_01
--                  PIO_08   + + + + + +    PIO_05
--                           1 1 1      
--                           2 1 0 9 8 7
--                           V G        
--  PART: 10M16SAU169C8G     C N K K N N
--                           C D 1 2 2 3
-- --------------------------------------------------------------------
-- ATTRIBUTE chip_pin of PIN_E7    : SIGNAL IS  "E7"; -- S1_RESET_BTN
-- ATTRIBUTE chip_pin of cp_i      : SIGNAL IS  "G5"; -- CLK_EXT
-- --------------------------------------------------------------------
-- ATTRIBUTE chip_pin              : string;
-- ATTRIBUTE chip_pin of    rb_i   : SIGNAL IS  "E6"; -- S2_USR_BTN;
-- ATTRIBUTE chip_pin of    cp_i   : SIGNAL IS  "H6"; -- CLK_12MHz
-- --------------------------------------------------------------------
-- J2-Side
-- --------------------------------------------------------------------
-- ATTRIBUTE chip_pin of rb0_ld_o : SIGNAL IS  "A8"; -- LED1
-- ATTRIBUTE chip_pin of sec_ld_o : SIGNAL IS  "A9"; -- LED2
-- ATTRIBUTE chip_pin of sdi_ld_o : SIGNAL IS "A11"; -- LED3
-- ATTRIBUTE chip_pin of sdv_ld_o : SIGNAL IS "A10"; -- LED4
-- ATTRIBUTE chip_pin of stx_ld_o : SIGNAL IS "B10"; -- LED5
-- ATTRIBUTE chip_pin of  s0_ld_o : SIGNAL IS  "C9"; -- LED6
-- ATTRIBUTE chip_pin of  s1_ld_o : SIGNAL IS "C10"; -- LED7 
-- ATTRIBUTE chip_pin of txd_ld_o : SIGNAL IS  "D8"; -- LED8
-- --------------------------------------------------------------------
-- VCC, 5.0V-Power to the connector       5.0VCC             (J2-14) 
-- VCC, User Power into the MAX1000       3.3VCC             (J2-13)  
-- VCC, 3.3V-Power to the connector       3.3VCC             (J2-12)  
-- GROUND                                 GROUND             (J2-11)  
-- RESET, E7, not to be used              RESET              (J2-10)
-- ATTRIBUTE chip_pin of G12_xxx : SIGNAL IS "G12"; -- D14;  (J2- 9)
-- ATTRIBUTE chip_pin of H13_xxx : SIGNAL IS "H13"; -- D13;  (J2- 8)
-- ATTRIBUTE chip_pin of H10_xxx : SIGNAL IS "H10"; -- D12;  (J2- 7)
-- ATTRIBUTE chip_pin of J10_xxx : SIGNAL IS "J10"; -- D11;  (J2- 6)
-- ATTRIBUTE chip_pin of K12_xxx : SIGNAL IS "K12"; -- D10;  (J2- 5)
-- ATTRIBUTE chip_pin of K11_xxx : SIGNAL IS "K11"; --  D9;  (J2- 4)
-- ATTRIBUTE chip_pin of J13_xxx : SIGNAL IS "J13"; --  D8;  (J2- 3)
-- ATTRIBUTE chip_pin of J12_xxx : SIGNAL IS "J12"; --  D7;  (J2- 2)
-- ATTRIBUTE chip_pin of L12_xxx : SIGNAL IS "L12"; --  D6;  (J2- 1)
-- --------------------------------------------------------------------
-- ATTRIBUTE chip_pin of PIN_B11_R : SIGNAL IS "B11"; --B11_R;  (J2- 6)
-- ATTRIBUTE chip_pin of PIN_G13_R : SIGNAL IS "G13"; --G13_R;  (J2- 7)
-- --------------------------------------------------------------------
-- J1-Side
-- --------------------------------------------------------------------
-- AREF, D3, can not be used          AREF   D3                 (J1- 1)
-- ATTRIBUTE chip_pin of sdi_i : SIGNAL IS  "E1"; -- ADC8 AIN0  (J1- 2)
-- ATTRIBUTE chip_pin of sdv_i : SIGNAL IS  "C2"; -- ADC2/AIN1  (J1- 3)
-- ATTRIBUTE chip_pin of stx_i : SIGNAL IS  "C1"; -- ADC5/AIN2  (J1- 4)
-- ATTRIBUTE chip_pin of  s0_i : SIGNAL IS  "D1"; -- ADC1/AIN3  (J1- 5)
-- ATTRIBUTE chip_pin of  s1_i : SIGNAL IS  "E3"; -- ADC3/AIN4  (J1- 6)
-- ATTRIBUTE chip_pin of  xx_i : SIGNAL IS  "F1"; -- ADC7/AIN5  (J1- 7)
-- ATTRIBUTE chip_pin of  xx_i : SIGNAL IS  "E4"; -- ADC4/AIN6  (J1- 8)
-- ATTRIBUTE chip_pin of  xxH8 : SIGNAL IS  "H8"; -- D0; Dig IO (J1- 9)
-- ATTRIBUTE chip_pin of xxK10 : SIGNAL IS "K10"; -- D1; Dig IO (J1-10)
-- ATTRIBUTE chip_pin of txd_o : SIGNAL IS  "H5"; -- D2; Dig IO (J1-11)
-- ATTRIBUTE chip_pin of trg_o : SIGNAL IS  "H4"; -- D3; Dig IO (J1-12)
-- ATTRIBUTE chip_pin of snd_o : SIGNAL IS  "J1"; -- D4; Dig IO (J1-13)
---ATTRIBUTE chip_pin of  xx_o : SIGNAL IS  "J2"; -- D5; Dig IO (J1-14)
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

