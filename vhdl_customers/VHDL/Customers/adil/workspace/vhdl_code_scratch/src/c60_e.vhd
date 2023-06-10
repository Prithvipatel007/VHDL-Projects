LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------
ENTITY c60_e IS
    PORT(
        --
        --  Inputs
        --
        rb_i    : IN STD_LOGIC;
        cp_i    : IN STD_LOGIC;
        sec_i   : IN STD_LOGIC;
        --
        -- Outputs
        --
        s0_o        : OUT STD_LOGIC_VECTOR(3 downto 0);  -- data representing time
        s1_o        : OUT STD_LOGIC_VECTOR(3 downto 0);
        sco_o       : OUT STD_LOGIC
        );
END c60_e;
-----------------------------------------
