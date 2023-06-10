ARCHITECTURE top_level_a OF top_level_e is
    
    COMPONENT brd_generator_e IS PORT(
        rb_i, cp_i, sel_i               :  IN STD_LOGIC;
        brd_o, clk_1k_o ,sec_o, secp_o  :  OUT STD_LOGIC
    );
    END COMPONENT brd_generator_e;

    COMPONENT track_timer_e IS 
        PORT(
            rb_i        :   IN STD_LOGIC;
            cp_i        :   IN STD_LOGIC;
            sec_i       :   IN STD_LOGIC;
            hour_0_o    :   OUT std_logic_vector(3 downto 0);
            hour_1_o    :   OUT std_logic_vector(3 downto 0);
            minutes_1_o :   OUT std_logic_vector(3 downto 0);
            minutes_0_o :   OUT std_logic_vector(3 downto 0);
            seconds_1_o :   OUT std_logic_vector(3 downto 0);
            seconds_0_o :   OUT std_logic_vector(3 downto 0)
            );
    END COMPONENT track_timer_e;

    COMPONENT debouncer_e IS
        PORT(
            rb_i : IN STD_LOGIC;
            cp_i : IN STD_LOGIC;
            rs_i : IN STD_LOGIC;
            en_i : IN STD_LOGIC;
            s_o  : OUT STD_LOGIC);
    END COMPONENT debouncer_e;

    COMPONENT tsc_e IS
        PORT(
            --
            --  Inputs
            --
            rb_i    : IN STD_LOGIC;
            cp_i    : IN STD_LOGIC;
            dr_i    : IN STD_LOGIC;
            sx_i    : IN STD_LOGIC;     -- sensor input
            
            hour_0_i    :   IN std_logic_vector(3 downto 0);
            hour_1_i    :   IN std_logic_vector(3 downto 0);
            minutes_1_i :   IN std_logic_vector(3 downto 0);
            minutes_0_i :   IN std_logic_vector(3 downto 0);
            seconds_1_i :   IN std_logic_vector(3 downto 0);
            seconds_0_i :   IN std_logic_vector(3 downto 0);

            m0_i    : IN STD_LOGIC;     -- mode 0
            m1_i    : IN STD_LOGIC;     -- mode 1
            m2_i    : IN STD_LOGIC;     -- mode 2
            m3_i    : IN STD_LOGIC;     -- mode 3
            --
            -- Outputs
            --
            hour_0_o    :   OUT std_logic_vector(3 downto 0);
            hour_1_o    :   OUT std_logic_vector(3 downto 0);
            minutes_1_o :   OUT std_logic_vector(3 downto 0);
            minutes_0_o :   OUT std_logic_vector(3 downto 0);
            seconds_1_o :   OUT std_logic_vector(3 downto 0);
            seconds_0_o :   OUT std_logic_vector(3 downto 0);

            dv_o          : OUT STD_LOGIC;
            m0_state_o    : OUT STD_LOGIC;
            m1_state_o    : OUT STD_LOGIC;
            m2_state_o    : OUT STD_LOGIC;
            m3_state_o    : OUT STD_LOGIC
            );
    END COMPONENT tsc_e;

    COMPONENT ata_e IS
        PORT(
            --
            --  Inputs
            --
            rb_i    : IN STD_LOGIC;
            cp_i    : IN STD_LOGIC;
            clk_1k_i: IN STD_LOGIC;
            -- current time
            c_hour_0_i    :   IN std_logic_vector(3 downto 0);
            c_hour_1_i    :   IN std_logic_vector(3 downto 0);
            c_minutes_1_i :   IN std_logic_vector(3 downto 0);
            c_minutes_0_i :   IN std_logic_vector(3 downto 0);
            c_seconds_1_i :   IN std_logic_vector(3 downto 0);
            c_seconds_0_i :   IN std_logic_vector(3 downto 0);
            -- toa input time
            hour_0_i    :   IN std_logic_vector(3 downto 0);
            hour_1_i    :   IN std_logic_vector(3 downto 0);
            minutes_1_i :   IN std_logic_vector(3 downto 0);
            minutes_0_i :   IN std_logic_vector(3 downto 0);
            seconds_1_i :   IN std_logic_vector(3 downto 0);
            seconds_0_i :   IN std_logic_vector(3 downto 0);
            dv_i        : IN STD_LOGIC;
            m0_state_i    : IN STD_LOGIC;
            m1_state_i    : IN STD_LOGIC;
            m2_state_i    : IN STD_LOGIC;
            m3_state_i    : IN STD_LOGIC;
            sec_q_i         : IN STD_LOGIC;
            off_btn_i       : IN STD_LOGIC;
            --
            -- Outputs
            --
            toc_hour_0_o    :   OUT std_logic_vector(3 downto 0);
            toc_hour_1_o    :   OUT std_logic_vector(3 downto 0);
            toc_minutes_1_o :   OUT std_logic_vector(3 downto 0);
            toc_minutes_0_o :   OUT std_logic_vector(3 downto 0);
            toc_seconds_1_o :   OUT std_logic_vector(3 downto 0);
            toc_seconds_0_o :   OUT std_logic_vector(3 downto 0);
            toa_valid_o   : OUT STD_LOGIC;
            dr_o          : OUT STD_LOGIC;
            snd_o         : OUT STD_LOGIC;
            snd_led_o     : OUT STD_LOGIC        
            );
    END COMPONENT ata_e;

    COMPONENT toa_ascii_e IS
        PORT(
            toc_hour_0_i    :   IN std_logic_vector(3 downto 0);
            toc_hour_1_i    :   IN std_logic_vector(3 downto 0);
            toc_minutes_1_i :   IN std_logic_vector(3 downto 0);
            toc_minutes_0_i :   IN std_logic_vector(3 downto 0);
            toc_seconds_1_i :   IN std_logic_vector(3 downto 0);
            toc_seconds_0_i :   IN std_logic_vector(3 downto 0);

            toc_hour_0_o    :   OUT std_logic_vector(7 downto 0);
            toc_hour_1_o    :   OUT std_logic_vector(7 downto 0);
            toc_minutes_1_o :   OUT std_logic_vector(7 downto 0);
            toc_minutes_0_o :   OUT std_logic_vector(7 downto 0);
            toc_seconds_1_o :   OUT std_logic_vector(7 downto 0);
            toc_seconds_0_o :   OUT std_logic_vector(7 downto 0);
            cr_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            lf_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT toa_ascii_e;

    COMPONENT transmission_e IS 
        PORT(
            rb_i        :   IN STD_LOGIC;
            cp_i        :   IN STD_LOGIC;
            hour_0_i    : IN std_logic_vector(7 downto 0);
            hour_1_i    : IN std_logic_vector(7 downto 0);
            minutes_1_i : IN std_logic_vector(7 downto 0);
            minutes_0_i : IN std_logic_vector(7 downto 0);
            seconds_1_i : IN std_logic_vector(7 downto 0);
            seconds_0_i : IN std_logic_vector(7 downto 0);
            cr_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);			
            lf_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            brd_i       :   IN STD_LOGIC;
            dv_i        :   IN STD_LOGIC;
            txd_o       :   OUT STD_LOGIC);
    END COMPONENT transmission_e;

    SIGNAL brd_s, clk_1k_s, sec_s, secp_s   :   STD_LOGIC;
    SIGNAL hour_0_s    :   std_logic_vector(3 downto 0);
    SIGNAL hour_1_s    :   std_logic_vector(3 downto 0);
    SIGNAL minutes_1_s :   std_logic_vector(3 downto 0);
    SIGNAL minutes_0_s :   std_logic_vector(3 downto 0);
    SIGNAL seconds_1_s :   std_logic_vector(3 downto 0);
    SIGNAL seconds_0_s :   std_logic_vector(3 downto 0);

    SIGNAL tsc_hour_0_s    :   std_logic_vector(3 downto 0);
    SIGNAL tsc_hour_1_s    :   std_logic_vector(3 downto 0);
    SIGNAL tsc_minutes_1_s :   std_logic_vector(3 downto 0);
    SIGNAL tsc_minutes_0_s :   std_logic_vector(3 downto 0);
    SIGNAL tsc_seconds_1_s :   std_logic_vector(3 downto 0);
    SIGNAL tsc_seconds_0_s :   std_logic_vector(3 downto 0);

    SIGNAL toc_hour_0_s    :   std_logic_vector(3 downto 0);
    SIGNAL toc_hour_1_s    :   std_logic_vector(3 downto 0);
    SIGNAL toc_minutes_1_s :   std_logic_vector(3 downto 0);
    SIGNAL toc_minutes_0_s :   std_logic_vector(3 downto 0);
    SIGNAL toc_seconds_1_s :   std_logic_vector(3 downto 0);
    SIGNAL toc_seconds_0_s :   std_logic_vector(3 downto 0);

    SIGNAL ascii_hour_0_s    :  std_logic_vector(7 downto 0);
    SIGNAL ascii_hour_1_s    : std_logic_vector(7 downto 0);
    SIGNAL ascii_minutes_1_s : std_logic_vector(7 downto 0);
    SIGNAL ascii_minutes_0_s : std_logic_vector(7 downto 0);
    SIGNAL ascii_seconds_1_s : std_logic_vector(7 downto 0);
    SIGNAL ascii_seconds_0_s : std_logic_vector(7 downto 0);
    SIGNAL ascii_cr_s        : std_logic_vector(7 downto 0);
    SIGNAL ascii_lf_s        : std_logic_vector(7 downto 0);
    SIGNAL sx_s :   STD_LOGIC;
    SIGNAL dr_s :   STD_LOGIC;
    SIGNAL dv_s :   STD_LOGIC;
    SIGNAL m0_state_s :   STD_LOGIC;
    SIGNAL m1_state_s :   STD_LOGIC;
    SIGNAL m2_state_s :   STD_LOGIC;
    SIGNAL m3_state_s :   STD_LOGIC;
    SIGNAL toc_valid_s :   STD_LOGIC;
    SIGNAL toa_data_txd_s :   STD_LOGIC;
    SIGNAL snd_s :   STD_LOGIC;
    SIGNAL snd_led_s :   STD_LOGIC;

BEGIN

    baud_rate   : brd_generator_e PORT MAP (rb_i, cp_i, '0', brd_s, clk_1k_s, sec_s, secp_s);
    timer       : track_timer_e  PORT MAP (rb_i, cp_i, secp_s, hour_0_s, hour_1_s, minutes_1_s, minutes_0_s, seconds_1_s, seconds_0_s );
    sensor_filter: debouncer_e PORT MAP (rb_i, cp_i, sx_i, clk_1k_s, sx_s);
    tea_bag_controller  :   tsc_e PORT MAP (
        rb_i, 
        cp_i, 
        dr_s, 
        sx_s, 
        hour_0_s, 
        hour_1_s, 
        minutes_1_s, 
        minutes_0_s, 
        seconds_1_s, 
        seconds_0_s,
        m0_i, 
        m1_i, 
        m2_i,
        m3_i,
        tsc_hour_0_s, 
        tsc_hour_1_s, 
        tsc_minutes_1_s, 
        tsc_minutes_0_s, 
        tsc_seconds_1_s,
        tsc_seconds_0_s,
        dv_s, 
        m0_state_s, 
        m1_state_s, 
        m2_state_s, 
        m3_state_s
    );

    acoustic_control : ata_e PORT MAP (
        rb_i, 
        cp_i, 
        clk_1k_s, 
        hour_0_s, 
        hour_1_s, 
        minutes_1_s, 
        minutes_0_s, 
        seconds_1_s, 
        seconds_0_s,
        tsc_hour_0_s, 
        tsc_hour_1_s, 
        tsc_minutes_1_s, 
        tsc_minutes_0_s, 
        tsc_seconds_1_s, 
        tsc_seconds_0_s, 
        dv_s, 
        m0_state_s, 
        m1_state_s, 
        m2_state_s, 
        m3_state_s,
        sec_s,
        off_btn_i,
        toc_hour_0_s, 
        toc_hour_1_s, 
        toc_minutes_1_s, 
        toc_minutes_0_s, 
        toc_seconds_1_s, 
        toc_seconds_0_s, 
        toc_valid_s,
        dr_s, 
        snd_s, 
        snd_led_s
    );

    ascii_conv : toa_ascii_e PORT MAP (
        toc_hour_0_s, toc_hour_1_s, toc_minutes_1_s, 
        toc_minutes_0_s, toc_seconds_1_s, toc_seconds_0_s,
        ascii_hour_0_s, ascii_hour_1_s, ascii_minutes_1_s, 
        ascii_minutes_0_s, ascii_seconds_1_s, ascii_seconds_0_s,
        ascii_cr_s, ascii_lf_s
    );

    transmission : transmission_e PORT MAP(
        rb_i,
        cp_i,
        ascii_hour_0_s, 
        ascii_hour_1_s, 
        ascii_minutes_1_s, 
        ascii_minutes_0_s, 
        ascii_seconds_1_s, 
        ascii_seconds_0_s,
        ascii_cr_s, 
        ascii_lf_s,
        brd_s,
        toc_valid_s,
        toa_data_txd_s
    );


    toa_data_txd_o <= toa_data_txd_s;
    led1_o <= rb_i;
    led2_o <= sec_s;
    led3_o <= m0_state_s;
    led4_o <= m1_state_s;
    led5_o <= m2_state_s;
    led6_o <= m3_state_s;
    led7_o <= toa_data_txd_s;
    snd_o <= snd_s;
    led8_o <= snd_led_s;

END top_level_a;