library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ascii_morse_e is
    port (
        clk_i       : in std_logic;
        rst_i     : in std_logic;
        data_i   : in std_logic_vector(7 downto 0);
        dv_i        : in std_logic;
        dots_i    : in std_logic;
        dashs_i    : in std_logic;
        morse_o : out std_logic
    );
end ascii_morse_e;