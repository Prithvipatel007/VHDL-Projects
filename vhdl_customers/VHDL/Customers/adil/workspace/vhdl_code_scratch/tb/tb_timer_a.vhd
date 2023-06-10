ARCHITECTURE tb_timer_a OF tb_timer_e IS

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
    END  COMPONENT timer_e;

    SIGNAL rb_s        :   STD_LOGIC;
	SIGNAL cp_s        :   STD_LOGIC;
	SIGNAL sec_s       :   STD_LOGIC;
	SIGNAL h_0_s    :   std_logic_vector(3 downto 0);
	SIGNAL h_1_s    :   std_logic_vector(3 downto 0);
	SIGNAL m_1_s :   std_logic_vector(3 downto 0);
	SIGNAL m_0_s :   std_logic_vector(3 downto 0);
	SIGNAL s_1_s :   std_logic_vector(3 downto 0);
	SIGNAL s_0_s :   std_logic_vector(3 downto 0);
    
--
BEGIN

    uun4 : timer_e PORT MAP (rb_s, cp_s, sec_s, h_0_s, h_1_s, m_0_s, m_1_s, s_0_s, s_1_s);
    --
    doTB : PROCESS
    BEGIN
        rb_s <= '0';
		WAIT FOR 1000 NS;
		rb_s <= '1';
        WAIT;
    END PROCESS doTB;

    clocking : PROCESS
    begin
        cp_s <= '1';
        WAIT FOR 50 NS;
        cp_s <= '0';
        WAIT FOR 50 NS;
    END PROCESS clocking;

    sec_clocking : PROCESS
    begin
        sec_s <= '1';
        WAIT FOR 50 NS;
        sec_s <= '0';
        WAIT FOR 500 NS;
    END PROCESS sec_clocking;
END tb_timer_a;
