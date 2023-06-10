library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signal_generator_e is
    port(
        clk_i       :   in std_logic;
        rst_i     :   in std_logic;
        dotl_o      :   out std_logic;
        dots_o     :   out std_logic;
        dashl_o      :   out std_logic;
        dashs_o     :   out std_logic
    );
end signal_generator_e;