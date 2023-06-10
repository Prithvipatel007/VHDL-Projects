ARCHITECTURE tb_uart_tx_a OF tb_uart_tx_e IS
	
	COMPONENT uart_tx_e IS
		PORT(
			rst_i   : IN STD_LOGIC;
			clk_i   : IN STD_LOGIC;	
			brd_i   : IN STD_LOGIC;
			char_ascii_i : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			dv_i   : IN STD_LOGIC;
			txd_o  : OUT STD_LOGIC
		);
	END COMPONENT uart_tx_e;
	
	SIGNAL rst_s   : STD_LOGIC;
	SIGNAL clk_s   : STD_LOGIC;	
	SIGNAL brd_s   : STD_LOGIC;
	SIGNAL char_ascii_s : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL dv_s   : STD_LOGIC;
	SIGNAL txd_s  : STD_LOGIC;
	
BEGIN

	uut : uart_tx_e PORT MAP (rst_s, clk_s, brd_s,char_ascii_s, dv_s, txd_s);
	
	clocked : PROCESS 
	BEGIN 
		clk_s <= '1';
		WAIT FOR 41.5 ns;
		clk_s <= '0';
		WAIT FOR 41.5 ns;		
		
	END PROCESS clocked;
	
	baudrate : PROCESS 
	BEGIN 
		brd_s <= '1';
		WAIT UNTIL rising_edge(clk_s);
		brd_s <= '0';
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		
	END PROCESS baudrate;
	
	reset : PROCESS 
	BEGIN
		rst_s <= '0';
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		rst_s <= '1';
		WAIT;
	END PROCESS reset;
	
	char_ascii_s <= "10101010";
	
	functioning : PROCESS 
	BEGIN
		dv_s <= '0';
		for i in 0 to 5 loop
			WAIT UNTIL rising_edge(clk_s);
		end loop;
		
		WAIT UNTIL rising_edge(clk_s);
		dv_s <= '1';
		WAIT UNTIL rising_edge(clk_s);
		dv_s <= '0';
		WAIT;
	END PROCESS functioning;

END tb_uart_tx_a;