LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------
ENTITY Cnt4_e IS
    PORT(
        rb_i    : IN STD_LOGIC;
        cp_i    : IN STD_LOGIC;
        en_i    : IN STD_LOGIC;
        cl_i    : IN STD_LOGIC;
        co_o    : OUT STD_LOGIC;
        q_o     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END Cnt4_e;
-----------------------------------------
