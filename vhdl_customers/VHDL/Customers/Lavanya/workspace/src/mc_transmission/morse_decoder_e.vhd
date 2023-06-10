LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY morse_decoder_e IS
    PORT (
        clk_i       : IN STD_LOGIC;
        rst_i       : IN STD_LOGIC;
        mc_i        : IN STD_LOGIC;
        dot_i       : IN STD_LOGIC;
        dash_i      : IN STD_LOGIC;
        char_ascii_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        char_dv_o   : OUT STD_LOGIC
    );
END morse_decoder_e;