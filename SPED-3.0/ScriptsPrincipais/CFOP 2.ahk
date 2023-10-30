#SingleInstance Force
GroupAdd, SPED, REGISTRO - C170 - ENTRADA - Itens

#IfWinActive ahk_group SPED

;1949
    ;Lançar 090 1949
    F7 & 4::Send,{PgUp}{Click 551 207}ENTRADA ESTADUAL{Sleep 20}{Tab 2}090{Enter 2}1949{Enter 2}UNI{Enter 3}0{Enter 4}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
    ;Substituir item por 090 1949
    F8 & 4::Send,{PgUp}{Click 333 231}{Sleep 20}0{Enter 2}0{Enter 10}0{Enter}0{Enter}0{Enter}0{Enter}+{Tab 16}090{Enter 2}1949{Enter 7}!s{Sleep 20}{Tab}{Enter}{Sleep 20}{Down}

;1556
    ;Lançar 090 1556
    F7 & 5::Send,{PgUp}{Click 551 207}ENTRADA ESTADUAL{Sleep 20}{Tab 2}090{Enter 2}1556{Enter 2}UNI{Enter 3}0{Enter 4}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
    ;Substituir item por 090 1556
    F8 & 5::Send,{PgUp}{Click 333 231}{Sleep 20}0{Enter 2}0{Enter 10}0{Enter}0{Enter}0{Enter}0{Enter}+{Tab 16}090{Enter 2}1556{Enter 7}!s{Sleep 20}{Tab}{Enter}{Sleep 20}{Down}

;1653
    ;Lançar 090 1653
    F7 & 3::Send,{PgUp}{Click 305 210}{Sleep 20}{Enter 3}090{Enter 2}1653{Enter 2}LTS{Enter 3}0{Enter 4}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}

;1910
    ;Lançar 090 1910
    F7 & 9::Send,{PgUp}{Click 551 207}BONIFICACAO ESTADUAL{Sleep 20}{Tab 2}090{Enter 2}1910{Enter 2}UNI{Enter 3}0{Enter 4}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
    ;Substituir item por 090 1910
    F8 & 9::Send,{PgUp}{Click 333 231}{Sleep 20}0{Enter 2}0{Enter 10}0{Enter}0{Enter}0{Enter}0{Enter}+{Tab 16}090{Enter 2}1910{Enter 7}!s{Sleep 20}{Tab}{Enter}{Sleep 20}{Down}

    ;Lançar 000 1910
    F7 & 0::Send,{PgUp}{Click 551 207}BONIFICACAO ESTADUAL{Sleep 20}{Tab 2}000{Enter 2}1910{Enter 2}UNI{Enter 3}0{Enter 4}0{Enter 4}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
    ;Substituir item por 000 1910
    F8 & 0::Send,{PgUp}{Click 333 231}{Sleep 20}0{Enter 2}0{Enter 13}0{Enter}+{Tab 16}000{Enter 2}1910{Enter 10}
    
    ;Lançar 020 1910
    F7 & 2::Send,{PgUp}{Click 551 207}BONIFICACAO ESTADUAL{Sleep 20}{Tab 2}020{Enter 2}1910{Enter 2}UNI{Enter 3}0{Enter 4}0{Enter 4}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
    ; Substituir item por 020 1910
    F8 & 2::Send,{PgUp}{Click 333 231}{Sleep 20}0{Enter 2}0{Enter 13}0{Enter}+{Tab 16}020{Enter 2}1910{Enter 10}
/*
Codigo de comando 1910/1949/1556/1653
 F7 Para lançar o codigo
 F8 para substituir pelo codigo
1949 digito 4
1556 digito 5
1653 digito 3
1910 digito 1, 0, 2
*/