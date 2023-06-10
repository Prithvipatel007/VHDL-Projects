LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------------------------------------------------------
ENTITY shaper_fsm_e IS 
    PORT(
        rb_i     : IN STD_LOGIC;
        cp_i     : IN STD_LOGIC;
        s_i      : IN STD_LOGIC;
        clk_1k_i : IN STD_LOGIC;
        secp_i   : IN STD_LOGIC;
        cl_o     : OUT STD_LOGIC;
        gate_o   : OUT STD_LOGIC;
        dv_o     : OUT STD_LOGIC);
END shaper_fsm_e;
