LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

ARCHITECTURE gen_snd_a OF gen_snd_e IS

TYPE state_name IS (idle_st, dv_st, comb00, comb01, comb10, comb11, result_st);
SIGNAL cstate_s : state_name := idle_st;

signal count : integer range 0 to 350;

begin
    clocked:PROCESS (cp_i,rb_i)
    BEGIN
        IF (rb_i= '0') THEN cstate_s <= idle_st;
        ELSIF (cp_i'EVENT AND cp_i='1' AND cp_i'LAST_VALUE='0') THEN
            CASE cstate_s IS
                WHEN idle_st => IF(dv_i = '1') THEN 
                                    cstate_s <= dv_st;
                                END IF;  -- check if the data is valid and add time depending on the mode state
                WHEN dv_st	=>  IF(s0_i = '0' AND s1_i = '0') THEN 
                                    cstate_s <= comb00;
                                ELSIF(s0_i = '0' AND s1_i = '1') THEN 
                                    cstate_s <= comb01;
                                ELSIF(s0_i = '1' AND s1_i = '0') THEN 
                                    cstate_s <= comb10;
                                ELSIF(s0_i = '1' AND s1_i = '1') THEN 
                                    cstate_s <= comb11;
                                ELSE
                                    cstate_s <= dv_st; 
                                END IF;
                
                WHEN comb00   =>    IF(count = 120) then
                                        count <= count;
                                        cstate_s <= result_st;
                                    elsif (ci1_i = '1') then
                                        count <= count + 1;
                                        cstate_s <= comb00;
                                    else
                                        count <= count;
                                        cstate_s <= comb00;
                                    end if;
                
                WHEN comb01   =>  IF(count = 180) then
                                        count <= count;
                                        cstate_s <= result_st;
                                    elsif (ci1_i = '1') then
                                        count <= count + 1;
                                        cstate_s <= comb00;
                                    else
                                        count <= count;
                                        cstate_s <= comb00;
                                    end if;

                WHEN comb10   =>    IF(count = 240) then
                                        count <= count;
                                        cstate_s <= result_st;
                                    elsif (ci1_i = '1') then
                                        count <= count + 1;
                                        cstate_s <= comb00;
                                    else
                                        count <= count;
                                        cstate_s <= comb00;
                                    end if;

                WHEN comb11   =>    IF(count = 300) then
                                        count <= count;
                                        cstate_s <= result_st;
                                    elsif (ci1_i = '1') then
                                        count <= count + 1;
                                        cstate_s <= comb00;
                                    else
                                        count <= count;
                                        cstate_s <= comb00;
                                    end if;

                WHEN result_st      =>  IF(off_btn_i = '1') THEN cstate_s <= idle_st; ELSE cstate_s <= result_st; END IF;
                WHEN OTHERS         =>  cstate_s <= idle_st;
            END CASE;
        END IF;
    END PROCESS clocked;

    task : PROCESS(cstate_s)
    BEGIN 
        CASE cstate_s IS

            WHEN idle_st    =>  snd_o <= '0';
            
            WHEN dv_st      =>  snd_o <= '0';

            WHEN comb00      => snd_o <= '0';
            
            WHEN comb01      => snd_o <= '0';

            WHEN comb10      => snd_o <= '0';

            WHEN comb11      => snd_o <= '0';

            WHEN result_st   => snd_o <= sig_1k_i;

        END CASE;
    END PROCESS task;

end gen_snd_a;
