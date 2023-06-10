ARCHITECTURE baudrate_a OF baudrate_e IS

    COMPONENT c12ec_e IS PORT(
        rb_i,cp_i,en_i,cl_i	: IN STD_LOGIC;
        q3_o,co_o 			: OUT STD_LOGIC);
    END COMPONENT;	
	
    COMPONENT c10ec_e IS PORT(
        rb_i,cp_i,en_i,cl_i	: IN STD_LOGIC;
        q3_o,co_o 			: OUT STD_LOGIC);
    END COMPONENT;
	
    COMPONENT c05ec_e IS PORT(
        rb_i,cp_i,en_i,cl_i 	: IN STD_LOGIC;
        q3_o,co_o       		: OUT STD_LOGIC
    );
    END COMPONENT;

    SIGNAL q1m_s, q100k_s, q1_2M_s, q240k_s, q48k_s,  q10k_s, q1k_S, q100_s, q10_s, q1_s, q9k6_s  : STD_LOGIC;
    SIGNAL c1m_s, c100k_s, c1_2M_s, c10k_s, c48k_s, c240k_s, c1k_s, c100_s, c10_s, c1_s, c9k6_s : STD_LOGIC;
    
BEGIN

    C_1_2MHz_o : c12ec_e PORT MAP(rb_i, cp_i,'1','0',q1_2M_s, c1_2M_s);
    C_240KHz_l : c05ec_e PORT MAP (rb_i, cp_i,c1_2M_s,'0',q240k_s, c240k_s);
    C_48KHz_l : c05ec_e PORT MAP (rb_i, cp_i,c240k_s,'0',q48k_s, c48k_s);
    C_9k6_l : c05ec_e PORT MAP (rb_i, cp_i,c48k_s,'0',q9k6_s, c9k6_s);

    C_1MHz_o : c10ec_e PORT MAP(rb_i, cp_i,'1','0',q1m_s, c1m_s);
    C_100KHz : c10ec_e PORT MAP(rb_i, cp_i, c1m_s, '0', q100k_s, c100k_s);
    C_10KHz  : c10ec_e PORT MAP(rb_i, cp_i, c100k_s, '0', q10k_s, c10k_s);
    C_1KHz   : c10ec_e PORT MAP(rb_i, cp_i, c10k_s, '0', q1k_s, c1k_s);
    C_100Hz  : c10ec_e PORT MAP(rb_i, cp_i, c1k_s, '0', q100_s, c100_s);
    C_10Hz  : c10ec_e PORT MAP(rb_i, cp_i, c100_s, '0', q10_s, c10_s);
    C_1Hz  : c10ec_e PORT MAP(rb_i, cp_i, c10_s, '0', q1_s, c1_s);

clk_1k_o <= c1k_s;
sec_o <= q1_s;
secp_o <= c1_s;
brd_o <= c9k6_s;

END baudrate_a;
