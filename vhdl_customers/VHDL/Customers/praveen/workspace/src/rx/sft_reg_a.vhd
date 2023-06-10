----------------------------------------------------
-- Shift Register Architecture
----------------------------------------------------
ARCHITECTURE sft_reg_a OF sft_reg_e IS
SIGNAL pass_s : std_logic_vector (7 DOWNTO 0);
SIGNAL count_s : integer;
BEGIN
	PROCESS (rst_i,clk_i)
	BEGIN
---------------------------------------------------- Reset
		IF (rst_i = '0') THEN
			pass_s <= (OTHERS => '0');
			count_s <= 7;
---------------------------------------------------- Clock
		ELSIF (clk_i'EVENT AND clk_i = '1') THEN
---------------------------------------------------- Shift Register
			IF (bit_ena_i = '1') THEN
				pass_s(6 DOWNTO 0) <= pass_s(7 DOWNTO 1);
				pass_s(7) <= bit_i;
				if(count_s = 0) then
					count_s <= 7;
				else
					count_s <= count_s - 1;
				end if;
			END IF;
        END IF;
	END PROCESS;
	
	pass_o <= pass_s;	
	
	PROCESS (rst_i,clk_i)
	BEGIN
		IF (rst_i = '0') THEN
			dv_o <= '0';
		ELSIF (clk_i'EVENT AND clk_i = '1') THEN
			IF (count_s = 0) THEN
				dv_o <= '1' and bit_ena_i;
			ELSE
				dv_o <= '0';
			END IF;
        END IF;
	END PROCESS;
	
 END sft_reg_a;
 ----------------------------------------------------
