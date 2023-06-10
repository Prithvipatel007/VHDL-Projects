library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture tb_ascii_morse_a of tb_ascii_morse_e is
    
	component ascii_morse_e is
		port (
			clk_i       : in std_logic;
			rst_i     : in std_logic;
			data_i   : in std_logic_vector(7 downto 0);
			dv_i        : in std_logic;
			dots_i    : in std_logic;
			dashs_i    : in std_logic;
			morse_o : out std_logic
		);
	end component ascii_morse_e;

	signal clk_s       	: std_logic;
	signal rst_s     	: std_logic;
	signal data_s   	: std_logic_vector(7 downto 0);
	signal dv_s        	: std_logic;
	signal dots_s       	: std_logic;
	signal dashs_s       : std_logic;
	signal morse_s 	: std_logic;

begin

	uut : ascii_morse_e port map (clk_s, rst_s, data_s, dv_s, dots_s, dashs_s, morse_s);
	
	clk_p : process
	begin

		clk_s <= '1';
		wait for 41.5 ns;
		clk_s <= '0';
		wait for 41.5 ns;

	end process clk_p;

	rst_p : process
	begin
		rst_s <= '0';
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		rst_s <= '1';
		wait;
	end process rst_p;
	
	pr_p : process 
	begin
		data_s <= "10101010";
		dv_s <= '1';
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
		wait until rising_edge(clk_s);
				
		wait;
		
	end process pr_p;

	dot_p : process 
	begin
		dots_s <= '1';
		wait until rising_edge(clk_s);
		dots_s <= '0';
		for i in 0 to 1 loop
			wait until rising_edge(clk_s);
			wait until rising_edge(clk_s);
			wait until rising_edge(clk_s);
			wait until rising_edge(clk_s);
			wait until rising_edge(clk_s);
		end loop;
	end process dot_p;

	dash_p : process
	begin
		dashs_s <= '1';
		wait until rising_edge(clk_s);
		dashs_s <= '0';
		wait until rising_edge(clk_s);
		for i in 0 to 3 loop
			wait until rising_edge(clk_s);
			wait until rising_edge(clk_s);
			wait until rising_edge(clk_s);
			wait until rising_edge(clk_s);
			wait until rising_edge(clk_s);
		end loop;
	end process dash_p;

end tb_ascii_morse_a;
