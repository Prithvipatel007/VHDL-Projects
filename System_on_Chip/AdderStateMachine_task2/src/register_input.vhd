LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------------------------------------------------------
ENTITY register_input IS 
    PORT(
        rb_i     : IN STD_LOGIC;
        cp_i     : IN STD_LOGIC;
        sp_i     : IN STD_LOGIC;
		lp_i 	: IN STD_LOGIC;
        dv_i   : IN STD_LOGIC;
        in1_o     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        in2_o   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        inv_o     : OUT STD_LOGIC;
		showLed	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END register_input;

ARCHITECTURE arch of register_input IS
	
	SIGNAL reg_s : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
	SIGNAL count : INTEGER range 0 to 17 := 0;
	SIGNAL inv_s : STD_LOGIC;
	
BEGIN
	clocked : PROCESS(rb_i, cp_i, sp_i, lp_i, dv_i)
	BEGIN
		IF(rb_i = '0') THEN 
			reg_s <= (OTHERS => '0');
			count <= 0;
			inv_s <= '0';
			showLed <= (OTHERS => '0');
		ELSE
			IF(rising_edge(cp_i)) THEN
				IF(dv_i = '1' AND sp_i = '1' AND lp_i = '0' AND count <= 15) THEN
					reg_s(count) <= '1';
				ELSIF(dv_i = '1' AND sp_i = '0' AND lp_i = '1') THEN
					reg_s(count) <= '0';
				END IF;
				
				IF (dv_i = '1') THEN
					IF(count = 16) THEN
						count <= 0;
					ELSE
						count <= count + 1;
					END IF;
				END IF;
				
				IF(count = 16 AND dv_i = '1') THEN
					inv_s <= '1';
				ELSE 
					inv_s <= '0';
				END IF;
								
				IF (count < 8) THEN
					showLed <= reg_s(7 DOWNTO 0);
				ELSIF (count >= 8 AND count < 16) THEN
					showLed <= reg_s(15 DOWNTO 8);
				ELSE
					showLed <= "00000000";
				END IF;
								
				IF(inv_s = '1') THEN
					count <= 0;
					reg_s <= (OTHERS => '0');
				END IF;
				
			END IF;
		END IF;
	END PROCESS clocked;
	
	in1_o <= reg_s(7 DOWNTO 0);
	in2_o <= reg_s(15 DOWNTO 8);
	inv_o <= inv_s;
	
END arch;