LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY filter_e IS
    PORT(
        rb_i : IN STD_LOGIC;
        cp_i : IN STD_LOGIC;
        rs_i : IN STD_LOGIC;
        en_i : IN STD_LOGIC;
        s_o  : OUT STD_LOGIC);
END filter_e;