ARCHITECTURE timer_a OF timer_e IS
    COMPONENT c60_e IS
        PORT(
            --
            --  Inputs
            --
            rb_i    : IN STD_LOGIC;
            cp_i    : IN STD_LOGIC;
            sec_i   : IN STD_LOGIC;
            --
            -- Outputs
            --
            s0_o        : OUT STD_LOGIC_VECTOR(3 downto 0);  -- data representing time
            s1_o        : OUT STD_LOGIC_VECTOR(3 downto 0);
            sco_o       : OUT STD_LOGIC
            );
    END COMPONENT c60_e;
	
    COMPONENT c24_e IS
        PORT(
            --
            --  Inputs
            --
            rb_i    : IN STD_LOGIC;
            cp_i    : IN STD_LOGIC;
            sec_i   : IN STD_LOGIC;
            --
            -- Outputs
            --
            s0_o        : OUT STD_LOGIC_VECTOR(3 downto 0);  -- data representing time
            s1_o        : OUT STD_LOGIC_VECTOR(3 downto 0);
            sco_o       : OUT STD_LOGIC
            );
    END COMPONENT c24_e;
---------------------------------------------------------------------------------------------------------------------------------------------------
--Internal signals
    SIGNAL p_s_s    :   STD_LOGIC;
    SIGNAL p_m_s    :   STD_LOGIC;
    SIGNAL p_h_s    :   STD_LOGIC;

BEGIN

    s_unit :   c60_e PORT MAP(rb_i, cp_i, sec_i, s_0_o, s_1_o, p_s_s);
    m_unit :   c60_e PORT MAP(rb_i, cp_i, p_s_s, m_0_o, m_1_o, p_m_s);
    h_unit :   c24_e PORT MAP(rb_i, cp_i, p_m_s, h_0_o, h_1_o, p_h_s);

END timer_a;
