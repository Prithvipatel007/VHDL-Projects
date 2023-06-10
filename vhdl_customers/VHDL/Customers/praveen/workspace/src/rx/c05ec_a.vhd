architecture c05ec_a of c05ec_e is
    constant s0_c : std_logic_vector(2 downto 0) := "000";
    constant s1_c : std_logic_vector(2 downto 0) := "001";
    constant s2_c : std_logic_vector(2 downto 0) := "010";
    constant s3_c : std_logic_vector(2 downto 0) := "011";
    constant s4_c : std_logic_vector(2 downto 0) := "100";

    signal current_state_s : std_logic_vector(2 downto 0) := s0_c;
begin
    sm_counter : process(rst_i,clk_i)
    begin
        if(rst_i='0') then current_state_s <= s0_c;
        elsif(rising_edge(clk_i)) then
            if(cl_i = '1') then current_state_s <= s0_c;
            else
                case current_state_s is
                    when s0_c => if(en_i='1') then current_state_s <= s1_c;end if;
                    when s1_c => if(en_i='1') then current_state_s <= s2_c;end if;
                    when s2_c => if(en_i='1') then current_state_s <= s3_c;end if;
                    when s3_c => if(en_i='1') then current_state_s <= s4_c;end if;
                    when s4_c => if(en_i='1') then current_state_s <= s0_c;end if;
                    when others => current_state_s <= s0_c;
                end case;
            end if;
        end if;
    end process sm_counter;

q3_o <= current_state_s(2);
co_o <= current_state_s(2) and not current_state_s(1) and not current_state_s(0) and en_i;

end c05ec_a;