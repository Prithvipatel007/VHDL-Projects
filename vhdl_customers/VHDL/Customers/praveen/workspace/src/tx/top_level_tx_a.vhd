library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture top_level_tx_a of top_level_tx_e is

	component baud_e is
	port ( clk_i,rst_i: in std_logic;
			bdr_o: out std_logic);
	end component baud_e;
	
	component signal_generator_e is
		port(
			clk_i       :   in std_logic;
			rst_i     :   in std_logic;
			dotl_o      :   out std_logic;
			dots_o     :   out std_logic;
			dashl_o      :   out std_logic;
			dashs_o     :   out std_logic
		);
	end component signal_generator_e;
	
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
	
	component morse_ascii_e is
		port (
			clk_i       : in std_logic;
			rst_i       : in std_logic;
			morse_i        : in std_logic;
			dots_i       : in std_logic;
			dashs_i     :   in std_logic;
			ascii_o: out std_logic_vector(7 downto 0);
			dv_o   : out std_logic
		);
	end component morse_ascii_e;
	
	signal bdr_s : std_logic;
	signal dotl_s, dots_s, dashl_s, dashs_s : std_logic;
	signal ascii_s : std_logic_vector(7 downto 0);
	signal dv_s, serial_s : std_logic;

begin

	baud_l : baud_e port map (clk_i, rst_i, bdr_s);
	
	signal_generator_l : signal_generator_e port map (clk_i, rst_i, dotl_s, dots_s, dashl_s, dashs_s );

	morse_reception_l : morse_ascii_e PORT MAP (clk_i, rst_i, morse_i, dots_s, dashs_s, ascii_s, dv_s);
	
	transmission_l : transmission_e PORT MAP (rst_i, clk_i, bdr_s, ascii_s, dv_s, serial_s);
	
	serial_o <= serial_s;

end top_level_tx_a;