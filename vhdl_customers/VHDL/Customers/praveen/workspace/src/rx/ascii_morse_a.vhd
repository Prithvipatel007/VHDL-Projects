library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture ascii_morse_a of ascii_morse_e is

    type state_t is (idle_st, check_data_st, set_dot_st, set_dash_st, hold_st);
    signal current_state_s : state_t := idle_st;
    signal cnt_s : integer;

begin

    encode_p : process (clk_i, rst_i)      
    begin
        if(rst_i='0') then 
            current_state_s <= idle_st;
            cnt_s <= 8;
        elsif(rising_Edge(clk_i)) then

            case current_state_s is
                when idle_st => if(dv_i = '1') then current_state_s <= check_data_st; else current_state_s <= idle_st; end if; cnt_s <= cnt_s;
                when check_data_st => 	if (cnt_s = 0) then
											current_state_s <= idle_st;
										elsif(data_i(cnt_s-1) = '1' and dots_i = '1') then 
											current_state_s <= set_dot_st; 
										elsif(data_i(cnt_s-1) = '0' and dashs_i = '1') then
											current_state_s <= set_dash_st;
										else 
											current_state_s <= check_data_st; 
										end if;
										cnt_s <= cnt_s;
                when set_dot_st =>  if(dots_i = '1') then
										cnt_s <= cnt_s; 
										current_state_s <= hold_st; 
									else
										current_state_s <= set_dot_st;
									end if;

                when set_dash_st => if(dashs_i = '1') then
										cnt_s <= cnt_s;
										current_state_s <= hold_st;
									else
										current_state_s <= set_dash_st;
									end if;

                when hold_st => if(dots_i = '1') then cnt_s <= cnt_s - 1; current_state_s <= check_data_st;end if;

                when others => current_state_s <= idle_st;
            end case;
        end if;

    end process encode_p;

    encode_transition_p : process (current_state_s)
    begin
        case current_state_s is
            when idle_st => morse_o <= '0'; 
            when check_data_st => morse_o <= '0'; 
            when set_dot_st => morse_o <= '1';
            when set_dash_st => morse_o <= '1'; 
            when hold_st => morse_o <= '0'; 
        end case;
    end process encode_transition_p;

end ascii_morse_a;