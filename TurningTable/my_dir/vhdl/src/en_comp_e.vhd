LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------------------------------------------------------
ENTITY en_comp_e IS
    PORT(
        en1_i : IN STD_LOGIC;
        sel_i : IN STD_LOGIC;
        co_10m_i : IN STD_LOGIC;
        en1_o : OUT STD_LOGIC );
END en_comp_e;
