library ieee;
use ieee.std_logic_1164.all;

entity c12ec_e is 
    port(
        rst_i,clk_i,en_i,cl_i     : in std_logic;
        q3_o,co_o               : out std_logic);
end c12ec_e;