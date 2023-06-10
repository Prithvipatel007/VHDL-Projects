LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tsc_ctrl_e IS
    PORT(
        rb_i    : IN STD_LOGIC;
        cp_i    : IN STD_LOGIC;
        dr_i    : IN STD_LOGIC;
        sx_i    : IN STD_LOGIC;     -- sensor input
        
        h_0_i    :   IN std_logic_vector(3 downto 0);
        h_1_i    :   IN std_logic_vector(3 downto 0);
        m_1_i :   IN std_logic_vector(3 downto 0);
        m_0_i :   IN std_logic_vector(3 downto 0);
        s_1_i :   IN std_logic_vector(3 downto 0);
        s_0_i :   IN std_logic_vector(3 downto 0);

        m0_i    : IN STD_LOGIC;     -- mode 0
        m1_i    : IN STD_LOGIC;     -- mode 1
        t0_i    : IN STD_LOGIC;     -- test mode 0
        t1_i    : IN STD_LOGIC;     -- test mode 1
        h_0_o    :   OUT std_logic_vector(3 downto 0);
        h_1_o    :   OUT std_logic_vector(3 downto 0);
        m_1_o :   OUT std_logic_vector(3 downto 0);
        m_0_o :   OUT std_logic_vector(3 downto 0);
        s_1_o :   OUT std_logic_vector(3 downto 0);
        s_0_o :   OUT std_logic_vector(3 downto 0);

        dv_o          : OUT STD_LOGIC;
        m0_state_o    : OUT STD_LOGIC;
        m1_state_o    : OUT STD_LOGIC;
        t0_state_o    : OUT STD_LOGIC;
        t1_state_o    : OUT STD_LOGIC
        );
END tsc_ctrl_e;

