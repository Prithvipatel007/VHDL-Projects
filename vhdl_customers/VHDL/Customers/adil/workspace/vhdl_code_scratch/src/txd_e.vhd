library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY txd_e IS 
    PORT(
        rb_i        :   IN STD_LOGIC;
        cp_i        :   IN STD_LOGIC;
        h_0_i    : IN std_logic_vector(7 downto 0);
        h_1_i    : IN std_logic_vector(7 downto 0);
        m_1_i : IN std_logic_vector(7 downto 0);
        m_0_i : IN std_logic_vector(7 downto 0);
        s_1_i : IN std_logic_vector(7 downto 0);
        s_0_i : IN std_logic_vector(7 downto 0);
        cr_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);			
        lf_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        brd_i       :   IN STD_LOGIC;
        dv_i        :   IN STD_LOGIC;
        txd_o       :   OUT STD_LOGIC);
END txd_e;

