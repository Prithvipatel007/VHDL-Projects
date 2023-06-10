ARCHITECTURE arch OF receiver_tb IS
	component receiver_e is 
		PORT(rst_i : IN std_logic;
			 clk_i : IN std_logic;
			 rxd_i : IN std_logic;
			 bd9k6_i : IN std_logic;
			 prt_o : OUT std_logic;
			 bd_ena_o : OUT std_logic;
			 bit_ena_o : OUT std_logic;
			 prt_ena_o : OUT std_logic;
			 bit_o: OUT std_logic);
	END component receiver_e;
	
	SIGNAL clk_s     : STD_LOGIC;
	SIGNAL rst_s   :STD_LOGIC;
	SIGNAL rxd_s      :STD_LOGIC;
	SIGNAL bd_s  :STD_LOGIC;
	SIGNAL prt_s : std_logic;
	SIGNAL bd_ena_s   :STD_LOGIC;
	SIGNAL bit_ena_s    :STD_LOGIC;
    SIGNAL prt_ena_s   :STD_LOGIC;
	SIGNAL data_s    :STD_LOGIC;
	
	BEGIN
	receiving : receiver_e PORT MAP (rst_s, clk_s, rxd_s, bd_s, prt_s, bd_ena_s, bit_ena_s, prt_ena_s, data_s);
----------------------------------------------------------------------------------------------------------------- Clock Generator
	clocked : PROCESS
	BEGIN
		clk_s <= '1';
		WAIT FOR 10 ns;
		clk_s <= '0';
		WAIT FOR 10 ns;
	END PROCESS clocked;

----------------------------------------------------------------------------------------------------------------- Baudrate Generator
	baud_rate_generator_tb : PROCESS
	BEGIN
		bd_s <= '1';
		WAIT FOR 20 ns;
		bd_s <= '0';
		WAIT FOR 104 us;
	END PROCESS baud_rate_generator_tb;

-----------------------------------------------------------------------------------------------------------------
	rxd_process : PROCESS
		BEGIN
		
		rst_s <= '0';
		wait for 200 ns;
		rst_s <= '1';
		wait for 200 ns;
		
		rxd_s <= '1';
		WAIT FOR 104 us;  
		rxd_s <= '0';	
		WAIT FOR 104 us;
		
		rxd_s <= '1';
		WAIT FOR 104 us;
		rxd_s <= '1';
		WAIT FOR 104 us;
		rxd_s <= '0';
		WAIT FOR 104 us;
		rxd_s <= '0';
		WAIT FOR 104 us;
		rxd_s <= '1';
		WAIT FOR 104 us;
		rxd_s <= '1';
		WAIT FOR 104 us;
		rxd_s <= '0';
		WAIT FOR 104 us;
		rxd_s <= '0';
		WAIT FOR 104 us;
		
		rxd_s <= '1';
		WAIT FOR 104 us;
		rxd_s <= '1';
		WAIT FOR 104 us;
		
		

		Wait for 2*104 us;
		
		rst_s <= '0';
		wait for 200 ns;
		rst_s <= '1';
		wait for 200 ns;
		
		rxd_s <= '1';
		WAIT FOR 104 us;  
		rxd_s <= '0';	
		WAIT FOR 104 us;
		
		rxd_s <= '1';
		WAIT FOR 104 us;
		rxd_s <= '1';
		WAIT FOR 104 us;
		rxd_s <= '0';
		WAIT FOR 104 us;
		rxd_s <= '0';
		WAIT FOR 104 us;
		rxd_s <= '1';
		WAIT FOR 104 us;
		rxd_s <= '1';
		WAIT FOR 104 us;
		rxd_s <= '0';
		WAIT FOR 104 us;
		rxd_s <= '0';
		WAIT FOR 104 us;
		
		rxd_s <= '0';
		WAIT FOR 104 us;
		rxd_s <= '1';
		WAIT FOR 104 us;	

	END PROCESS rxd_process;
	
	
END arch;
