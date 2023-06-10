LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------
ENTITY tsc_e IS
    PORT(
        --
        --  Inputs
        --
        rb_i    : IN STD_LOGIC;
        cp_i    : IN STD_LOGIC;
        dr_i    : IN STD_LOGIC;
        sx_i    : IN STD_LOGIC;     -- sensor input
        
        hour_0_i    :   IN std_logic_vector(3 downto 0);
        hour_1_i    :   IN std_logic_vector(3 downto 0);
        minutes_1_i :   IN std_logic_vector(3 downto 0);
        minutes_0_i :   IN std_logic_vector(3 downto 0);
        seconds_1_i :   IN std_logic_vector(3 downto 0);
        seconds_0_i :   IN std_logic_vector(3 downto 0);

        m0_i    : IN STD_LOGIC;     -- mode 0
        m1_i    : IN STD_LOGIC;     -- mode 1
        m2_i    : IN STD_LOGIC;     -- mode 2
        m3_i    : IN STD_LOGIC;     -- mode 3
        --
        -- Outputs
        --
        hour_0_o    :   OUT std_logic_vector(3 downto 0);
        hour_1_o    :   OUT std_logic_vector(3 downto 0);
        minutes_1_o :   OUT std_logic_vector(3 downto 0);
        minutes_0_o :   OUT std_logic_vector(3 downto 0);
        seconds_1_o :   OUT std_logic_vector(3 downto 0);
        seconds_0_o :   OUT std_logic_vector(3 downto 0);

        dv_o          : OUT STD_LOGIC;
        m0_state_o    : OUT STD_LOGIC;
        m1_state_o    : OUT STD_LOGIC;
        m2_state_o    : OUT STD_LOGIC;
        m3_state_o    : OUT STD_LOGIC
        );
END tsc_e;
-----------------------------------------
