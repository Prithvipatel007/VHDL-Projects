-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- THIS FILE: is21WS22_pack.vhd -- last edited: 2021-1208
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
  library IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
-- --------------------------------------------------------------------
-----------------------------------------------------------------------
  PACKAGE is21WS22_pack
  IS
-- --------------------------------------------------------------------
-----------------------------------------------------------------------
  COMPONENT top IS                   -- FPGA-chip: 10M16SAU169C8G
     PORT ( rb_i  :  IN STD_LOGIC;   -- reset, active low
            cp_i  :  IN STD_LOGIC;   -- sys_cp, 12MHz
           sdi_i  :  IN STD_LOGIC;   -- serial TWI data in
           sdv_i  :  IN STD_LOGIC;   -- serial TWI data valid
           stx_i  :  IN STD_LOGIC;   -- serial TWI transfer
            s0_i  :  IN STD_LOGIC;   -- select brewing time
            s1_i  :  IN STD_LOGIC;   -- select brewing time
           snd_o  : OUT STD_LOGIC;   -- sound output
           txd_o  : OUT STD_LOGIC;   -- txd, to RS232-Driver
           trg_o  : OUT STD_LOGIC;   -- trigger output, e.g. to scope
         rb_ld_o  : OUT STD_LOGIC;   -- led ld0, reset 
        sec_ld_o  : OUT STD_LOGIC;   -- led ld1, one sec hi, one low
        sdi_ld_o  : OUT STD_LOGIC;   -- led ld2, serial data in
        sdv_ld_o  : OUT STD_LOGIC;   -- led ld3, serial data valid
        stx_ld_o  : OUT STD_LOGIC;   -- led ld4, serial transfer on
         s0_ld_o  : OUT STD_LOGIC;   -- led ld5, brewing time led
         s1_ld_o  : OUT STD_LOGIC;   -- led ld6, brewing time led
        txd_ld_o  : OUT STD_LOGIC    -- led ld7, at txd-pin
          );
   END COMPONENT;
-- --------------------------------------------------------------------
   COMPONENT brg IS   
   PORT (rb_i,cp_i  :  IN STD_LOGIC;
         co_o       : OUT STD_LOGIC;  -- one-second-carry
         br_o       : OUT STD_LOGIC;  -- baud-rate 9k6 (80ns log1)
         sec_o      : OUT STD_LOGIC); -- one-second-pulse, Ti/T=2/6
   END COMPONENT;
-- --------------------------------------------------------------------
   COMPONENT ifx IS
   PORT (rb_i   :  IN STD_LOGIC;                      -- Reset atlog0
         cp_i   :  IN STD_LOGIC;                      -- Syscp, @ 12MHz
        sdi_i   :  IN STD_LOGIC;                      -- Serial Data In 
        sdv_i   :  IN STD_LOGIC;                      -- Serial valid
        stx_i   :  IN STD_LOGIC;                      -- Transmitting
          q_o   : OUT STD_LOGIC_VECTOR(87 DOWNTO 0);  -- Data
         dv_o   : OUT STD_LOGIC);                     -- Data valid
   END COMPONENT;
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
   COMPONENT snd IS
   PORT (rb_i     :  IN STD_LOGIC;                   -- Reset, when low
         cp_i     :  IN STD_LOGIC;                   -- Syscp
          d_i     :  IN STD_LOGIC_VECTOR(7 DOWNTO 0);-- start, when 'E'
         dv_i     :  IN STD_LOGIC;                   -- d_i is valid
         s0_i     :  IN STD_LOGIC;                   -- 00:2min,01:3min
         s1_i     :  IN STD_LOGIC;                   -- 10:4min,11:5min
        ci1_i     :  IN STD_LOGIC;                   -- one second
        snd_o     : OUT STD_LOGIC);                  -- sound output
   END COMPONENT;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- Components for brg
-- --------------------------------------------------------------------
-- -------------------------------------------------------------------- 
   COMPONENT c05xc IS
    PORT (rb_i,cp_i  :  IN STD_LOGIC;
          co_o       : OUT STD_LOGIC);  -- carry out
   END COMPONENT;
-- --------------------------------------------------------------------
   COMPONENT c05ec IS
    PORT (rb_i,cp_i  :  IN STD_LOGIC;
          en_i       :  IN STD_LOGIC;   -- enable counting
          co_o       : OUT STD_LOGIC);  -- carry out
   END COMPONENT;
-- --------------------------------------------------------------------
   COMPONENT c10ec IS
    PORT (rb_i,cp_i  :  IN STD_LOGIC;
          en_i       :  IN STD_LOGIC;   -- enable counting
          co_o       : OUT STD_LOGIC);  -- carry out
   END COMPONENT;
-- --------------------------------------------------------------------
   COMPONENT c16ec IS
    PORT (rb_i,cp_i  :  IN STD_LOGIC;
          en_i       :  IN STD_LOGIC;   -- enable counting
          co_o       : OUT STD_LOGIC);  -- carry out
   END COMPONENT;
-- --------------------------------------------------------------------
   COMPONENT c06eqc IS
    PORT (rb_i,cp_i  :  IN STD_LOGIC;
          en_i       :  IN STD_LOGIC;   -- enable counting
          qx_o       : OUT STD_LOGIC;   -- Ti/T-out
          co_o       : OUT STD_LOGIC);  -- carry out
   END COMPONENT;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- Components for ifx
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
   COMPONENT sr08e IS
   PORT (rb_i,cp_i :  IN STD_LOGIC;
         en_i      :  IN STD_LOGIC;
         sdi_i     :  IN STD_LOGIC;
         q_o       : OUT STD_LOGIC_VECTOR (7 DOWNTO 0) );
   END COMPONENT;
-- --------------------------------------------------------------------
   COMPONENT ifx_fsm
   IS                             -- FSM for ifx:      +----+ +----+
   PORT (rb_i   :  IN STD_LOGIC;  -- Reset_when low -->!rb_i+-+    ! 
         cp_i   :  IN STD_LOGIC;  -- Syscp, @ 12MHz -->!cp_i       !
        sdv_i   :  IN STD_LOGIC;  -- sdi valid      -->!sdv_i      !
        stx_i   :  IN STD_LOGIC;  -- Transmission   -->!stx_i      !
        sde_o   : OUT STD_LOGIC;  -- Shift Enable      !      sde_o!-->
         dv_o   : OUT STD_LOGIC); -- Data valid        !       dv_o!-->
   END COMPONENT;                 --                   +-----------+
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
--  Components for uat
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
   COMPONENT uat_fsm IS
   PORT (rb_i   :  IN STD_LOGIC;                   -- Reset, active low
         cp_i   :  IN STD_LOGIC;                   -- Syscp, @ 12MHz
         dv_i   :  IN STD_LOGIC;                   -- have new data
         br_i   :  IN STD_LOGIC;                   -- Baud-Rate
        dne_i   :  IN STD_LOGIC;                   -- Last Bit done
        ldr_o   : OUT STD_LOGIC;                   -- load register
        clr_o   : OUT STD_LOGIC;                   -- clear counters
        inc_o   : OUT STD_LOGIC                    -- increment count
        );
   END COMPONENT;
-- --------------------------------------------------------------------
   COMPONENT c16ecl IS   -- counter, mod16, has ena,clear,carry,q_o
   PORT (rb_i   :  IN STD_LOGIC;
         cp_i   :  IN STD_LOGIC;
         en_i   :  IN STD_LOGIC;                     -- enable counting
         cl_i   :  IN STD_LOGIC;                     -- clears counter
          q_o   : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0) ;
         co_o   : OUT STD_LOGIC
        );
   END COMPONENT;
-- --------------------------------------------------------------------
   COMPONENT reg08 IS                           -- 8-bit-input-register 
    PORT (rb_i  :  IN STD_LOGIC;
          cp_i  :  IN STD_LOGIC;
          en_i  :  IN STD_LOGIC;                 -- estore data
           d_i  :  IN STD_LOGIC_VECTOR(7 DOWNTO 0);
           q_o  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
   END COMPONENT;
-- --------------------------------------------------------------------
   COMPONENT sel11 IS                            -- 11 byte-selector
    PORT (
          d_i  :  IN STD_LOGIC_VECTOR(87 DOWNTO 0);
          a_i  :  IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
          d_o  : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0)
         );
   END COMPONENT;
-- --------------------------------------------------------------------
   COMPONENT sel81 IS                            -- 8-bit-data-selector
    PORT (
          d_i  :  IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
          a_i  :  IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
        txd_o  : OUT STD_LOGIC
         );
   END COMPONENT;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
--  Components for snd, if any new components are needed
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

  END is21WS22_pack;
  
-- --------------------------------------------------------------------

