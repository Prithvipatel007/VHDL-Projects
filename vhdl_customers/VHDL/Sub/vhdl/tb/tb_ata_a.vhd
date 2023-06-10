ARCHITECTURE a1 OF tb_ata_e IS

    COMPONENT ata_e IS
		PORT(
			--
			--  Inputs
			--
			rb_i    : IN STD_LOGIC;
			cp_i    : IN STD_LOGIC;
			clk_1k_i: IN STD_LOGIC;
			-- current time
			c_hour_0_i    :   IN std_logic_vector(3 downto 0);
			c_hour_1_i    :   IN std_logic_vector(3 downto 0);
			c_minutes_1_i :   IN std_logic_vector(3 downto 0);
			c_minutes_0_i :   IN std_logic_vector(3 downto 0);
			c_seconds_1_i :   IN std_logic_vector(3 downto 0);
			c_seconds_0_i :   IN std_logic_vector(3 downto 0);
			-- toa input time
			hour_0_i    :   IN std_logic_vector(3 downto 0);
			hour_1_i    :   IN std_logic_vector(3 downto 0);
			minutes_1_i :   IN std_logic_vector(3 downto 0);
			minutes_0_i :   IN std_logic_vector(3 downto 0);
			seconds_1_i :   IN std_logic_vector(3 downto 0);
			seconds_0_i :   IN std_logic_vector(3 downto 0);
			dv_i        : IN STD_LOGIC;
			m0_state_i    : IN STD_LOGIC;
			m1_state_i    : IN STD_LOGIC;
			m2_state_i    : IN STD_LOGIC;
			m3_state_i    : IN STD_LOGIC;
			sec_q_i         : IN STD_LOGIC;
			off_btn_i       : IN STD_LOGIC;
			--
			-- Outputs
			--
			toc_hour_0_o    :   OUT std_logic_vector(3 downto 0);
			toc_hour_1_o    :   OUT std_logic_vector(3 downto 0);
			toc_minutes_1_o :   OUT std_logic_vector(3 downto 0);
			toc_minutes_0_o :   OUT std_logic_vector(3 downto 0);
			toc_seconds_1_o :   OUT std_logic_vector(3 downto 0);
			toc_seconds_0_o :   OUT std_logic_vector(3 downto 0);
			toa_valid_o   : OUT STD_LOGIC;
			dr_o          : OUT STD_LOGIC;
			snd_o         : OUT STD_LOGIC;
			snd_led_o     : OUT STD_LOGIC        
			);
	END COMPONENT ata_e;
	
	SIGNAL rb_s    		: STD_LOGIC;
	SIGNAL cp_s    		: STD_LOGIC;
	SIGNAL clk_1k_s		: STD_LOGIC;
	SIGNAL c_hour_0_s    	:   std_logic_vector(3 downto 0);
	SIGNAL c_hour_1_s    	:   std_logic_vector(3 downto 0);
	SIGNAL c_minutes_1_s 	:   std_logic_vector(3 downto 0);
	SIGNAL c_minutes_0_s 	:   std_logic_vector(3 downto 0);
	SIGNAL c_seconds_1_s 	:   std_logic_vector(3 downto 0);
	SIGNAL c_seconds_0_s 	:   std_logic_vector(3 downto 0);
	SIGNAL hour_0_s    	:   std_logic_vector(3 downto 0);
	SIGNAL hour_1_s    	:   std_logic_vector(3 downto 0);
	SIGNAL minutes_1_s 	:   std_logic_vector(3 downto 0);
	SIGNAL minutes_0_s 	:   std_logic_vector(3 downto 0);
	SIGNAL seconds_1_s 	:   std_logic_vector(3 downto 0);
	SIGNAL seconds_0_s 	:   std_logic_vector(3 downto 0);
	SIGNAL dv_s    		: STD_LOGIC;
	SIGNAL m0_state_s   : STD_LOGIC;
	SIGNAL m1_state_s   : STD_LOGIC;
	SIGNAL m2_state_s   : STD_LOGIC;
	SIGNAL m3_state_s   : STD_LOGIC;
	SIGNAL sec_q_s       : STD_LOGIC;
	SIGNAL off_btn_s     : STD_LOGIC;
	SIGNAL toc_hour_0_s  :   std_logic_vector(3 downto 0);
	SIGNAL toc_hour_1_s  :   std_logic_vector(3 downto 0);
	SIGNAL toc_minutes_1_s :   std_logic_vector(3 downto 0);
	SIGNAL toc_minutes_0_s :   std_logic_vector(3 downto 0);
	SIGNAL toc_seconds_1_s :   std_logic_vector(3 downto 0);
	SIGNAL toc_seconds_0_s :   std_logic_vector(3 downto 0);
	SIGNAL toa_valid_s   : STD_LOGIC;
	SIGNAL dr_s          : STD_LOGIC;
	SIGNAL snd_s         : STD_LOGIC;
	SIGNAL snd_led_s     : STD_LOGIC;

    
--
BEGIN

    uun4 : ata_e PORT MAP (
		
		rb_s    	     ,
		cp_s    	     ,
		clk_1k_s	     ,
		c_hour_0_s       ,
		c_hour_1_s       ,
		c_minutes_1_s    ,
		c_minutes_0_s    ,
		c_seconds_1_s    ,
		c_seconds_0_s    ,
		hour_0_s         ,
		hour_1_s         ,
		minutes_1_s      ,
		minutes_0_s      ,
		seconds_1_s      ,
		seconds_0_s      ,
		dv_s    	     ,
		m0_state_s       ,
		m1_state_s       ,
		m2_state_s       ,
		m3_state_s       ,
		sec_q_s          ,
		off_btn_s        ,
		toc_hour_0_s     ,
		toc_hour_1_s     ,
		toc_minutes_1_s  ,
		toc_minutes_0_s  ,
		toc_seconds_1_s  ,
		toc_seconds_0_s  ,
		toa_valid_s      ,
		dr_s             ,
		snd_s            ,
		snd_led_s
	);
    --
    doTB : PROCESS
    BEGIN
        c_hour_0_s <= "0000";
        c_hour_1_s <= "0000";
		c_minutes_1_s  <= "0001";
		c_minutes_0_s  <= "0011";
		c_seconds_1_s  <= "0000";
		c_seconds_0_s  <= "0000";
		hour_0_s       <= "0000";
		hour_1_s       <= "0000";
		minutes_1_s    <= "1001";
		minutes_0_s    <= "0010";
		seconds_1_s    <= "0000";
		seconds_0_s    <= "0000";
        dv_s <= '0';
        m0_state_s <= '0';
        m1_state_s <= '0';
        m2_state_s <= '0';
        m3_state_s <= '0';
        off_btn_s <= '0';
        WAIT FOR 500 NS;
        dv_s <= '1';
        WAIT FOR 500 NS;
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

END a1;
