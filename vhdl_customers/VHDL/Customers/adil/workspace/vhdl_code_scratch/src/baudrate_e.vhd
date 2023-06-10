LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY baudrate_e IS PORT(
    rb_i, cp_i               :  IN STD_LOGIC;
    brd_o, clk_1k_o ,sec_o, secp_o  :  OUT STD_LOGIC
);
END baudrate_e;

