ARCHITECTURE toplevel_a OF toplevel_e is
    
    COMPONENT baudrate_e IS PORT(
        rb_i, cp_i               :  IN STD_LOGIC;
        brd_o, clk_1k_o ,sec_o, secp_o  :  OUT STD_LOGIC
    );
    END COMPONENT baudrate_e;

    COMPONENT timer_e IS 
        PORT(
            rb_i        :   IN STD_LOGIC;
            cp_i        :   IN STD_LOGIC;
            sec_i       :   IN STD_LOGIC;
            h_0_o    :   OUT std_logic_vector(3 downto 0);
            h_1_o    :   OUT std_logic_vector(3 downto 0);
            m_1_o :   OUT std_logic_vector(3 downto 0);
            m_0_o :   OUT std_logic_vector(3 downto 0);
            s_1_o :   OUT std_logic_vector(3 downto 0);
            s_0_o :   OUT std_logic_vector(3 downto 0)
            );
    END COMPONENT timer_e;

    COMPONENT filter_e IS
        PORT(
            rb_i : IN STD_LOGIC;
            cp_i : IN STD_LOGIC;
            rs_i : IN STD_LOGIC;
            en_i : IN STD_LOGIC;
            s_o  : OUT STD_LOGIC);
    END COMPONENT filter_e;

    COMPONENT tsc_ctrl_e IS
        PORT(
            rb_i    : IN STD_LOGIC;
            cp_i    : IN STD_LOGIC;
            dr_i    : IN STD_LOGIC;
            sx_i    : IN STD_LOGIC;     -- sensor input
            
            h_0_i    :   IN std_logic_vector(3 downto 0);
            h_1_i    :   IN std_logic_vector(3 downto 0);
            m_1_i :   IN std_logic_vector(3 downto 0);
            m_0_i :   IN std_logic_vector(3 downto 0);
            s_1_i :   IN std_logic_vector(3 downto 0);
            s_0_i :   IN std_logic_vector(3 downto 0);

            m0_i    : IN STD_LOGIC;     -- mode 0
            m1_i    : IN STD_LOGIC;     -- mode 1
            t0_i    : IN STD_LOGIC;     -- test mode 0
            t1_i    : IN STD_LOGIC;     -- test mode 1
            h_0_o    :   OUT std_logic_vector(3 downto 0);
            h_1_o    :   OUT std_logic_vector(3 downto 0);
            m_1_o :   OUT std_logic_vector(3 downto 0);
            m_0_o :   OUT std_logic_vector(3 downto 0);
            s_1_o :   OUT std_logic_vector(3 downto 0);
            s_0_o :   OUT std_logic_vector(3 downto 0);

            dv_o          : OUT STD_LOGIC;
            m0_state_o    : OUT STD_LOGIC;
            m1_state_o    : OUT STD_LOGIC;
            t0_state_o    : OUT STD_LOGIC;
            t1_state_o    : OUT STD_LOGIC
            );
    END COMPONENT tsc_ctrl_e;

    COMPONENT ata_ctrl_e IS
        PORT(
            rb_i    : IN STD_LOGIC;
            cp_i    : IN STD_LOGIC;
            clk_1k_i: IN STD_LOGIC;
            -- current time
            c_h_0_i    :   IN std_logic_vector(3 downto 0);
            c_h_1_i    :   IN std_logic_vector(3 downto 0);
            c_m_1_i :   IN std_logic_vector(3 downto 0);
            c_m_0_i :   IN std_logic_vector(3 downto 0);
            c_s_1_i :   IN std_logic_vector(3 downto 0);
            c_s_0_i :   IN std_logic_vector(3 downto 0);
            -- toa input time
            h_0_i    :   IN std_logic_vector(3 downto 0);
            h_1_i    :   IN std_logic_vector(3 downto 0);
            m_1_i :   IN std_logic_vector(3 downto 0);
            m_0_i :   IN std_logic_vector(3 downto 0);
            s_1_i :   IN std_logic_vector(3 downto 0);
            s_0_i :   IN std_logic_vector(3 downto 0);
            dv_i        : IN STD_LOGIC;
            m0_state_i    : IN STD_LOGIC;
            m1_state_i    : IN STD_LOGIC;
            t0_state_i    : IN STD_LOGIC;
            t1_state_i    : IN STD_LOGIC;
            sec_q_i         : IN STD_LOGIC;
            off_btn_i       : IN STD_LOGIC;

            toc_h_0_o    :   OUT std_logic_vector(3 downto 0);
            toc_h_1_o    :   OUT std_logic_vector(3 downto 0);
            toc_m_1_o :   OUT std_logic_vector(3 downto 0);
            toc_m_0_o :   OUT std_logic_vector(3 downto 0);
            toc_s_1_o :   OUT std_logic_vector(3 downto 0);
            toc_s_0_o :   OUT std_logic_vector(3 downto 0);
            toa_valid_o   : OUT STD_LOGIC;
            dr_o          : OUT STD_LOGIC;
            snd_o         : OUT STD_LOGIC;
            snd_led_o     : OUT STD_LOGIC        
            );
    END COMPONENT ata_ctrl_e;

    COMPONENT ascii_conv_e IS
        PORT(
            toc_h_0_i    :   IN std_logic_vector(3 downto 0);
            toc_h_1_i    :   IN std_logic_vector(3 downto 0);
            toc_m_1_i :   IN std_logic_vector(3 downto 0);
            toc_m_0_i :   IN std_logic_vector(3 downto 0);
            toc_s_1_i :   IN std_logic_vector(3 downto 0);
            toc_s_0_i :   IN std_logic_vector(3 downto 0);

            toc_h_0_o    :   OUT std_logic_vector(7 downto 0);
            toc_h_1_o    :   OUT std_logic_vector(7 downto 0);
            toc_m_1_o :   OUT std_logic_vector(7 downto 0);
            toc_m_0_o :   OUT std_logic_vector(7 downto 0);
            toc_s_1_o :   OUT std_logic_vector(7 downto 0);
            toc_s_0_o :   OUT std_logic_vector(7 downto 0);
            cr_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            lf_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT ascii_conv_e;

    COMPONENT txd_e IS 
        PORT(
            rb_i        :   IN STD_LOGIC;
            cp_i        :   IN STD_LOGIC;
            h_0_i    : IN std_logic_vector(7 downto 0);
            h_1_i    : IN std_logic_vector(7 downto 0);
            m_1_i : IN std_logic_vector(7 downto 0);
            m_0_i : IN std_logic_vector(7 downto 0);
            s_1_i : IN std_logic_vector(7 downto 0);
            s_0_i : IN std_logic_vector(7 downto 0);
            cr_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);			
            lf_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            brd_i       :   IN STD_LOGIC;
            dv_i        :   IN STD_LOGIC;
            txd_o       :   OUT STD_LOGIC);
    END COMPONENT txd_e;

    SIGNAL brd_s, clk_1k_s, sec_s, secp_s   :   STD_LOGIC;
    SIGNAL h_0_s    :   std_logic_vector(3 downto 0);
    SIGNAL h_1_s    :   std_logic_vector(3 downto 0);
    SIGNAL m_1_s :   std_logic_vector(3 downto 0);
    SIGNAL m_0_s :   std_logic_vector(3 downto 0);
    SIGNAL s_1_s :   std_logic_vector(3 downto 0);
    SIGNAL s_0_s :   std_logic_vector(3 downto 0);

    SIGNAL tsc_h_0_s    :   std_logic_vector(3 downto 0);
    SIGNAL tsc_h_1_s    :   std_logic_vector(3 downto 0);
    SIGNAL tsc_m_1_s :   std_logic_vector(3 downto 0);
    SIGNAL tsc_m_0_s :   std_logic_vector(3 downto 0);
    SIGNAL tsc_s_1_s :   std_logic_vector(3 downto 0);
    SIGNAL tsc_s_0_s :   std_logic_vector(3 downto 0);

    SIGNAL toc_h_0_s    :   std_logic_vector(3 downto 0);
    SIGNAL toc_h_1_s    :   std_logic_vector(3 downto 0);
    SIGNAL toc_m_1_s :   std_logic_vector(3 downto 0);
    SIGNAL toc_m_0_s :   std_logic_vector(3 downto 0);
    SIGNAL toc_s_1_s :   std_logic_vector(3 downto 0);
    SIGNAL toc_s_0_s :   std_logic_vector(3 downto 0);

    SIGNAL ascii_h_0_s    :  std_logic_vector(7 downto 0);
    SIGNAL ascii_h_1_s    : std_logic_vector(7 downto 0);
    SIGNAL ascii_m_1_s : std_logic_vector(7 downto 0);
    SIGNAL ascii_m_0_s : std_logic_vector(7 downto 0);
    SIGNAL ascii_s_1_s : std_logic_vector(7 downto 0);
    SIGNAL ascii_s_0_s : std_logic_vector(7 downto 0);
    SIGNAL cr_s        : std_logic_vector(7 downto 0);
    SIGNAL lf_s        : std_logic_vector(7 downto 0);
    SIGNAL sx_s :   STD_LOGIC;
    SIGNAL dr_s :   STD_LOGIC;
    SIGNAL dv_s :   STD_LOGIC;
    SIGNAL m0_state_s :   STD_LOGIC;
    SIGNAL m1_state_s :   STD_LOGIC;
    SIGNAL t0_state_s :   STD_LOGIC;
    SIGNAL t1_state_s :   STD_LOGIC;
    SIGNAL toc_valid_s :   STD_LOGIC;
    SIGNAL toa_data_txd_s :   STD_LOGIC;
    SIGNAL snd_s :   STD_LOGIC;
    SIGNAL snd_led_s :   STD_LOGIC;
BEGIN

    brd_gen     : baudrate_e PORT MAP (rb_i, cp_i, brd_s, clk_1k_s, sec_s, secp_s);
    timer       : timer_e  PORT MAP (rb_i, cp_i, secp_s, h_0_s, h_1_s, m_1_s, m_0_s, s_1_s, s_0_s );
    sensor_filter: filter_e PORT MAP (rb_i, cp_i, sx_i, clk_1k_s, sx_s);
    tea_brew_control  :   tsc_ctrl_e PORT MAP (
        rb_i, cp_i, dr_s, sx_s, h_0_s, h_1_s, m_1_s, m_0_s, s_1_s, s_0_s,m0_i, 
        m1_i, t0_i, t1_i, tsc_h_0_s, tsc_h_1_s, tsc_m_1_s, tsc_m_0_s, tsc_s_1_s,
        tsc_s_0_s, dv_s, m0_state_s,  m1_state_s, t0_state_s, t1_state_s);

    ata_control : ata_ctrl_e PORT MAP (
        rb_i, cp_i, clk_1k_s, h_0_s, h_1_s, m_1_s, m_0_s, s_1_s, s_0_s, tsc_h_0_s, tsc_h_1_s, 
        tsc_m_1_s, tsc_m_0_s, tsc_s_1_s, tsc_s_0_s, dv_s, m0_state_s, m1_state_s, t0_state_s, 
        t1_state_s, sec_s, off_btn_i, toc_h_0_s, toc_h_1_s, toc_m_1_s, toc_m_0_s, toc_s_1_s, 
        toc_s_0_s, toc_valid_s, dr_s, snd_s, snd_led_s
    );

    ascii_conv : ascii_conv_e PORT MAP (
        toc_h_0_s, toc_h_1_s, toc_m_1_s, 
        toc_m_0_s, toc_s_1_s, toc_s_0_s,
        ascii_h_0_s, ascii_h_1_s, ascii_m_1_s, 
        ascii_m_0_s, ascii_s_1_s, ascii_s_0_s,
        cr_s, lf_s
    );

    txd_control : txd_e PORT MAP(
        rb_i, cp_i, ascii_h_0_s, ascii_h_1_s, ascii_m_1_s, ascii_m_0_s, 
        ascii_s_1_s, ascii_s_0_s, cr_s, lf_s, brd_s, toc_valid_s,
        toa_data_txd_s
    );


    txd_o <= toa_data_txd_s;
    led1_o <= rb_i;
    led2_o <= sec_s;
    led3_o <= m0_state_s;
    led4_o <= m1_state_s;
    led5_o <= t0_state_s;
    led6_o <= t1_state_s;
    led7_o <= toa_data_txd_s;
    snd_o <= snd_s;
    led8_o <= snd_led_s;

END toplevel_a;