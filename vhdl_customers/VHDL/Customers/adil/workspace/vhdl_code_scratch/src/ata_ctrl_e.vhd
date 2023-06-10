LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ata_ctrl_e IS
    PORT(
        rb_i    : IN STD_LOGIC;
        cp_i    : IN STD_LOGIC;
        clk_1k_i: IN STD_LOGIC;
        -- current time
        c_h_0_i    :   IN std_logic_vector(3 downto 0);
        c_h_1_i    :   IN std_logic_vector(3 downto 0);
        c_m_1_i :   IN std_logic_vector(3 downto 0);
        c_m_0_i :   IN std_logic_vector(3 downto 0);
        c_s_1_i :   IN std_logic_vector(3 downto 0);
        c_s_0_i :   IN std_logic_vector(3 downto 0);
        -- toa input time
        h_0_i    :   IN std_logic_vector(3 downto 0);
        h_1_i    :   IN std_logic_vector(3 downto 0);
        m_1_i :   IN std_logic_vector(3 downto 0);
        m_0_i :   IN std_logic_vector(3 downto 0);
        s_1_i :   IN std_logic_vector(3 downto 0);
        s_0_i :   IN std_logic_vector(3 downto 0);
        dv_i        : IN STD_LOGIC;
        m0_state_i    : IN STD_LOGIC;
        m1_state_i    : IN STD_LOGIC;
        t0_state_i    : IN STD_LOGIC;
        t1_state_i    : IN STD_LOGIC;
        sec_q_i         : IN STD_LOGIC;
        off_btn_i       : IN STD_LOGIC;

        toc_h_0_o    :   OUT std_logic_vector(3 downto 0);
        toc_h_1_o    :   OUT std_logic_vector(3 downto 0);
        toc_m_1_o :   OUT std_logic_vector(3 downto 0);
        toc_m_0_o :   OUT std_logic_vector(3 downto 0);
        toc_s_1_o :   OUT std_logic_vector(3 downto 0);
        toc_s_0_o :   OUT std_logic_vector(3 downto 0);
        toa_valid_o   : OUT STD_LOGIC;
        dr_o          : OUT STD_LOGIC;
        snd_o         : OUT STD_LOGIC;
        snd_led_o     : OUT STD_LOGIC        
        );
END ata_ctrl_e;
