LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------------------
ENTITY ascii_conv_e IS
    PORT(
        toc_h_0_i    :   IN std_logic_vector(3 downto 0);
        toc_h_1_i    :   IN std_logic_vector(3 downto 0);
        toc_m_1_i :   IN std_logic_vector(3 downto 0);
        toc_m_0_i :   IN std_logic_vector(3 downto 0);
        toc_s_1_i :   IN std_logic_vector(3 downto 0);
        toc_s_0_i :   IN std_logic_vector(3 downto 0);

        toc_h_0_o    :   OUT std_logic_vector(7 downto 0);
        toc_h_1_o    :   OUT std_logic_vector(7 downto 0);
        toc_m_1_o :   OUT std_logic_vector(7 downto 0);
        toc_m_0_o :   OUT std_logic_vector(7 downto 0);
        toc_s_1_o :   OUT std_logic_vector(7 downto 0);
        toc_s_0_o :   OUT std_logic_vector(7 downto 0);
        cr_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        lf_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ascii_conv_e;
------------------------------------------------------------------------------------
