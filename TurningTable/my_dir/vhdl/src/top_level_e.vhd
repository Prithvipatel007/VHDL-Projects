library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
------------------------------------------------------------------------------------------------------------------------------
ENTITY top_level IS PORT(
    rb_i    :   IN STD_LOGIC;
    cp_i    :   IN STD_LOGIC;
    rs_i    :   IN STD_LOGIC;
    sw_i    :   IN STD_LOGIC;
    sec_o   :   OUT STD_LOGIC;
    gate_o  :   OUT STD_LOGIC;
    rs_o    :   OUT STD_LOGIC;
    txd_o   :   OUT STD_LOGIC
);
END top_level;
------------------------------------------------------------------------------------------------------------------------------
