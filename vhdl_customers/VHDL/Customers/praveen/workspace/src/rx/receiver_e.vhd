-------------------------------------
-- Receiver Entity
-------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY receiver_e is 
    PORT(rst_i : IN std_logic;
         clk_i : IN std_logic;
         rxd_i : IN std_logic;
         bd9k6_i : IN std_logic;
         prt_o : OUT std_logic;
		 bd_ena_o : OUT std_logic;
		 bit_ena_o : OUT std_logic;
		 prt_ena_o : OUT std_logic;
         bit_o: OUT std_logic);
END receiver_e;
-------------------------------------