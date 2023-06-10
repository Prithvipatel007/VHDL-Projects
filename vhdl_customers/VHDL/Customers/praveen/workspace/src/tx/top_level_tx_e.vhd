library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level_tx_e is
    port (
        clk_i       : in std_logic;
        rst_i       : in std_logic;
        morse_i     : in std_logic;
        serial_o	: out std_logic
    );
end top_level_tx_e;