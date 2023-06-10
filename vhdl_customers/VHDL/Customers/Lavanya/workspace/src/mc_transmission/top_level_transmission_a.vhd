LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ARCHITECTURE top_level_transmission_a OF top_level_transmission_e IS

    COMPONENT clock_divider_e IS
        PORT(
            clk_i       :   IN STD_LOGIC;
            rst_i     :   IN STD_LOGIC;
            q4Hz_o      :   OUT STD_LOGIC;
            co4Hz_o     :   OUT STD_LOGIC;
            q2Hz_o      :   OUT STD_LOGIC;
            co2Hz_o     :   OUT STD_LOGIC;
            brd_o       :   OUT STD_LOGIC
        );
    END COMPONENT clock_divider_e;

    COMPONENT morse_decoder_e IS
        PORT (
            clk_i       : IN STD_LOGIC;
            rst_i       : IN STD_LOGIC;
            mc_i        : IN STD_LOGIC;
            dot_i       : IN STD_LOGIC;
            dash_i      : IN STD_LOGIC;
            char_ascii_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            char_dv_o   : OUT STD_LOGIC
        );
    END COMPONENT morse_decoder_e;

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

    SIGNAL q4Hz_s, co4Hz_s, q2Hz_s, co2Hz_s, brd_s, char_dv_s, txd_s :   STD_LOGIC;
    SIGNAL char_ascii_s : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN

clock_divider_ut: clock_divider_e PORT MAP (clk_i, rst_i, q4Hz_s, co4Hz_s, q2Hz_s, co2Hz_s, brd_s);

decoder_ut: morse_decoder_e PORT MAP (clk_i, rst_i, mc_i, co4Hz_s, co2Hz_s, char_ascii_s, char_dv_s);

tx_ut : uart_tx_e PORT MAP (rst_i, clk_i, brd_s, char_ascii_s, char_dv_s, txd_s);

txd_o <= txd_s;
heart_beat_o <= q4Hz_s;


END top_level_transmission_a;