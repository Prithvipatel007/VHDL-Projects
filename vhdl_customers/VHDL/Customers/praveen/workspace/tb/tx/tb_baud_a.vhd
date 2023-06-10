library ieee;
use ieee.std_logic_1164.all;

architecture tb_baud_a of tb_baud_e is

	component baud_e is
	port ( clk_i,rst_i: in std_logic;
			bdr_o: out std_logic);
	end component baud_e;
	
	signal clk_s, rst_s, bdr_s : std_logic;

begin
	
	uut : baud_e port map (clk_s, rst_s, bdr_s);
	
	clk_p : process
	begin
		clk_s <= '1';
		wait for 41.5 ns;
		clk_s <= '0';
		wait for 41.5 ns;
	end process clk_p;
	
	
	rst_p : process
	begin
		rst_s <= '1';
		wait;
	end process rst_p;

end tb_baud_a;