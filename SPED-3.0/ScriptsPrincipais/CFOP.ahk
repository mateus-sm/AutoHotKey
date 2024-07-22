#Include <FindText>
#Include <matFunctions>
#SingleInstance Force
Menu, Tray, Icon, Shell32.dll, 44
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
        if (FlagEstado == "") {
            FlagEstado := 1
            ToolTip, CFOP fora do estado, 1115, 972
            SetTimer, RemoveToolTip, -3000 
        } Else {
            FlagEstado := ""
            ToolTip, CFOP dentro do estado, 1115, 972
            SetTimer, RemoveToolTip, -3000
        }
    return

#IfWinActive ahk_group SPED
;000
    
    ;Lançar 000 1102
    Alt & Numpad0::
        if (FlagEstado == "") {
            lancar("ENTRADA ESTADUAL", "000", "1102", "UN")
        } Else {
            lancar("ENTRADA INTERESTADUAL", "000", "2102", "UN")   
        }
    Return
    ;||||||;
    ;Substituir item por 000 1102
    Ctrl & Numpad0::
        if (FlagEstado == "") {
            substituirExc("000", "1102")         
        } Else {
            substituirExc("000", "2102")
        }
    Return

;020
    ;Lançar 020 1102
    Alt & Numpad2::
        if (FlagEstado == "") {
            lancar("ENTRADA ESTADUAL", "020", "1102", "UN")
        } Else {
            lancar("ENTRADA INTERESTADUAL", "020", "2102", "UN")
        }
    Return
    ;||||||;
    ; Substituir item por 020 1102
    Ctrl & Numpad2::
        if (FlagEstado == "") {
            substituirExc("020", "1102")
        } Else {
            substituirExc("020", "2102")
        }
    Return

;040
    ;lançar 040 1102
    Alt & Numpad4::
        if (FlagEstado == "") {
            lancar("ENTRADA ESTADUAL", "040", "1102", "UN")
        } Else {
            lancar("ENTRADA INTERESTADUAL", "040", "2102", "UN")
        }
    Return
    ;||||||;
    ;Substituir item por 040 1102
    Ctrl & Numpad4::
        if (FlagEstado == "") {
            substituir("040", "1102")
        } Else {
            substituir("040", "2102")
        }
    Return
    
;060
    ;lançar 060 1403
    Alt & Numpad6::
        if (FlagEstado == "") {
            lancar("ENTRADA ESTADUAL", "060", "1403", "UN")
        } Else {
            lancar("ENTRADA INTERESTADUAL", "060", "2403", "UN")
        }
    Return
    ;||||||;
    ;Subistituir item por 060 1403
    Ctrl & Numpad6::
    if (FlagEstado == "") {
            substituir("060", "1403")
        } Else {
            substituir("060", "2403") 
        }
    Return
