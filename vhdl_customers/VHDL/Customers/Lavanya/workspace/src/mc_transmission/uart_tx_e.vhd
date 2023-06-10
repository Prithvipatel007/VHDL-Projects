LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------
ENTITY uart_tx_e IS
    PORT(
        rst_i   : IN STD_LOGIC;
        clk_i   : IN STD_LOGIC;	
        brd_i   : IN STD_LOGIC;
        char_ascii_i : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        dv_i   : IN STD_LOGIC;
        txd_o  : OUT STD_LOGIC
    );
END uart_tx_e;
-----------------------------------------
