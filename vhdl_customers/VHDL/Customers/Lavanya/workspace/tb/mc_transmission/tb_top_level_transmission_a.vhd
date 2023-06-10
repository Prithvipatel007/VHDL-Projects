ARCHITECTURE tb_top_level_transmission_a OF tb_top_level_transmission_e IS
	
    COMPONENT top_level_transmission_e IS
        PORT (
            clk_i       : IN STD_LOGIC;
            rst_i       : IN STD_LOGIC;
            mc_i        : IN STD_LOGIC;
            txd_o       : OUT STD_LOGIC;
			heart_beat_o	:	OUT STD_LOGIC
        );
    END COMPONENT top_level_transmission_e;

    COMPONENT clock_divider_e IS
        PORT(
            clk_i       :   IN STD_LOGIC;
            rst_i     :   IN STD_LOGIC;
            q4Hz_o      :   OUT STD_LOGIC;
            co4Hz_o     :   OUT STD_LOGIC;
            q2Hz_o      :   OUT STD_LOGIC;
            co2Hz_o     :   OUT STD_LOGIC;
            brd_o       :   OUT STD_LOGIC
        );
    END COMPONENT clock_divider_e;
	
	SIGNAL clk_s   : STD_LOGIC;
	SIGNAL rst_s   : STD_LOGIC;	
	SIGNAL mc_s   : STD_LOGIC;
	SIGNAL txd_s  : STD_LOGIC;

    SIGNAL heart_beat_s, q4Hz_s, co4Hz_s, q2Hz_s, co2Hz_s, brd_s :   STD_LOGIC;
	
BEGIN

clock_divider_ut: clock_divider_e PORT MAP (clk_s, rst_s, q4Hz_s, co4Hz_s, q2Hz_s, co2Hz_s, brd_s);

tx_ut : top_level_transmission_e PORT MAP (clk_s, rst_s, mc_s, txd_s, heart_beat_s);

    clock : process
    begin
        clk_s <= '1';
		WAIT FOR 41.5 ns;
		clk_s <= '0';
		WAIT FOR 41.5 ns;
    end process clock;

    reset : process
    begin
        rst_s <= '0';
        WAIT UNTIL rising_edge(clk_s);
        WAIT UNTIL rising_edge(clk_s);
        WAIT UNTIL rising_edge(clk_s);
        WAIT UNTIL rising_edge(clk_s);
        WAIT UNTIL rising_edge(clk_s);
        WAIT UNTIL rising_edge(clk_s);
        WAIT UNTIL rising_edge(clk_s);
        WAIT UNTIL rising_edge(clk_s);
        rst_s <= '1';
        wait;
    end process reset;

	morse_reception : process
	begin
		mc_s <= '0';
		wait until falling_edge(co4Hz_s);
		wait until falling_edge(co4Hz_s);

		-- dot
		mc_s <= '1';
		wait until falling_edge(co4Hz_s);
		mc_s <= '0';
		wait until falling_edge(co4Hz_s);

		-- Wait for 1 dot signal
		wait until falling_edge(co4Hz_s);

		-- dash
		mc_s <= '1';
		wait until falling_edge(co2Hz_s);
		mc_s <= '0';
		wait until falling_edge(co2Hz_s);

		-- Wait for 1 dot signal
		wait until falling_edge(co4Hz_s);
		
		-- dot
		mc_s <= '1';
		wait until falling_edge(co4Hz_s);
		mc_s <= '0';
		wait until falling_edge(co4Hz_s);

		-- Wait for 1 dot signal
		wait until falling_edge(co4Hz_s);

		-- dash
		mc_s <= '1';
		wait until falling_edge(co2Hz_s);
		mc_s <= '0';
		wait until falling_edge(co2Hz_s);

		-- Wait for 1 dot signal
		wait until falling_edge(co4Hz_s);

		-- dot
		mc_s <= '1';
		wait until falling_edge(co4Hz_s);
		mc_s <= '0';
		wait until falling_edge(co4Hz_s);

		-- Wait for 1 dot signal
		wait until falling_edge(co4Hz_s);

		-- dash
		mc_s <= '1';
		wait until falling_edge(co2Hz_s);
		mc_s <= '0';
		wait until falling_edge(co2Hz_s);

		-- Wait for 1 dot signal
		wait until falling_edge(co4Hz_s);

		-- dot
		mc_s <= '1';
		wait until falling_edge(co4Hz_s);
		mc_s <= '0';
		wait until falling_edge(co4Hz_s);

		-- Wait for 1 dot signal
		wait until falling_edge(co4Hz_s);

		-- dash
		mc_s <= '1';
		wait until falling_edge(co2Hz_s);
		mc_s <= '0';
		wait until falling_edge(co2Hz_s);
		wait;	
	end process morse_reception;




END tb_top_level_transmission_a;