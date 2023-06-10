library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------------------------------------------------------------------------
ENTITY transmission_e IS 
    PORT(
        rb_i        :   IN STD_LOGIC;
        cp_i        :   IN STD_LOGIC;
        digit3_i    :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);			
        digit2_i    :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        digit1_i    :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        digit0_i    :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        cr_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);			
        lf_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        brd_i       :   IN STD_LOGIC;
        dv_i        :   IN STD_LOGIC;
        txd_o       :   OUT STD_LOGIC);
END transmission_e;
-----------------------------------------------------------------------------------------------------------------------------------------
