LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ARCHITECTURE mem_a OF mem_e  IS
	CONSTANT a0_c :STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
SIGNAL reg1_s, reg2_s, reg3_s, reg4_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
	------------------------------------------------------
	PROCESS(rst_n_i, clk_i, reg1_i, reg2_i, reg3_i, reg4_i)
		BEGIN
		IF (rst_n_i = '0') THEN
			reg1_s <= a0_c;
			reg2_s <= a0_c;
			reg3_s <= a0_c;
		reg4_s <= a0_c;
		ELSIF (clk_i = '1' AND clk_i'EVENT) THEN
            reg1_s <= reg1_i;
            reg2_s <= reg2_i;
            reg3_s <= reg3_i;
            reg4_s <= reg4_i;
		END IF;
	END PROCESS;
	-------------------------------------------------------
	reg1_o <= reg1_s;
	reg2_o <= reg2_s;
	reg3_o <= reg3_s;
	reg4_o <= reg4_s;
	-------------------------------------------------------
END mem_a;
-------------------------------------------------------