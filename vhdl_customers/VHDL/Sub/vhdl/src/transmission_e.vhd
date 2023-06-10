library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------------------------------------------------------------------------
ENTITY transmission_e IS 
    PORT(
        rb_i        :   IN STD_LOGIC;
        cp_i        :   IN STD_LOGIC;
        hour_0_i    : IN std_logic_vector(7 downto 0);
        hour_1_i    : IN std_logic_vector(7 downto 0);
        minutes_1_i : IN std_logic_vector(7 downto 0);
        minutes_0_i : IN std_logic_vector(7 downto 0);
        seconds_1_i : IN std_logic_vector(7 downto 0);
        seconds_0_i : IN std_logic_vector(7 downto 0);
        cr_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);			
        lf_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        brd_i       :   IN STD_LOGIC;
        dv_i        :   IN STD_LOGIC;
        txd_o       :   OUT STD_LOGIC);
END transmission_e;
-----------------------------------------------------------------------------------------------------------------------------------------
