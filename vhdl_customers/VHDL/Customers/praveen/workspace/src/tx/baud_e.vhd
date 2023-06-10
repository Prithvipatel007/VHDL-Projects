library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity baud_e is
port ( clk_i,rst_i: in std_logic;
		bdr_o: out std_logic);
end baud_e;
