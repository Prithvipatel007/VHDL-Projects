library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture top_level_rx_a of top_level_rx_e is

    component receiver_e is 
        port(rst_i : IN std_logic;
            clk_i : IN std_logic;
            rxd_i : IN std_logic;
            bd9k6_i : IN std_logic;
            prt_o : OUT std_logic;
            bd_ena_o : OUT std_logic;
            bit_ena_o : OUT std_logic;
            prt_ena_o : OUT std_logic;
            bit_o: OUT std_logic);
    end component receiver_e;
	
	component baud_e is
	port ( clk_i,rst_i: in std_logic;
			bdr_o: out std_logic);
	end component baud_e;

    component sft_reg_e IS
        PORT (  rst_i : IN std_logic;
                clk_i : IN std_logic;
                bit_ena_i : IN std_logic;
                bit_i	: IN std_logic;
                pass_o	: OUT std_logic_vector(7 DOWNTO 0);
				dv_o	: OUT std_logic);
    end component sft_reg_e;

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

    signal bdr_s : std_logic;
	signal prt_s, bd_ena_s, bit_ena_s, prt_ena_s, bit_s : std_logic;
	signal pass_s : std_logic_vector(7 downto 0);
	signal dotl_s, dots_s, dashl_s, dashs_s, sft_dv_s : std_logic;
	signal morse_s : std_logic;

 begin
	
	baud_l : baud_e port map (clk_i, rst_i, bdr_s);
	
	signal_generator_l : signal_generator_e port map (clk_i, rst_i, dotl_s, dots_s, dashl_s, dashs_s );
	
    receiver_l : receiver_e port map (rst_i, clk_i, rx_i, bdr_s, prt_s, bd_ena_s, bit_ena_s, prt_ena_s, bit_s);
	
	sft_reg_l : sft_reg_e port map (rst_i, clk_i, bit_ena_s, bit_s, pass_s, sft_dv_s);
	
	ascii_morse_l : ascii_morse_e port map (clk_i, rst_i, pass_s, sft_dv_s, dots_s, dashs_s, morse_s);

    morse_o <= morse_s;
	
end top_level_rx_a;