ARCHITECTURE track_timer_a OF track_timer_e IS
    COMPONENT counter_60_e IS
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
    END COMPONENT counter_60_e;
	
    COMPONENT counter_24_e IS
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
    END COMPONENT counter_24_e;
---------------------------------------------------------------------------------------------------------------------------------------------------
--Internal signals
    SIGNAL pulse_s_s    :   STD_LOGIC;
    SIGNAL pulse_m_s    :   STD_LOGIC;
    SIGNAL pulse_h_s    :   STD_LOGIC;

BEGIN

    second_unit :   counter_60_e PORT MAP(rb_i, cp_i, sec_i, seconds_0_o, seconds_1_o, pulse_s_s);
    minute_unit :   counter_60_e PORT MAP(rb_i, cp_i, pulse_s_s, minutes_0_o, minutes_1_o, pulse_m_s);
    hour_unit   :   counter_24_e PORT MAP(rb_i, cp_i, pulse_m_s, hour_0_o, hour_1_o, pulse_h_s);

END track_timer_a;
