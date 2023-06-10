LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------
ENTITY uart_ctrl_e IS
    PORT(
        rb_i   : IN STD_LOGIC;
        cp_i   : IN STD_LOGIC;	
        brd_i  : IN STD_LOGIC;
        dv_i   : IN STD_LOGIC;
        done_i : IN STD_LOGIC;
        en_o   : OUT STD_LOGIC;
        cl_o   : OUT STD_LOGIC);
END uart_ctrl_e;
-----------------------------------------
