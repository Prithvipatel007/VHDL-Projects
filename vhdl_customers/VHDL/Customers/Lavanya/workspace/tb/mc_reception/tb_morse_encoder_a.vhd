LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ARCHITECTURE tb_morse_encoder_a OF tb_morse_encoder_e IS
    
	COMPONENT morse_encoder_e IS
		PORT (
			clk_i       : IN STD_LOGIC;
			rst_i     : IN STD_LOGIC;
			rx_data_i   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			rx_dv_i     : IN STD_LOGIC;
			dot_i       : IN STD_LOGIC;
			dot_en_i    : IN STD_LOGIC;
			dash_i       : IN STD_LOGIC;
			dash_en_i    : IN STD_LOGIC;
			empty_i     : IN STD_LOGIC;
			morse_led_o : OUT STD_LOGIC;
			rd_o : OUT STD_LOGIC
		);
	END COMPONENT morse_encoder_e;

	SIGNAL clk_s       	: STD_LOGIC;
	SIGNAL rst_s     	: STD_LOGIC;
	SIGNAL rx_data_s   	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL rx_dv_s     	: STD_LOGIC;
	SIGNAL dot_s       	: STD_LOGIC;
	SIGNAL dot_en_s    	: STD_LOGIC;
	SIGNAL dash_s       : STD_LOGIC;
	SIGNAL dash_en_s    : STD_LOGIC;
	SIGNAL empty_s 		: STD_LOGIC;
	SIGNAL morse_led_s 	: STD_LOGIC;
	SIGNAL rd_s 		: STD_LOGIC;

BEGIN

	uut : morse_encoder_e PORT MAP (clk_s, rst_s, rx_data_s, rx_dv_s, dot_s, dot_en_s, dash_s, dash_en_s, empty_s, morse_led_s, rd_s);
	
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
	
	functioning : PROCESS 
	BEGIN
		dot_s <= '0';
		dash_s <= '0';
		rx_data_s <= "10101010";
		empty_s <= '0';
		rx_dv_s <= '1';
		WAIT UNTIL rising_edge(clk_s);
		rx_dv_s <= '0';
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		empty_s <= '1';		
		WAIT;
		
	END PROCESS functioning;

	dot_process : PROCESS 
	BEGIN
		dot_en_s <= '1';
		WAIT UNTIL rising_edge(clk_s);
		dot_en_s <= '0';
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
	END PROCESS dot_process;

	dash_process : PROCESS
	BEGIN
		dash_en_s <= '1';
		WAIT UNTIL rising_edge(clk_s);
		dash_en_s <= '0';
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
	END PROCESS dash_process;

END tb_morse_encoder_a;
