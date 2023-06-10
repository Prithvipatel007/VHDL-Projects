library ieee;
use ieee.std_logic_1164.all;

architecture tb_morse_ascii_a of tb_morse_ascii_e is
	
	component morse_ascii_e is
		port (
			clk_i       : in std_logic;
			rst_i       : in std_logic;
			morse_i        : in std_logic;
			dots_i       : in std_logic;
			dashs_i	     :	in std_logic;
			ascii_o: out std_logic_vector(7 downto 0);
			dv_o   : out std_logic
		);
	end component morse_ascii_e;
	
	signal clk_s       : std_logic;
	signal rst_s       : std_logic;
	signal morse_s        : std_logic;
	signal dots_s       : std_logic;
	signal dashs_s		: std_logic;
	signal ascii_s:  std_logic_vector(7 downto 0);
	signal dv_s   :  std_logic;
	
begin
	
	uut : morse_ascii_e port map (clk_s, rst_s, morse_s, dots_s, dashs_s, ascii_s, dv_s);

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
		rst_s <= '1';
		wait;
	end process rst_p;

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

	pr_p : process
	begin
		morse_s <= '0';
		wait until falling_edge(dots_s);
		wait until falling_edge(dots_s);

		-- dot
		morse_s <= '1';
		wait until falling_edge(dots_s);
		morse_s <= '0';
		wait until falling_edge(dots_s);

		-- dash
		wait until falling_edge(dashs_s);
		morse_s <= '1';
		wait until falling_edge(dashs_s);
		morse_s <= '0';
		wait until falling_edge(dashs_s);
		
		-- dot
		morse_s <= '1';
		wait until falling_edge(dots_s);
		morse_s <= '0';
		wait until falling_edge(dots_s);

		-- dash
		wait until falling_edge(dashs_s);
		morse_s <= '1';
		wait until falling_edge(dashs_s);
		morse_s <= '0';
		wait until falling_edge(dashs_s);

		-- dot
		morse_s <= '1';
		wait until falling_edge(dots_s);
		morse_s <= '0';
		wait until falling_edge(dots_s);

		-- dash
		wait until falling_edge(dashs_s);
		morse_s <= '1';
		wait until falling_edge(dashs_s);
		morse_s <= '0';
		wait until falling_edge(dashs_s);

		-- dot
		morse_s <= '1';
		wait until falling_edge(dots_s);
		morse_s <= '0';
		wait until falling_edge(dots_s);

		-- dash
		wait until falling_edge(dashs_s);
		morse_s <= '1';
		wait until falling_edge(dashs_s);
		morse_s <= '0';
		wait until falling_edge(dashs_s);


		wait;	
	end process pr_p;
	
end tb_morse_ascii_a;