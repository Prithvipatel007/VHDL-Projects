LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------------------------------------------------------------
ENTITY debouncer_e IS
    PORT(
        rb_i    :   IN STD_LOGIC;
        cp_i    :   IN STD_LOGIC;
        rs_i    :   IN STD_LOGIC;
        en_i    :   IN STD_LOGIC; 		---1K signal
        secp_i  :   IN STD_LOGIC;
        cl_o    :   OUT STD_LOGIC;
        gate_o  :   OUT STD_LOGIC;
        dv_o    :   OUT STD_LOGIC);
END debouncer_e;
-------------------------------------------------------------------------------------------------------------------------------
