library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture signal_generator_a of signal_generator_e is

component c10ec_e is 
    port(
        rst_i,clk_i,en_i,cl_i     : in std_logic;
        q3_o,co_o               : out std_logic);
end component c10ec_e;

component c02ec_e is 
    port(
        rst_i,clk_i,en_i,cl_i     : in std_logic;
        q3_o,co_o               : out std_logic);
end component c02ec_e;

component c12ec_e is 
    port(
        rst_i,clk_i,en_i,cl_i     : in std_logic;
        q3_o,co_o               : out std_logic);
end component c12ec_e;

component c05ec_e is 
    port(
        rst_i,clk_i,en_i,cl_i     : in std_logic;
        q3_o,co_o               : out std_logic);
end component c05ec_e;

signal c1m_q_s, c100k_q_s, c10k_q_s, c1k_q_s, c100_q_s, c20_q_s, c4_q_s, c2_q_s : std_logic;
signal c1m_c_s, c100k_c_s, c10k_c_s, c1k_c_s, c100_c_s, c20_c_s, c4_c_s, c2_c_s : std_logic;

begin

-- generating dot and dash signals

c_1mz : c12ec_e port map (rst_i, clk_i, '1', '0', c1m_q_s, c1m_c_s);
c_100k : c10ec_e port map (rst_i, clk_i, c1m_c_s, '0', c100k_q_s, c100k_c_s);
c_10_k : c10ec_e port map (rst_i, clk_i, c100k_c_s, '0', c10k_q_s, c10k_c_s);
c_1k   : c10ec_e port map (rst_i, clk_i, c10k_c_s, '0', c1k_q_s, c1k_c_s);
c_100  : c10ec_e port map (rst_i, clk_i, c1k_c_s, '0', c100_q_s, c100_c_s);
c_20   : c05ec_e port map (rst_i, clk_i, c100_c_s, '0', c20_q_s, c20_c_s);
c_4    : c05ec_e port map (rst_i, clk_i, c20_c_s, '0', c4_q_s, c4_c_s);
c_2    : c02ec_e port map (rst_i, clk_i, c4_c_s, '0', c2_q_s, c2_c_s);


assign : process (clk_i, rst_i)
begin
    if(rst_i = '0') then 
        dotl_o  <= '0';
        dots_o  <= '0';
        dashl_o <= '0';
        dashs_o <= '0';
    elsif(rising_edge(clk_i)) then
        dotl_o  <= c4_q_s;
        dots_o  <= c4_c_s;
        dashl_o <= c2_q_s;
        dashs_o <= c2_c_s;
    end if;
end process assign;

end signal_generator_a;
