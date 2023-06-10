LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ARCHITECTURE tb_top_level_reception_a OF tb_top_level_reception_e IS

    COMPONENT top_level_reception_e IS
        PORT(
            clk_i       :   IN STD_LOGIC;
            rst_i     :   IN STD_LOGIC;
            rx_data_i : IN STD_LOGIC;
            morse_led_o : OUT STD_LOGIC;
			ram_full_o : OUT STD_LOGIC;
			heart_beat_o : OUT STD_LOGIC
        );
    END COMPONENT top_level_reception_e;

    SIGNAL clk_s : STD_LOGIC;
    SIGNAL rst_s : STD_LOGIC;
    SIGNAL rx_data_s : STD_LOGIC;
    SIGNAL morse_led_s : STD_LOGIC;
	SIGNAL ram_full_s : STD_LOGIC;
	SIGNAL heart_beat_s : STD_LOGIC;

BEGIN

    reception_uut : top_level_reception_e PORT MAP (clk_s, rst_s, rx_data_s, morse_led_s, ram_full_s, heart_beat_s);

    clocked : PROCESS
	BEGIN
		clk_s <= '1';
		WAIT FOR 41.66666665 ns;
		clk_s <= '0';
		WAIT FOR 41.66666665 ns;
	END PROCESS clocked;

    reset : PROCESS
	BEGIN
		rst_s <= '0';
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		rst_s <= '1';
		WAIT;
	END PROCESS reset;

    reception : PROCESS
    BEGIN

        rx_data_s <= '0';	
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);

        rx_data_s <= '1';
        WAIT FOR 104 us;  
        rx_data_s <= '0';	
        WAIT FOR 104 us;
        
        rx_data_s <= '1';
        WAIT FOR 104 us;
        rx_data_s <= '1';
        WAIT FOR 104 us;
        rx_data_s <= '0';
        WAIT FOR 104 us;
        rx_data_s <= '0';
        WAIT FOR 104 us;
        rx_data_s <= '1';
        WAIT FOR 104 us;
        rx_data_s <= '1';
        WAIT FOR 104 us;
        rx_data_s <= '0';
        WAIT FOR 104 us;
        rx_data_s <= '0';
        WAIT FOR 104 us;
        
        rx_data_s <= '1';
        WAIT FOR 104 us;
        rx_data_s <= '1';
        WAIT FOR 104 us;

        WAIT for 200 us;
        wait until rising_edge(clk_s);

        rx_data_s <= '1';
        WAIT FOR 104 us;  
        rx_data_s <= '0';	
        WAIT FOR 104 us;
        
        rx_data_s <= '0';
        WAIT FOR 104 us;
        rx_data_s <= '1';
        WAIT FOR 104 us;
        rx_data_s <= '0';
        WAIT FOR 104 us;
        rx_data_s <= '1';
        WAIT FOR 104 us;
        rx_data_s <= '0';
        WAIT FOR 104 us;
        rx_data_s <= '1';
        WAIT FOR 104 us;
        rx_data_s <= '0';
        WAIT FOR 104 us;
        rx_data_s <= '1';
        WAIT FOR 104 us;
        
        rx_data_s <= '1';
        WAIT FOR 104 us;
        rx_data_s <= '1';
        WAIT FOR 104 us;

        WAIT;

    END PROCESS reception;

END tb_top_level_reception_a;