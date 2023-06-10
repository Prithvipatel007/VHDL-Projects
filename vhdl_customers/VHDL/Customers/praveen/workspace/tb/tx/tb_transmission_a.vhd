architecture tb_transmission_a of tb_transmission_e is
	
	component transmission_e is
		port(
			rst_i   : in std_logic;
			clk_i   : in std_logic;	
			bdr_i   : in std_logic;
			ascii_i : in std_logic_vector (7 downto 0);
			dv_i   : in std_logic;
			serial_o  : out std_logic
		);
	end component transmission_e;
	
	signal rst_s   : std_logic;
	signal clk_s   : std_logic;	
	signal bdr_s   : std_logic;
	signal ascii_s : std_logic_vector (7 downto 0);
	signal dv_s   : std_logic;
	signal serial_s  : std_logic;
	
begin
	
	ascii_s <= "10101010";
	
	uut : transmission_e port map (rst_s, clk_s, bdr_s,ascii_s, dv_s, serial_s);
	
	cp_p : process 
	begin 
		clk_s <= '1';
		wait for 41.5 ns;
		clk_s <= '0';
		wait for 41.5 ns;		
		
	end process cp_p;
	
	bdr_p : process 
	begin 
		bdr_s <= '1';
		wait until rising_edge(clk_s);
		bdr_s <= '0';
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		
	end process bdr_p;
	
	rst_p : process 
	begin
		rst_s <= '0';
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		rst_s <= '1';
		wait;
	end process rst_p;
	
	
	
	pr_p : process 
	begin
		dv_s <= '0';
		for i in 0 to 5 loop
			wait until rising_edge(clk_s);
		end loop;
		
		wait until rising_edge(clk_s);
		dv_s <= '1';
		wait until rising_edge(clk_s);
		dv_s <= '0';
		wait;
	end process pr_p;

end tb_transmission_a;