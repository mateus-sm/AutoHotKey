#SingleInstance Force
GroupAdd, SPED, REGISTRO - C170 - ENTRADA - Itens

/*
Codigo de comando 1102/1403/2102/2403
Apertar SHIFT + 2 para alternar entre dentro e fora do estado
000 Digito 0
    Prefixo Entrada Dentro e fora do estado-> Alt para lançar. Ctrl para substituir. 
020 Digito 2
    Prefixo Entrada Dentro e fora do estado-> Alt para lançar. Ctrl para substituir.
040 Digito 4
    Prefixo Entrada Dentro e fora do estado-> Alt para lançar. Ctrl para substituir.
060 Digito 6
    Prefixo Entrada Dentro e fora do estado-> Alt para lançar. Ctrl para substituir.
*/

;Label para usar timer na notificação das flags
RemoveToolTip:
ToolTip
return

FlagEstado := 0
;Ativa e desativa flag de estado -> FlagEstado
    +2::
        if (FlagEstado == 0) {
            FlagEstado := 1
            ToolTip, CFOP fora do estado, 1115, 972
            SetTimer, RemoveToolTip, -3000 
        } Else {
            FlagEstado := 0
            ToolTip, CFOP dentro do estado, 1115, 972
            SetTimer, RemoveToolTip, -3000
        }
    return

#IfWinActive ahk_group SPED
;000
    
    ;Lançar 000 1102
    Alt & Numpad0::
        if (FlagEstado == 0) {
           Send,{PgUp}{Click 551 207}ENTRADA ESTADUAL{Sleep 20}{Tab 2}000{Enter 2}1102{Enter 2}UN{Enter 3}0{Enter 4}0{Enter 4}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16} 
        } Else {
            ;Lançar 000 2102
            Send,{PgUp}{Click 551 207}ENTRADA INTERESTADUAL{Sleep 20}{Tab 2}000{Enter 2}2102{Enter 2}UN{Enter 3}0{Enter 4}0{Enter 4}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
        }
    Return
    ;||||||;
    ;Substituir item por 000 1102
    Ctrl & Numpad0::
        if (FlagEstado == 0) {
            Send,{PgUp}{Click 333 231}{Sleep 20}0{Enter 2}0{Enter 13}0{Enter}+{Tab 16}000{Enter 2}1102{Enter 10}
        } Else {
            ;Substituir item por 000 2102
            Send,{PgUp}{Click 333 231}{Sleep 20}0{Enter 2}0{Enter 13}0{Enter}+{Tab 16}000{Enter 2}2102{Enter 10}
        }
    Return

;020
    ;Lançar 020 1102
    Alt & Numpad2::
        if (FlagEstado == 0) {
            Send,{PgUp}{Click 551 207}ENTRADA ESTADUAL{Sleep 20}{Tab 2}020{Enter 2}1102{Enter 2}UN{Enter 3}0{Enter 4}0{Enter 4}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
        } Else {
            ;Lançar 020 2102
            Send,{PgUp}{Click 551 207}ENTRADA INTERESTADUAL{Sleep 20}{Tab 2}020{Enter 2}2102{Enter 2}UN{Enter 3}0{Enter 4}0{Enter 4}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
        }
    Return
    ;||||||;
    ; Substituir item por 020 1102
    Ctrl & Numpad2::
        if (FlagEstado == 0) {
            Send,{PgUp}{Click 333 231}{Sleep 20}0{Enter 2}0{Enter 13}0{Enter}+{Tab 16}020{Enter 2}1102{Enter 10}
        } Else {
            ; Substituir item por 020 2102
            Send,{PgUp}{Click 333 231}{Sleep 20}0{Enter 2}0{Enter 13}0{Enter}+{Tab 16}020{Enter 2}2102{Enter 7}
        }
    Return

;040
    ;lançar 040 1102
    Alt & Numpad4::
        if (FlagEstado == 0) {
            Send,{PgUp}{Click 551 207}ENTRADA ESTADUAL{Sleep 20}{Tab 2}040{Enter 2}1102{Enter 2}UN{Enter 3}0{Enter 4}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
        } Else {
            ;lançar 040 2102
            Send,{PgUp}{Click 551 207}ENTRADA INTERESTADUAL{Sleep 20}{Tab 2}040{Enter 2}2102{Enter 2}UN{Enter 3}0{Enter 4}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
        }
    Return
    ;||||||;
    ;Substituir item por 040 1102
    Ctrl & Numpad4::
        if (FlagEstado == 0) {
            Send,{PgUp}{Click 333 231}{Sleep 20}0{Enter 2}0{Enter 10}0{Enter}0{Enter}0{Enter}0{Enter}+{Tab 16}040{Enter 2}1102{Enter 7}!s{Sleep 20}{Tab}{Enter}{Sleep 20}{Down}
        } Else {
            ;Substituir item por 040 2102
            Send,{PgUp}{Click 333 231}{Sleep 20}0{Enter 2}0{Enter 10}0{Enter}0{Enter}0{Enter}0{Enter}+{Tab 16}040{Enter 2}2102{Enter 7}!s{Sleep 20}{Tab}{Enter}{Sleep 20}{Down}
        }
    Return
    
;060
    ;lançar 060 1403
    Alt & Numpad6::
        if (FlagEstado == 0) {
            Send,{PgUp}{Click 551 207}ENTRADA ESTADUAL{Sleep 20}{Tab 2}060{Enter 2}1403{Enter 2}UN{Enter 3}0{Enter 4}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
        } Else {
        ;lançar 060 2403
            Send,{PgUp}{Click 551 207}ENTRADA INTERESTADUAL{Sleep 20}{Tab 2}060{Enter 2}1403{Enter 2}UN{Enter 3}0{Enter 4}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter}0{Enter 7}0{Enter}+{Tab 16}
        }
    Return
    ;||||||;
    ;Subistituir item por 060 1403
    Ctrl & Numpad6::
    if (FlagEstado == 0) {
            Send,{PgUp}{Click 333 231}{Sleep 20}0{Enter 2}0{Enter 10}0{Enter}0{Enter}0{Enter}0{Enter}+{Tab 16}060{Enter 2}1403{Enter 7}!s{Sleep 20}{Tab}{Enter}{Sleep 20}{Down}
        } Else {
            ;Subistituir item por 060 2403
            Send,{PgUp}{Click 333 231}{Sleep 20}0{Enter 2}0{Enter 10}0{Enter}0{Enter}0{Enter}0{Enter}+{Tab 16}060{Enter 2}2403{Enter 7}!s{Sleep 20}{Tab}{Enter}{Sleep 20}{Down}
        }
    Return
