-- shift_register_visualTest.vhd

-- created by   :   Meher Krishna Patel
-- date                 :   22-Dec-16

-- Modified by M.Pfeil 25.10.19

library ieee;
use ieee.std_logic_1164.all;

entity shift_register_clk_tb is
    
end shift_register_clk_tb;

architecture arch of shift_register_clk_tb is
   
   COMPONENT shift_register_clk is
		-- GENERIC (data: STD_LOGIC_VECTOR(7 DOWNTO 0) := ('1', '1', '0', '0', '0', '1', '1', '1'));
		
		PORT(
			button1, button2 : IN STD_LOGIC;
			clk		:	IN STD_LOGIC;
			q_reg	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT shift_register_clk;
	
	SIGNAL clk_s, button1_s, button2_s : STD_LOGIC;
	SIGNAL q_reg_s : STD_LOGIC_VECTOR (7 DOWNTO 0);
begin
    
    -- shift_register testing with clock pulse
    dut: shift_register_clk    
		port map (	clk => clk_s,
					button1 => button1_s,
					button2 => button2_s,
					q_reg => q_reg_s);
					
	stimuli: process begin
		-- reset at beginning
		button1_s <= '0';
		button2_s <= '0';
		wait until rising_edge(clk_s);
		for i in 1 to 5 loop
			wait until rising_edge(clk_s);
		end loop;
		
		-- right shift for 5 times
		
		for i in 1 to 7 loop
			button1_s <= '1';
			button2_s <= '0';
			wait until rising_edge(clk_s);
			button1_s <= '0';
			button2_s <= '0';
			wait until rising_edge(clk_s);
		end loop;
		
		-- reset 
		
		button1_s <= '0';
		button2_s <= '1';
		wait until rising_edge(clk_s);
		button1_s <= '0';
		button2_s <= '0';
		wait until rising_edge(clk_s);
		
		-- more run time
		for i in 1 to 5 loop
			wait until rising_edge(clk_s);
		end loop;
		wait;
	end process stimuli;
	
	clocking : process begin
		clk_s <= '1';
		Wait for 10 ns;
		clk_s <= '0';
		Wait for 10 ns;
	end process clocking;
end arch;

configuration cfg_shift_register_clk_tb of shift_register_clk_tb is
for arch
	for dut: shift_register_clk
		use entity work.shift_register_clk(arch);
	end for;
end for;
end cfg_shift_register_clk_tb;
