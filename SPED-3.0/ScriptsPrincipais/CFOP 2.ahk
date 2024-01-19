#SingleInstance Force
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\matFunctions.ahk
Menu, Tray, Icon, Shell32.dll, 44
GroupAdd, SPED, REGISTRO - C170 - ENTRADA - Itens

;Label para usar timer na notificação das flags
    RemoveToolTip:
    ToolTip
    return

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

;1949
    ;Lançar 090 1949
    Alt & Numpad4::
        if (FlagEstado == "") {
            lancar("ENTRADA ESTADUAL", "090", "1949", "UN")
        } Else {
            lancar("ENTRADA INTERESTADUAL", "090", "2949", "UN")
        }
    Return
    ;Substituir por 090 1949
    Ctrl & Numpad4::
        if (FlagEstado == "") {
            substituir("090", "1949")
        } Else {
            substituir("090", "2949")
        }
    Return

;1556
    ;Lançar 090 1556
    Alt & Numpad5::
        if (FlagEstado == "") {
            lancar("ENTRADA ESTADUAL", "090", "1556", "UNI")
        } Else {
            lancar("ENTRADA INTERESTADUAL", "090", "2556", "UNI")
        }
    Return
    ;Substituir item por 090 1556
    Ctrl & Numpad5::
        if (FlagEstado == "") {
            substituir("090", "1556")
        } Else {
            substituir("090", "2556")
        }
    Return

;1653
    ;Lançar 090 1653
    Alt & Numpad3::
        if (FlagEstado == "") {
            lancar("ENTRADA ESTADUAL", "090", "1653", "LTS")
        } Else {
            lancar("ENTRADA INTERESTADUAL", "090", "2653", "LTS")
        }
    Return

;1910
    ;Lançar 090 1910
    Alt & Numpad9::
        if (FlagEstado == "") {
            lancar("BONIFICACAO ESTADUAL", "090", "1910", "UNI")
        } Else {
            lancar("BONIFICACAO INTERESTADUAL", "090", "2910", "UNI")
        }
    Return
    ;Substituir item por 090 1910
    Ctrl & Numpad9::
        if (FlagEstado == "") {
            substituir("090", "1910")
        } Else {
            substituir("090", "2910")
        }
    Return

    ;Lançar 000 1910
    Alt & Numpad0::
        if (FlagEstado == "") {
            lancar("BONIFICACAO ESTADUAL", "000", "1910", "UNI")
        } Else {
            lancar("BONIFICACAO INTERESTADUAL", "000", "2910", "UNI")
        }
    Return
    ;Substituir item por 000 1910
    Ctrl & Numpad0::
        if (FlagEstado == "") {
            substituir("000", "1910")
        } Else {
            substituir("000", "2910")
        }
    Return
    
    ;Lançar 020 1910
    Alt & Numpad2::
        if (FlagEstado == "") {
            lancar("BONIFICACAO ESTADUAL", "020", "1910", "UNI")
        } Else {
            lancar("BONIFICACAO INTERESTADUAL", "020", "2910", "UNI")
        }
    Return
    ;Substituir item por 020 1910
    Ctrl & Numpad2::
        if (FlagEstado == "") {
            substituir("020", "1910")
        } Else {
            substituir("020", "2910")
        }
    Return
/*
Codigo de comando 1910/1949/1556/1653
 F7 Para lançar o codigo
 F8 para substituir pelo codigo
1949 digito 4
1556 digito 5
1653 digito 3
1910 digito 1, 0, 2
*/