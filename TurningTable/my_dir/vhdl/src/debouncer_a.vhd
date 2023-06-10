ARCHITECTURE arch OF debouncer_e IS
    COMPONENT pulse_3s_e IS 
        PORT(
            rb_i        : IN STD_LOGIC;
            cp_i        : IN STD_LOGIC;
            sec_i       : IN  STD_LOGIC;
            cl_I        : IN  STD_LOGIC; 
            pul_3s_o    : OUT STD_LOGIC);
    END COMPONENT;
	
    COMPONENT shaper_e IS
        PORT(
            rb_i        : IN STD_LOGIC;
            cp_i        : IN STD_LOGIC;
            rs_i        : IN STD_LOGIC;
            en_i        : IN STD_LOGIC;
            s_o         : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT shaper_fsm_e IS 
        PORT(
            rb_i        : IN STD_LOGIC;
            cp_i        : IN STD_LOGIC;
            s_i	        : IN STD_LOGIC;
            clk_1k_i    : IN STD_LOGIC;
            secp_i      : IN STD_LOGIC;
            cl_o        : OUT STD_LOGIC;
            gate_o      : OUT STD_LOGIC;
            dv_o        : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL ns_s,pul_3s_s        : STD_LOGIC;
    SIGNAL cl_s, gate_s, dv_s   : STD_LOGIC;

BEGIN
    neat_sensor_signal : shaper_e PORT MAP(rb_i, cp_i, rs_i,en_i,ns_s);
    pulse_3s : pulse_3s_e 
	           PORT MAP(rb_i, cp_i, secp_i,cl_s, pul_3s_s);
    activate : shaper_fsm_e 
	           PORT MAP(rb_i, cp_i, ns_s, en_i, pul_3s_s ,cl_s ,gate_s, dv_s);

cl_o <= cl_s;
gate_o <= gate_s;
dv_o <= dv_s;
END arch;
