ARCHITECTURE arch of sft_reg_tb IS

  COMPONENT sft_reg_e IS 
    PORT (rst_i : IN std_logic;
		  clk_i : IN std_logic;
		  bit_ena_i : IN std_logic;
		  bit_i	: IN std_logic;
		  pass_o	: OUT std_logic_vector(7 DOWNTO 0);
		  dv_o : OUT std_logic); END COMPONENT;
		  
SIGNAL rst_s, clk_s, ena_s, d_s, dv_s : std_logic;
SIGNAL q_s : std_logic_vector(7 DOWNTO 0);

BEGIN
 Shift_Register : sft_reg_e PORT MAP (rst_s, clk_s, ena_s, d_s, q_s, dv_s);
 
 ----------------------------------------------------------------------------------------------------------------- Clock Generator
	clocked : PROCESS
	BEGIN
		clk_s <= '1';
		WAIT FOR 10 ns;
		clk_s <= '0';
		WAIT FOR 10 ns;
	END PROCESS clocked;
	
----------------------------------------------------------------------------------------------------------------- Enable Signal
	enable_signal_tb : PROCESS
	BEGIN
		ena_s <= '1';
		WAIT FOR 20 ns;
		ena_s <= '0';
		WAIT FOR 104 us;
	END PROCESS enable_signal_tb;
	
-----------------------------------------------------------------------------------------------------------------
	shifting_process : PROCESS
	BEGIN
	
	  rst_s <= '0';
	  wait for 200 ns;
	  rst_s <= '1';
	  wait for 200 ns;
	
	  d_s <= '1';
	  WAIT FOR 104 us;
	  d_s <= '1';
	  WAIT FOR 104 us;
	  d_s <= '0';
	  WAIT FOR 104 us;
	  d_s <= '0';
	  WAIT FOR 104 us;
	  d_s <= '1';
	  WAIT FOR 104 us;
      d_s <= '1';
	  WAIT FOR 104 us;
	  d_s <= '0';
	  WAIT FOR 104 us;
	  d_s <= '0';
	  WAIT FOR 104 us;
	  WAIT;
	  
	END PROCESS shifting_process;
END arch;