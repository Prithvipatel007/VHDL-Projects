ARCHITECTURE bcd_cnt4_4_a OF bcd_cnt4_4_e is

COMPONENT bcd_cnt4_e
    PORT(
        rb_i     : IN STD_LOGIC;
        cp_i     : IN STD_LOGIC;
        en_i     : IN STD_LOGIC;
        clk_1k_i : IN STD_LOGIC;
        clr_i    : IN STD_LOGIC;
        co_o     : OUT STD_LOGIC;
        q_o      : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));

END COMPONENT;

    SIGNAL co0_s,co1_s,co2_s,co3_s  : STD_LOGIC;
    SIGNAL en1_s, en2_s, en_s : STD_LOGIC;
BEGIN
    en1_s <= co1_s AND co0_s;
    en2_s <= co2_s AND co1_s AND co0_s;

    digit_1 : bcd_cnt4_e PORT MAP (rb_i, cp_i, en_i, clk_1k_i , clr_i, co0_s, digit_0_o);
    digit_2 : bcd_cnt4_e PORT MAP (rb_i, cp_i, co0_s, clk_1k_i, clr_i, co1_s, digit_1_o); 
    digit_3 : bcd_cnt4_e PORT MAP (rb_i, cp_i, en1_s, clk_1k_i, clr_i, co2_s, digit_2_o);
    digit_4 : bcd_cnt4_e PORT MAP (rb_i, cp_i, en2_s, clk_1k_i, clr_i, co3_s, digit_3_o);

END bcd_cnt4_4_a;
