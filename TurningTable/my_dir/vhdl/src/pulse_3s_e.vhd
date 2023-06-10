LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------------------------------------------------------------
ENTITY pulse_3s_e IS 
    PORT(
        rb_i : IN STD_LOGIC;
        cp_i : IN STD_LOGIC;
        sec_i : IN  STD_LOGIC;
        cl_i : IN  STD_LOGIC;
        pul_3s_o : OUT STD_LOGIC);
END pulse_3s_e;