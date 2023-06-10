LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY top_level_transmission_e IS
    PORT (
        clk_i       : IN STD_LOGIC;
        rst_i       : IN STD_LOGIC;
        mc_i        : IN STD_LOGIC;
        txd_o       : OUT STD_LOGIC;
		heart_beat_o	:	OUT STD_LOGIC
    );
END top_level_transmission_e;