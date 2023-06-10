ARCHITECTURE brd_generator_a OF brd_generator_e IS
-------------------------------------------------------------------------------------------------------------------------------
    COMPONENT en_comp_e IS PORT(
        en1_i : IN STD_LOGIC;
        sel_i : IN STD_LOGIC;
        co_10m_i : IN STD_LOGIC;
        en1_o : OUT STD_LOGIC);
    END COMPONENT;
	
    COMPONENT c10ec IS PORT(
        rb_i,cp_i,en_i,cl_i	: IN STD_LOGIC;
        q3_o,co_o 			: OUT STD_LOGIC);
    END COMPONENT;
	
    COMPONENT c05ec IS PORT(
        rb_i,cp_i,en_i,cl_i 	: IN STD_LOGIC;
        q3_o,co_o       		: OUT STD_LOGIC
    );
    END COMPONENT;
	
    COMPONENT c13ec IS PORT(
        rb_i,cp_i,en_i, cl_i    : IN STD_LOGIC;
        q3_o,co_o               : OUT STD_LOGIC);
    END COMPONENT;
	
    COMPONENT c16ec IS PORT(
        rb_i,cp_i,en_i,cl_i     : IN STD_LOGIC;
        q3_o,co_o               : OUT STD_LOGIC);
    END COMPONENT;
------------------------------------------------------------------------------------------------------------------------------
    SIGNAL en2_s,en3_s : STD_LOGIC;
    SIGNAL q305_1_s, q305_s,co05_1_s, co05_2_s, co05_s : STD_LOGIC;
    SIGNAL q313_s,co13_s : STD_LOGIC;
    SIGNAL q316_s,co16_s : STD_LOGIC;
    SIGNAL q1m_s,q100k_s, q10k_s, q1k_S, q100_s, q10_s, q1_s : STD_LOGIC;
    SIGNAL c1m_s, c100k_s, c10k_s, c1k_s, c100_s, c10_s, c1_s : STD_LOGIC;
BEGIN

    count_05 : c05ec PORT MAP (rb_i, cp_i, '1', '0' , q305_1_s, co05_1_s);
    enable : en_comp_e PORT MAP('1' , sel_i , co05_1_s , co05_2_s);
    count05 : c05ec PORT MAP (rb_i, cp_i, co05_2_s, '0' , q305_s, co05_s);
    en2_s <= co05_s;
    count13 : c13ec PORT MAP (rb_i, cp_i, en2_s , '0' , q313_s, co13_s);
    en3_s <= co13_s;
    coutn16 : c16ec PORT MAP (rb_i, cp_i, en3_s ,'0', q316_s, co16_s);

    C_1MHz_o : c10ec PORT MAP(rb_i, cp_i,co05_2_s,'0',q1m_s, c1m_s);
    C_100KHz : c10ec PORT MAP(rb_i, cp_i, c1m_s, '0', q100k_s, c100k_s);
    C_10KHz  : c10ec PORT MAP(rb_i, cp_i, c100k_s, '0', q10k_s, c10k_s);
    C_1KHz   : c10ec PORT MAP(rb_i, cp_i, c10k_s, '0', q1k_s, c1k_s);
    C_100Hz  : c10ec PORT MAP(rb_i, cp_i, c1k_s, '0', q100_s, c100_s);
    C_10Hz  : c10ec PORT MAP(rb_i, cp_i, c100_s, '0', q10_s, c10_s);
    C_1Hz  : c10ec PORT MAP(rb_i, cp_i, c10_s, '0', q1_s, c1_s);

clk_1k_o <= c1k_s;
sec_o <= q1_s;
secp_o <= c1_s;
brd_o <= co16_s;

END brd_generator_a;
