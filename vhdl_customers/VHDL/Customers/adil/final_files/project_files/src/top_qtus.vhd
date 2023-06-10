-- --------------------------------------------------------------------
-- top_qtus.vhd, last edited: 2021-1208
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
  ARCHITECTURE qtus OF top IS
-- --------------------------------------------------------------------
-----------------------------------------------------------------------
-- FPGA-PIN-ASSIGNMENT. SUBJECT TO BE CHANGED AT ANY TIME
-- POWER SUPPLY: VCC5V to J2,Pin 13 (has priority) or via USB-Bus
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
--
-- FOR QUARTUS ONLY. GHDL WANTS ATTRIBUTES IN THE ENTITY, IF AT ALL
--
-- --------------------------------------------------------------------
-- ATTRIBUTE chip_pin of PIN_E7    : SIGNAL IS  "E7"; -- S1_RESET_BTN
-- ATTRIBUTE chip_pin of cp_i      : SIGNAL IS  "G5"; -- CLK_EXT
-- --------------------------------------------------------------------
   ATTRIBUTE chip_pin              : string;
   ATTRIBUTE chip_pin of    rb_i   : SIGNAL IS  "E6"; -- S2_USR_BTN;
   ATTRIBUTE chip_pin of    cp_i   : SIGNAL IS  "H6"; -- CLK_12MHz
-- --------------------------------------------------------------------
-- J2-Side
-- --------------------------------------------------------------------
   ATTRIBUTE chip_pin of  rb_ld_o : SIGNAL IS  "A8"; -- LED1
   ATTRIBUTE chip_pin of sec_ld_o : SIGNAL IS  "A9"; -- LED2
   ATTRIBUTE chip_pin of sdi_ld_o : SIGNAL IS "A11"; -- LED3
   ATTRIBUTE chip_pin of sdv_ld_o : SIGNAL IS "A10"; -- LED4
   ATTRIBUTE chip_pin of stx_ld_o : SIGNAL IS "B10"; -- LED5
   ATTRIBUTE chip_pin of  s0_ld_o : SIGNAL IS  "C9"; -- LED6
   ATTRIBUTE chip_pin of  s1_ld_o : SIGNAL IS "C10"; -- LED7 
   ATTRIBUTE chip_pin of txd_ld_o : SIGNAL IS  "D8"; -- LED8
--
-- ATTRIBUTE chip_pin of L12_x : SIGNAL IS "L12"; --  D6;(J2- 1)
-- ATTRIBUTE chip_pin of J12_x : SIGNAL IS "J12"; --  D7;(J2- 2)
-- ATTRIBUTE chip_pin of J13_x : SIGNAL IS "J13"; --  D8;(J2- 3)
-- ATTRIBUTE chip_pin of K11_x : SIGNAL IS "K11"; --  D9;(J2- 4)
-- ATTRIBUTE chip_pin of K12_x : SIGNAL IS "K12"; -- D10;(J2- 5)
-- ATTRIBUTE chip_pin of J10_x : SIGNAL IS "J10"; -- D11;(J2- 6)
-- ATTRIBUTE chip_pin of H10_x : SIGNAL IS "H10"; -- D12;(J2- 7)
-- ATTRIBUTE chip_pin of H13_x : SIGNAL IS "H13"; -- D13;(J2- 8)
-- ATTRIBUTE chip_pin of G12_x : SIGNAL IS "G12"; -- D14;(J2- 9)
-- RESET, E7, not to be used            RESET   E7       (J2-10)
-- GROUND                               GROUND           (J2-11)  
-- VCC, 3.3V-Power to the connector     3.3VCC           (J2-12)  
-- VCC, User Power into the MAX1000     3.3VCC           (J2-13)  
-- VCC, 5.0V-Power to the connector     5.0VCC           (J2-14)  
-- --------------------------------------------------------------------
-- ATTRIBUTE chip_pin of PIN_B11_R : SIGNAL IS "B11"; --B11_R;  (J2- 6)
-- ATTRIBUTE chip_pin of PIN_G13_R : SIGNAL IS "G13"; --G13_R;  (J2- 7)
-- --------------------------------------------------------------------
-- J1-Side
-- --------------------------------------------------------------------
-- AREF, D3, can not be used          AREF   D3                 (J1- 1)
   ATTRIBUTE chip_pin of sdi_i : SIGNAL IS  "E1"; -- ADC8 AIN0  (J1- 2)
   ATTRIBUTE chip_pin of sdv_i : SIGNAL IS  "C2"; -- ADC2/AIN1  (J1- 3)
   ATTRIBUTE chip_pin of stx_i : SIGNAL IS  "C1"; -- ADC5/AIN2  (J1- 4)
   ATTRIBUTE chip_pin of  s0_i : SIGNAL IS  "D1"; -- ADC1/AIN3  (J1- 5)
   ATTRIBUTE chip_pin of  s1_i : SIGNAL IS  "E3"; -- ADC3/AIN4  (J1- 6)
-- ATTRIBUTE chip_pin of  xx_i : SIGNAL IS  "F1"; -- ADC7/AIN5  (J1- 7)
-- ATTRIBUTE chip_pin of  xx_i : SIGNAL IS  "E4"; -- ADC4/AIN6  (J1- 8)
-- ATTRIBUTE chip_pin of  xxH8 : SIGNAL IS  "H8"; -- D0; Dig IN (J1- 9)
-- ATTRIBUTE chip_pin of xxK10 : SIGNAL IS "K10"; -- D1; Dig IN (J1-10)
   ATTRIBUTE chip_pin of txd_o : SIGNAL IS  "H5"; -- D2; Dig IN (J1-11)
   ATTRIBUTE chip_pin of trg_o : SIGNAL IS  "H4"; -- D3; Dig IN (J1-12)
   ATTRIBUTE chip_pin of snd_o : SIGNAL IS  "J1"; -- D4; Dig IN (J1-13)
-- ATTRIBUTE chip_pin of  xx_o : SIGNAL IS  "J2"; -- D5; Dig IN (J1-14)
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  SIGNAL sec_s   : STD_LOGIC;                     -- Heartbeat
  SIGNAL sq_s    : STD_LOGIC_VECTOR(87 DOWNTO 0); -- 11x8 ASCII-Data
  SIGNAL sqv_s   : STD_LOGIC;                     -- ASCII-Data valid

  SIGNAL hb_st   : STD_LOGIC;                     -- Heartbead, co_s
  SIGNAL co_s    : STD_LOGIC;                     -- One-Second-Signal
  SIGNAL br_s    : STD_LOGIC;                     -- Baud-Rate
  SIGNAL txd_s   : STD_LOGIC;                     -- Serial, to RS232
  SIGNAL trg_s   : STD_LOGIC;                     -- RS232 active
  SIGNAL snd_s   : STD_LOGIC;                     -- to Loudspeaker
  -- ------------------------------------------------------------------
  BEGIN

   rb_ld_o  <=  rb_i;  -- Primary in2output, echo to led
   s0_ld_o  <=  s0_i;  -- Primary in2output, echo to led
   s1_ld_o  <=  s1_i;  -- Primary in2output, echo to led

-- --------------------------------------------------------------------
-- ifx - Serial input
-- --------------------------------------------------------------------
   sdi_ld_o <= sdi_i;  -- Primary in2output, echo to led
   sdv_ld_o <= sdv_i;  -- Primary in2output, echo to led
   stx_ld_o <= stx_i;  -- Primary in2output, echo to led

   uu1 : ifx PORT MAP (rb_i,cp_i,sdi_i,sdv_i,stx_i,sq_s,sqv_s);

-- --------------------------------------------------------------------
-- brg, provides sec1-carry, baudrate and heartbeat
-- --------------------------------------------------------------------
   uu2 : brg PORT MAP
         (rb_i,  -- Reset, active low
          cp_i,  -- SysClock
          co_s,  -- one-second-carry
          br_s,  -- baud-rate 9k6 (80ns log1)
          sec_s  -- one-second-pulse, Ti/T=2/6
         );
							  
   dohb : PROCESS (rb_i,cp_i,co_s)              -- one sec high,
          BEGIN                                 -- one sec low signal
           IF (rb_i='0') THEN hb_st<='0';
           ELSIf (cp_i='1' AND cp_i'EVENT)
           THEN
            IF (co_s='1') THEN hb_st <= hb_st XOR '1';
            END IF;
           END IF;
          END PROCESS dohb;

   sec_ld_o <= hb_st AND sec_s;

-- --------------------------------------------------------------------
-- uat - IC_uat, Component Type uat, to handle serial ouput
-- --------------------------------------------------------------------
   uu5 : uat PORT MAP (rb_i,cp_i,sq_s,sqv_s,br_s,txd_s,trg_s);

   trg_o    <= trg_s; -- Primary Output, log1 when txd is active
   txd_o    <= txd_s; -- Primary Output, serial out, ASCII, 9k6,8N2
   txd_ld_o <= txd_s; -- Primary Output, echo of txd to led
   
-- --------------------------------------------------------------------
-- snd - IC_sound, Component snd, generates beep
-- --------------------------------------------------------------------
   uu6: snd PORT MAP
        (rb_i,              -- Reset, when low
         cp_i,              -- Syscp
         sq_s(7 DOWNTO 0),  -- start, when 'E'       !!! WRONG BYTE !!!
        sqv_s,              -- TWI-Data is valid
         s0_i,              -- 00:2min,01:3min
         s1_i,              -- 10:4min,11:5min
         co_s,              -- one second, T=1sec;SYScp,80ns high
        snd_s               -- sound: brewing-time has elapsed
        );
  snd_o <= snd_s;
-- --------------------------------------------------------------------
  END qtus;
-- --------------------------------------------------------------------

