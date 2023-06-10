library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level_rx_e is
    port (
        clk_i       : in std_logic;
        rst_i       : in std_logic;
        rx_i        : in std_logic;
        morse_o     : out std_logic
    );
end top_level_rx_e;