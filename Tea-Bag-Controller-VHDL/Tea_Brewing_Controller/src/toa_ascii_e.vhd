LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------------------
ENTITY toa_ascii_e IS
    PORT(
        toc_hour_0_i    :   IN std_logic_vector(3 downto 0);
        toc_hour_1_i    :   IN std_logic_vector(3 downto 0);
        toc_minutes_1_i :   IN std_logic_vector(3 downto 0);
        toc_minutes_0_i :   IN std_logic_vector(3 downto 0);
        toc_seconds_1_i :   IN std_logic_vector(3 downto 0);
        toc_seconds_0_i :   IN std_logic_vector(3 downto 0);

        toc_hour_0_o    :   OUT std_logic_vector(7 downto 0);
        toc_hour_1_o    :   OUT std_logic_vector(7 downto 0);
        toc_minutes_1_o :   OUT std_logic_vector(7 downto 0);
        toc_minutes_0_o :   OUT std_logic_vector(7 downto 0);
        toc_seconds_1_o :   OUT std_logic_vector(7 downto 0);
        toc_seconds_0_o :   OUT std_logic_vector(7 downto 0);
        cr_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        lf_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END toa_ascii_e;
------------------------------------------------------------------------------------
