LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------
ENTITY bcd_cnt4_e IS
    PORT(
            rb_i      : IN STD_LOGIC;
            cp_i      : IN STD_LOGIC;
            en_i      : IN STD_LOGIC;
            clk_1k_i  : IN STD_LOGIC;
            clr_i     : IN STD_LOGIC;
            co_o      : OUT STD_LOGIC;
            q_o       : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END bcd_cnt4_e;
-----------------------------------------

