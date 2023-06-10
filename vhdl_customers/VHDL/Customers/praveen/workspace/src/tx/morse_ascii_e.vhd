library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity morse_ascii_e is
    port (
        clk_i       : in std_logic;
        rst_i       : in std_logic;
        morse_i        : in std_logic;
        dots_i       : in std_logic;
        dashs_i     :   in std_logic;
        ascii_o: out std_logic_vector(7 downto 0);
        dv_o   : out std_logic
    );
end morse_ascii_e;