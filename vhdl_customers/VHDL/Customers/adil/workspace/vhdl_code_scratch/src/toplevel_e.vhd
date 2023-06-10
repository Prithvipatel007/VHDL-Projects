LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY toplevel_e IS
    PORT(
        rb_i        :   IN STD_LOGIC;
        cp_i        :   IN STD_LOGIC;
        sx_i        :   IN STD_LOGIC;
        off_btn_i   :   IN STD_LOGIC;
        m0_i        :   IN STD_LOGIC;
        m1_i        :   IN STD_LOGIC;
        t0_i        :   IN STD_LOGIC;
        t1_i        :   IN STD_LOGIC;
        led1_o      :   OUT STD_LOGIC;
        led2_o      :   OUT STD_LOGIC;
        led3_o      :   OUT STD_LOGIC;
        led4_o      :   OUT STD_LOGIC;
        led5_o      :   OUT STD_LOGIC;
        led6_o      :   OUT STD_LOGIC;
        led7_o      :   OUT STD_LOGIC;
        led8_o      :   OUT STD_LOGIC;
        snd_o       :   OUT STD_LOGIC;
        txd_o  :   OUT STD_LOGIC
    );
END toplevel_e;