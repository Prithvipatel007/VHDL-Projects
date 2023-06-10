-- shift_register.vhd

-- created by   :   Meher Krishna Patel
-- date                 :   22-Dec-16
--modified by 	: Markus Pfeil
-- date 16.10.19
-- Functionality:
  -- shift data  right

-- inputs:
    -- two buttons
    -- LEDs to output
	-- Clock
	
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY shift_register_clk is
	-- GENERIC (data: STD_LOGIC_VECTOR(7 DOWNTO 0) := ('1', '1', '0', '0', '0', '1', '1', '1'));
	
	PORT(
		button1, button2 : IN STD_LOGIC;
		clk		:	IN STD_LOGIC;
		q_reg	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END shift_register_clk;

ARCHITECTURE arch OF shift_register_clk IS
	
	SIGNAL s_reg : STD_LOGIC_VECTOR(7 DOWNTO 0) := ('1', '1', '0', '0', '0', '1', '1', '1'); --data;
	SIGNAL s_next : STD_LOGIC_VECTOR(7 DOWNTO 0) := ('1', '1', '0', '0', '0', '1', '1', '1'); --data;
	SIGNAL last_button1	:	STD_LOGIC := '0';
	SIGNAL last_button2	:	STD_LOGIC := '0';
	
BEGIN
	
	PROCESS(clk)
	BEGIN
		
		IF(button2 = '1' AND last_button2 = '0') THEN		-- on pressing button2
			s_reg <= ('1', '1', '0', '0', '0', '1', '1', '1');		-- reset the content
			last_button2 <= '1';
			
		ELSIF (button2 = '0' and last_button2 = '1') THEN -- on releasing button2
			last_button2 <= '0';			--reset last button2
			
		ELSIF (button1 = '1' AND last_button1='0') THEN	-- on pressing button 1
			s_next <=s_reg(0) & s_reg(7 downto 1); 		-- right shift
			last_button1 <= '1';
			
		ELSIF (button1 = '0' AND last_button1='1') THEN 	-- on releasing button 1
			s_reg <= s_next;					-- update output
			last_button1 <= '0';
			
		ELSE
			s_reg <= s_reg;
		END IF;
	END PROCESS;
	
	q_reg <= s_reg;
END arch;