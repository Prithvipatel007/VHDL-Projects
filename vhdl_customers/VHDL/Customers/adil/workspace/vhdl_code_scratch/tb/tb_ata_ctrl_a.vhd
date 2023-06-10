ARCHITECTURE tb_ata_ctrl_a OF tb_ata_ctrl_e IS

	COMPONENT ata_ctrl_e IS
		PORT(
			--
			--  Inputs
			--
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
			--
			-- Outputs
			--
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
	
	SIGNAL rb_s    		: STD_LOGIC;
	SIGNAL cp_s    		: STD_LOGIC;
	SIGNAL clk_1k_s		: STD_LOGIC;
	SIGNAL c_h_0_s    	:   std_logic_vector(3 downto 0);
	SIGNAL c_h_1_s    	:   std_logic_vector(3 downto 0);
	SIGNAL c_m_1_s 	:   std_logic_vector(3 downto 0);
	SIGNAL c_m_0_s 	:   std_logic_vector(3 downto 0);
	SIGNAL c_s_1_s 	:   std_logic_vector(3 downto 0);
	SIGNAL c_s_0_s 	:   std_logic_vector(3 downto 0);
	SIGNAL h_0_s    	:   std_logic_vector(3 downto 0);
	SIGNAL h_1_s    	:   std_logic_vector(3 downto 0);
	SIGNAL m_1_s 	:   std_logic_vector(3 downto 0);
	SIGNAL m_0_s 	:   std_logic_vector(3 downto 0);
	SIGNAL s_1_s 	:   std_logic_vector(3 downto 0);
	SIGNAL s_0_s 	:   std_logic_vector(3 downto 0);
	SIGNAL dv_s    		: STD_LOGIC;
	SIGNAL m0_state_s   : STD_LOGIC;
	SIGNAL m1_state_s   : STD_LOGIC;
	SIGNAL t0_state_s   : STD_LOGIC;
	SIGNAL t1_state_s   : STD_LOGIC;
	SIGNAL sec_q_s       : STD_LOGIC;
	SIGNAL off_btn_s     : STD_LOGIC;
	SIGNAL toc_h_0_s  :   std_logic_vector(3 downto 0);
	SIGNAL toc_h_1_s  :   std_logic_vector(3 downto 0);
	SIGNAL toc_m_1_s :   std_logic_vector(3 downto 0);
	SIGNAL toc_m_0_s :   std_logic_vector(3 downto 0);
	SIGNAL toc_s_1_s :   std_logic_vector(3 downto 0);
	SIGNAL toc_s_0_s :   std_logic_vector(3 downto 0);
	SIGNAL toa_valid_s   : STD_LOGIC;
	SIGNAL dr_s          : STD_LOGIC;
	SIGNAL snd_s         : STD_LOGIC;
	SIGNAL snd_led_s     : STD_LOGIC;

    
--
BEGIN

    uun1 : ata_ctrl_e PORT MAP (
		
		rb_s    	     ,
		cp_s    	     ,
		clk_1k_s	     ,
		c_h_0_s       ,
		c_h_1_s       ,
		c_m_1_s    ,
		c_m_0_s    ,
		c_s_1_s    ,
		c_s_0_s    ,
		h_0_s         ,
		h_1_s         ,
		m_1_s      ,
		m_0_s      ,
		s_1_s      ,
		s_0_s      ,
		dv_s    	     ,
		m0_state_s       ,
		m1_state_s       ,
		t0_state_s       ,
		t1_state_s       ,
		sec_q_s          ,
		off_btn_s        ,
		toc_h_0_s     ,
		toc_h_1_s     ,
		toc_m_1_s  ,
		toc_m_0_s  ,
		toc_s_1_s  ,
		toc_s_0_s  ,
		toa_valid_s      ,
		dr_s             ,
		snd_s            ,
		snd_led_s
	);
    --
    doTB : PROCESS
    BEGIN
        c_h_0_s <= "0000";
        c_h_1_s <= "0000";
		c_m_1_s  <= "0001";
		c_m_0_s  <= "0011";
		c_s_1_s  <= "0000";
		c_s_0_s  <= "0000";
		h_0_s       <= "0000";
		h_1_s       <= "0000";
		m_1_s    <= "1001";
		m_0_s    <= "0010";
		s_1_s    <= "0000";
		s_0_s    <= "0000";
        dv_s <= '0';
        m0_state_s <= '0';
        m1_state_s <= '0';
        t0_state_s <= '0';
        t1_state_s <= '0';
        off_btn_s <= '0';
        WAIT FOR 500 NS;
        dv_s <= '1';
        WAIT FOR 2000 MS;
        dv_s <= '0';
        WAIT;
    END PROCESS doTB;

clocking_1khz : PROCESS 
begin
    clk_1k_s <= '1';
    WAIT FOR 500 us;
    clk_1k_s <= '0';
    WAIT FOR 500 us;
END PROCESS clocking_1khz;

clocking_1hz : PROCESS 
begin
    sec_q_s <= '1';
    WAIT FOR 500 ms;
    sec_q_s <= '0';
    WAIT FOR 500 ms;
END PROCESS clocking_1hz;

clocking : PROCESS 
begin
    cp_s <= '1';
    WAIT FOR 50 NS;
    cp_s <= '0';
    WAIT FOR 50 NS;
END PROCESS clocking;

reseting : PROCESS
begin
    rb_s <= '0';
    WAIT FOR 50 NS;
    rb_s <= '1';
    WAIT;
end process reseting;

END tb_ata_ctrl_a;
