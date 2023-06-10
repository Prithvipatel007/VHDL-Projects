LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


architecture baud_a of baud_e is
	  
	signal count: integer:=1;
	signal tmp : std_logic := '0';
  
begin
  
	process(clk_i,rst_i, TMP)
	begin
		if(rst_i='0') then
			count<=1;
			tmp<='0';
		elsif(clk_i'event and clk_i='1') then
			tmp <= '0';
			count <=count+1;
			if (count = 1250) then		-- sys_clock / baud_rate = 1250
				tmp <= '1';
				count <= 1;
			end if;
		end if;
		bdr_o <= tmp ;
	end process;
  
end baud_a;




