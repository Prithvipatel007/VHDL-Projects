architecture c02ec_a of c02ec_e is
    constant s0_c : std_logic := '0';
    constant s1_c : std_logic := '1';

    signal current_state_s : std_logic := s0_c;
begin
    sm_counter : process(rst_i,clk_i)
    begin
        if(rst_i='0') then current_state_s <= s0_c;
        elsif(rising_edge(clk_i)) then
            if(cl_i = '1') then current_state_s <= s0_c;
            else
                case current_state_s is
                    when s0_c => if(en_i='1') then current_state_s <= s1_c;end if;
                    when s1_c => if(en_i='1') then current_state_s <= s0_c;end if;
                    when others => current_state_s <= s0_c;
                end case;
            end if;
        end if;
    end process sm_counter;

q3_o <= current_state_s;
co_o <= current_state_s and en_i;

end c02ec_a;