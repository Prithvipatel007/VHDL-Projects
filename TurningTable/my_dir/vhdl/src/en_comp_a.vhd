ARCHITECTURE arch OF en_comp_e IS
    SIGNAL sel_s : STD_LOGIC;
BEGIN
    clocked : PROCESS(en1_i, co_10m_i)
    BEGIN
    IF(sel_i = '1') THEN 
        en1_o <= en1_i;
    ELSE  en1_o <= co_10m_i; END IF;
    END PROCESS clocked;
END arch;
