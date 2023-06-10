ARCHITECTURE tb_toplevel_a OF tb_toplevel_e IS

    COMPONENT toplevel_e IS
        PORT(
            rb_i        :   IN STD_LOGIC;
            cp_i        :   IN STD_LOGIC;
            sx_i        :   IN STD_LOGIC;
            off_btn_i   :   IN STD_LOGIC;
            m0_i        :   IN STD_LOGIC;
            m1_i        :   IN STD_LOGIC;
            t0_i        :   IN STD_LOGIC;
            t1_i        :   IN STD_LOGIC;
            led1_o      :   OUT STD_LOGIC;
            led2_o      :   OUT STD_LOGIC;
            led3_o      :   OUT STD_LOGIC;
            led4_o      :   OUT STD_LOGIC;
            led5_o      :   OUT STD_LOGIC;
            led6_o      :   OUT STD_LOGIC;
            led7_o      :   OUT STD_LOGIC;
            led8_o      :   OUT STD_LOGIC;
            snd_o       :   OUT STD_LOGIC;
            txd_o  :   OUT STD_LOGIC
        );
    END COMPONENT toplevel_e;

    SIGNAL rb_s        :   STD_LOGIC;
    SIGNAL cp_s        :   STD_LOGIC;
    SIGNAL sx_s        :   STD_LOGIC;
    SIGNAL off_btn_s   :   STD_LOGIC;
    SIGNAL m0_s        :   STD_LOGIC;
    SIGNAL m1_s        :   STD_LOGIC;
    SIGNAL m2_s        :   STD_LOGIC;
    SIGNAL m3_s        :   STD_LOGIC;
    SIGNAL led1_s      :    STD_LOGIC;
    SIGNAL led2_s      :    STD_LOGIC;
    SIGNAL led3_s      :    STD_LOGIC;
    SIGNAL led4_s      :    STD_LOGIC;
    SIGNAL led5_s      :    STD_LOGIC;
    SIGNAL led6_s      :    STD_LOGIC;
    SIGNAL led7_s      :    STD_LOGIC;
    SIGNAL led8_s      :    STD_LOGIC;
    SIGNAL snd_s       :    STD_LOGIC;
    SIGNAL txd_s : STD_LOGIC;

BEGIN
	
	toplevel_simulation : toplevel_e PORT MAP (
		rb_s        ,
		cp_s        ,
		sx_s        ,
		off_btn_s   ,
		m0_s        ,
		m1_s        ,
		m2_s        ,
		m3_s        ,
		led1_s      ,
		led2_s      ,
		led3_s      ,
		led4_s      ,
		led5_s      ,
		led6_s      ,
		led7_s      ,
		led8_s      ,
		snd_s       ,
		txd_s 
	);

    clocking : PROCESS 
    begin
        cp_s <= '1';
        WAIT FOR 25 NS;
        cp_s <= '0';
        WAIT FOR 25 NS;
    END PROCESS clocking;

    reseting : PROCESS
    begin
        rb_s <= '0';
        WAIT FOR 10 NS;
        rb_s <= '1';
        WAIT;
    end process reseting;

    doit_process : PROCESS
    begin
        m0_s <= '0';
        m1_s <= '0';
        m2_s <= '0';
        m3_s <= '0';
        sx_s <= '0';
        off_btn_s <= '0';
        WAIT for 2000 ms;  -- 2 seconds
        WAIT until rising_edge(cp_s);
        sx_s <= '1';
        WAIT for 180000 ms;  -- 3 minutes
        WAIT until rising_edge(cp_s);
        off_btn_s <= '1';
        WAIT FOR 2000 ms;  -- 2 seconds
        off_btn_s <= '0';
        sx_s <= '0';
        WAIT;
    end process doit_process;

END tb_toplevel_a;
