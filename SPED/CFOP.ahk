#SingleInstance Force
GroupAdd, SPED, Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital
GroupAdd, SPED, REGISTRO - C170 - ENTRADA - Itens
#IfWinActive ahk_group SPED

;000
    ;Lançar 000 1102
    1 & 0::Send,{Enter 3}000{Enter 2}1102{Enter 2}UNI{Enter 3}0{Enter 4}0{Enter 4}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
    ;Substituir item por 000 1102
    3 & 0::Send,{Enter 8}0{Enter 2}0{Enter 13}0{Enter}+{Tab 16}000{Enter 2}1102{Enter 10}
    ;||||||;
    ;Lançar 000 2102
    5 & 0::Send,{Enter 3}000{Enter 2}2102{Enter 2}UNI{Enter 3}0{Enter 4}0{Enter 4}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
    ;Substituir item por 000 2102
    7 & 0::Send,{Enter 8}0{Enter 2}0{Enter 13}0{Enter}+{Tab 16}000{Enter 2}2102{Enter 10}

;020
    ;Lançar 020 1102
    1 & 2::Send,{Enter 3}020{Enter 2}1102{Enter 2}UNI{Enter 3}0{Enter 4}0{Enter 4}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
    ; Substituir item por 020 1102
    3 & 2::Send,{Enter 8}0{Enter 2}0{Enter 13}0{Enter}+{Tab 16}020{Enter 2}1102{Enter 10}
    ;||||||;
    ;Lançar 020 2102
    5 & 2::Send,{Enter 3}020{Enter 2}2102{Enter 2}UNI{Enter 3}0{Enter 4}0{Enter 4}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
    ; Substituir item por 020 2102
    7 & 2::Send,{Enter 8}0{Enter 2}0{Enter 13}0{Enter}+{Tab 16}020{Enter 2}2102{Enter 7}

;040
    ;lançar 040 1102
    1 & 4::Send,{Enter 3}040{Enter 2}1102{Enter 2}UNI{Enter 3}0{Enter 4}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
    ;Substituir item por 040 1102
    3 & 4::Send,{Enter 8}0{Enter 2}0{Enter 10}0{Enter}0{Enter}0{Enter}0{Enter}+{Tab 16}040{Enter 2}1102{Enter 7}!s{Sleep 20}{Tab}{Enter}{Sleep 20}{Down}
    ;||||||;
    ;lançar 040 2102
    5 & 4::Send,{Enter 3}040{Enter 2}2102{Enter 2}UNI{Enter 3}0{Enter 4}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
    ;Substituir item por 040 2102
    7 & 4::Send,{Enter 8}0{Enter 2}0{Enter 10}0{Enter}0{Enter}0{Enter}0{Enter}+{Tab 16}040{Enter 2}2102{Enter 7}

;060
    ;lançar 060 1403
    1 & 6::Send,{Enter 3}060{Enter 2}1403{Enter 2}UNI{Enter 3}0{Enter 4}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
    ;Subistituir item por 060 1403
    3 & 6::Send,{Enter 8}0{Enter 2}0{Enter 10}0{Enter}0{Enter}0{Enter}0{Enter}+{Tab 16}060{Enter 2}1403{Enter 7}!s{Sleep 20}{Tab}{Enter}{Sleep 20}{Down}
    ;||||||;
    ;lançar 060 2403
    5 & 6::Send,{Enter 3}060{Enter 2}1403{Enter 2}UNI{Enter 3}0{Enter 4}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
    ;Subistituir item por 060 2403
    7 & 6::Send,{Enter 8}0{Enter 2}0{Enter 10}0{Enter}0{Enter}0{Enter}0{Enter}+{Tab 16}060{Enter 2}2403{Enter 7}

/*
Codigo de comando 1102/1403/2102/2403
000 Digito 0
    Prefixo Entrada -> 1 para lançar. 3 para substituir. 
    Prefixo Saida -> 5 para lançar. 7 para subistituir.
020 Digito 2
    Prefixo Entrada -> 1 para lançar. 3 para substituir. 
    Prefixo Saida -> 5 para lançar. 7 para subistituir.
040 Digito 4
    Prefixo Entrada -> 1 para lançar. 3 para substituir. 
    Prefixo Saida -> 5 para lançar. 7 para subistituir.
060 Digito 6
    Prefixo Entrada -> 1 para lançar. 3 para substituir. 
    Prefixo Saida -> 5 para lançar. 7 para subistituir.
*/