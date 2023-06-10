LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------
ENTITY ata_e IS
    PORT(
        --
        --  Inputs
        --
        rb_i    : IN STD_LOGIC;
        cp_i    : IN STD_LOGIC;
        clk_1k_i: IN STD_LOGIC;
        -- current time
        c_hour_0_i    :   IN std_logic_vector(3 downto 0);
        c_hour_1_i    :   IN std_logic_vector(3 downto 0);
        c_minutes_1_i :   IN std_logic_vector(3 downto 0);
        c_minutes_0_i :   IN std_logic_vector(3 downto 0);
        c_seconds_1_i :   IN std_logic_vector(3 downto 0);
        c_seconds_0_i :   IN std_logic_vector(3 downto 0);
        -- toa input time
        hour_0_i    :   IN std_logic_vector(3 downto 0);
        hour_1_i    :   IN std_logic_vector(3 downto 0);
        minutes_1_i :   IN std_logic_vector(3 downto 0);
        minutes_0_i :   IN std_logic_vector(3 downto 0);
        seconds_1_i :   IN std_logic_vector(3 downto 0);
        seconds_0_i :   IN std_logic_vector(3 downto 0);
        dv_i        : IN STD_LOGIC;
        m0_state_i    : IN STD_LOGIC;
        m1_state_i    : IN STD_LOGIC;
        m2_state_i    : IN STD_LOGIC;
        m3_state_i    : IN STD_LOGIC;
        sec_q_i         : IN STD_LOGIC;
        off_btn_i       : IN STD_LOGIC;
        --
        -- Outputs
        --
        toc_hour_0_o    :   OUT std_logic_vector(3 downto 0);
        toc_hour_1_o    :   OUT std_logic_vector(3 downto 0);
        toc_minutes_1_o :   OUT std_logic_vector(3 downto 0);
        toc_minutes_0_o :   OUT std_logic_vector(3 downto 0);
        toc_seconds_1_o :   OUT std_logic_vector(3 downto 0);
        toc_seconds_0_o :   OUT std_logic_vector(3 downto 0);
        toa_valid_o   : OUT STD_LOGIC;
        dr_o          : OUT STD_LOGIC;
        snd_o         : OUT STD_LOGIC;
        snd_led_o     : OUT STD_LOGIC        
        );
END ata_e;
-----------------------------------------
