library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture morse_ascii_a of morse_ascii_e is

    type state_t is (	idle_st, wait_next_st,  wait_dot_st, check_dot_h_st, check_dot_st, res_dot_st,
                        wait_dash_st, res_dash_st, data_valid_st
    );
    signal current_state_s : state_t := idle_st;
    signal set_ascii_s : std_logic_vector(7 downto 0);
    signal count_s : integer;

begin

    morse_ascii_p : process (clk_i, rst_i)
    begin
        if(rst_i = '0') then 
            current_state_s <= idle_st;
			count_s <= 8;
			set_ascii_s <= (others => '0');
        elsif(rising_edge(clk_i)) then
            case current_state_s is
                when idle_st => if (morse_i = '1') then   -- morse signal received
                                    current_state_s <= wait_dot_st; 
                                else 
                                    current_state_s <= idle_st; 
                                end if;
								count_s <= 8;
								set_ascii_s <= (others => '0');

                when wait_next_st => if(count_s = 0) then
                                        current_state_s <= data_valid_st;
                                    elsif (morse_i = '1') then   -- morse signal received
                                        current_state_s <= wait_dot_st; 
                                    else 
                                        current_state_s <= wait_next_st; 
                                    end if;

                when data_valid_st => current_state_s <= idle_st;

                when wait_dot_st =>     if(dots_i = '1') then -- wait for the next dot tick
                                            current_state_s <= check_dot_h_st;
                                        else
                                            current_state_s <= wait_dot_st;
                                        end if;

                when check_dot_h_st => current_state_s <= check_dot_st;

                when check_dot_st =>    if(morse_i = '0') then     -- dot
                                            current_state_s <= res_dot_st;
                                        elsif(morse_i = '1') then  -- dash
                                            current_state_s <= wait_dash_st;
                                        end if;

                when res_dot_st =>      current_state_s <= wait_next_st;
										count_s <= count_s - 1;
										set_ascii_s(count_s-1) <= '1';

                when wait_dash_st =>    if(dashs_i = '1' and morse_i = '1') then
                                            current_state_s <= res_dash_st;
                                        else
                                            current_state_s <= wait_dash_st;
                                        end if;

                when res_dash_st => current_state_s <= wait_next_st;
									count_s <= count_s - 1;
									set_ascii_s(count_s-1) <= '0';

                when others => current_state_s <= idle_st;
            end case;
        end if;

    end process morse_ascii_p;

    morse_ascii_transition_p : process (current_state_s, set_ascii_s, count_s)
    begin
        case current_state_s is
            when idle_st => ascii_o <= (others => '0'); dv_o <= '0'; 
            when wait_next_st => ascii_o <= (others => '0'); dv_o <= '0';
            when wait_dot_st => ascii_o <= (others => '0'); dv_o <= '0'; 
            when check_dot_h_st =>ascii_o <= (others => '0'); dv_o <= '0';
            when check_dot_st => ascii_o <= (others => '0'); dv_o <= '0'; 
            when res_dot_st => ascii_o <= (others => '0'); dv_o <= '0'; 
            when wait_dash_st => ascii_o <= (others => '0'); dv_o <= '0';
            when res_dash_st => ascii_o <= (others => '0'); dv_o <= '0'; 
            when data_valid_st => ascii_o <= set_ascii_s; dv_o <= '1'; 
			when others => ascii_o <= (others => '0'); dv_o <= '0';
        end case;
    end process morse_ascii_transition_p;

end morse_ascii_a;