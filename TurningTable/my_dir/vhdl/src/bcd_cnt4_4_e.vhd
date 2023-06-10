LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY bcd_cnt4_4_e IS
    PORT(
           rb_i     : IN STD_LOGIC;   -- global reset
           cp_i     : IN STD_LOGIC; -- system clock
           clk_1k_i : IN STD_LOGIC; --- 1 KHz clock used for 4 digit counter
           en_i     : IN STD_LOGIC; -- enable
           clr_i    : IN STD_LOGIC;  -- clear
           digit_0_o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
           digit_1_o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
           digit_2_o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
           digit_3_o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END bcd_cnt4_4_e;
