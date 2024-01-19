#SingleInstance Force
#Include %A_ScriptDir%\Lib\matFunctions.ahk
Menu, Tray, Icon, pifmgr.dll, 15

GroupAdd, SpedG5, Visual Studio Code
GroupAdd, SpedG5, Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital

SetTitleMatchMode, 2

SetaCima:="|<SetaCima>*200$12.1U3k6MAAM6k3U1U"
Zero:="|<Zero>*194$18.C2QH2mF4Wl4XlAXl8XF8WHEmCEQ0k0U"

;Label para usar timer na notificação das flags
    RemoveToolTip:
    ToolTip
    return

#IfWinNotActive ahk_group SpedG5

;Ativa e desativa Entrada/Saida
    +1::
        If (Flag == "") {
            Flag := 1 
            ToolTip, Orientação: CIMA, 1115, 972
            SetTimer, RemoveToolTip, -3000
        } Else {
            Flag := ""
            ToolTip, Orientação: BAIXO, 1115, 972
            SetTimer, RemoveToolTip, -3000
        }
    return

    q::
        if (flag == "") {
            ;Retorno
            Send,^2^g
        } else {
            ;Retorno para cima
            Send,^2{Sleep 20}{Click}
            ClickOnImage(SetaCima, 0, 0, "L", "Seta Cima", X, Y)
            Click -77 430 0
        }
    Return

    ;Busca com retorno automatico
    w::
        Send,{Click 2}^c^3{Sleep 15}^f{BS}^v{Sleep 20}
        
        ;Verifica se achou algo
        if (ok:=FindText(X, Y, 901-150000, 88-150000, 901+150000, 88+150000, 0, 0, Zero)) {
            Exit   
        }

        ;Retorno
        Send,^2^g  
    Return

    ;Busca
    +w::Send,{Click 2}^c^3{Sleep 15}^f{BS}^v{Sleep 20}