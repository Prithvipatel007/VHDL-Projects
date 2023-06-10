LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY top_level_e IS
    PORT(
        
        -- INPUT

        rb_i        :   IN STD_LOGIC;
        cp_i        :   IN STD_LOGIC;
        sx_i        :   IN STD_LOGIC;
        off_btn_i   :   IN STD_LOGIC;
        m0_i        :   IN STD_LOGIC;
        m1_i        :   IN STD_LOGIC;
        m2_i        :   IN STD_LOGIC;
        m3_i        :   IN STD_LOGIC;

        --OUTPUT
        led1_o      :   OUT STD_LOGIC;
        led2_o      :   OUT STD_LOGIC;
        led3_o      :   OUT STD_LOGIC;
        led4_o      :   OUT STD_LOGIC;
        led5_o      :   OUT STD_LOGIC;
        led6_o      :   OUT STD_LOGIC;
        led7_o      :   OUT STD_LOGIC;
        led8_o      :   OUT STD_LOGIC;
        snd_o       :   OUT STD_LOGIC;
        toa_data_txd_o  :   OUT STD_LOGIC
    );
END top_level_e;