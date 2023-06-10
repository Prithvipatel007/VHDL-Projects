library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY timer_e IS 
    PORT(
        rb_i        :   IN STD_LOGIC;
        cp_i        :   IN STD_LOGIC;
        sec_i       :   IN STD_LOGIC;
        h_0_o    :   OUT std_logic_vector(3 downto 0);
        h_1_o    :   OUT std_logic_vector(3 downto 0);
        m_1_o :   OUT std_logic_vector(3 downto 0);
        m_0_o :   OUT std_logic_vector(3 downto 0);
        s_1_o :   OUT std_logic_vector(3 downto 0);
        s_0_o :   OUT std_logic_vector(3 downto 0)
        );
END timer_e;
