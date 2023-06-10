ARCHITECTURE a1 OF tb_track_timer_e IS

    COMPONENT track_timer_e IS 
    PORT(
        rb_i        :   IN STD_LOGIC;
        cp_i        :   IN STD_LOGIC;
        sec_i       :   IN STD_LOGIC;
        hour_0_o    :   OUT std_logic_vector(3 downto 0);
        hour_1_o    :   OUT std_logic_vector(3 downto 0);
        minutes_1_o :   OUT std_logic_vector(3 downto 0);
        minutes_0_o :   OUT std_logic_vector(3 downto 0);
        seconds_1_o :   OUT std_logic_vector(3 downto 0);
        seconds_0_o :   OUT std_logic_vector(3 downto 0)
        );
    END  COMPONENT track_timer_e;

    SIGNAL rb_s        :   STD_LOGIC;
	SIGNAL cp_s        :   STD_LOGIC;
	SIGNAL sec_s       :   STD_LOGIC;
	SIGNAL hour_0_s    :   std_logic_vector(3 downto 0);
	SIGNAL hour_1_s    :   std_logic_vector(3 downto 0);
	SIGNAL minutes_1_s :   std_logic_vector(3 downto 0);
	SIGNAL minutes_0_s :   std_logic_vector(3 downto 0);
	SIGNAL seconds_1_s :   std_logic_vector(3 downto 0);
	SIGNAL seconds_0_s :   std_logic_vector(3 downto 0);
    
--
BEGIN

    uun4 : track_timer_e PORT MAP (rb_s, cp_s, sec_s, hour_0_s, hour_1_s, minutes_0_s, minutes_1_s, seconds_0_s, seconds_1_s);
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
END a1;
