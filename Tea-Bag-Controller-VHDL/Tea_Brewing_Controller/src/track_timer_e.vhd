library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------------------------------------------------------------------------
ENTITY track_timer_e IS 
    PORT(
        rb_i        :   IN STD_LOGIC;
        cp_i        :   IN STD_LOGIC;
        sec_i       :   IN STD_LOGIC;
        hour_0_o    :   OUT std_logic_vector(3 downto 0);
        hour_1_o    :   OUT std_logic_vector(3 downto 0);
        minutes_1_o :   OUT std_logic_vector(3 downto 0);
        minutes_0_o :   OUT std_logic_vector(3 downto 0);
        seconds_1_o :   OUT std_logic_vector(3 downto 0);
        seconds_0_o :   OUT std_logic_vector(3 downto 0)
        );
END track_timer_e;
-----------------------------------------------------------------------------------------------------------------------------------------
