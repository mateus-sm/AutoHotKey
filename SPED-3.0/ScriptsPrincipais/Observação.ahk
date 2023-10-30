#Include %A_ScriptDir%\Lib\FindText.ahk
#SingleInstance Force
GroupAdd, SPED, Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital

C195:="|<C195>*162$35.000000Aw8wwUH8l90V42aO12814rX4E2DVa8U433AFa8YaMVsFtsUU00011U0004000000U"

#IfWinActive ahk_group SPED
; Entrada dentro do estado
    F9::
        if (ok:=FindText(X, Y, 550-150000, 423-150000, 550+150000, 423+150000, 0, 0, C195)) {
            FindText().Click(X, Y, "L")
        }
        Send,{Sleep 20}{Tab 6}{Sleep 40}{Enter 2}{Sleep 40}OBSERVACAO PARA CFOP 1403{Sleep 40}{Enter 3}{Sleep 40}!s{Sleep 40}{Tab 9}{Sleep 40}{Enter}{Sleep 40}SP90090278{Sleep 40}{Enter 2}{Sleep 40}1403{Sleep 40}{Enter 6}
    Return

    F10::
        Send,{Insert}{Sleep 40}SP90090104{Sleep 40}{Enter 2}{Sleep 40}1403{Sleep 40}{Enter 7}    
    Return

; Entrada fora do estado
    F11::
        if (ok:=FindText(X, Y, 550-150000, 423-150000, 550+150000, 423+150000, 0, 0, C195)) {
            FindText().Click(X, Y, "L")
        }
        Send,{Sleep 20}{Tab 6}{Sleep 40}{Enter 2}{Sleep 40}OBSERVACAO PARA CFOP 2403{Sleep 40}{Enter 3}{Sleep 40}!s{Sleep 40}{Tab 9}{Sleep 40}{Enter}{Sleep 40}SP90090278{Sleep 40}{Enter 2}{Sleep 40}2403{Sleep 40}{Enter 6}
    Return

    F12::
        Send,{Insert}{Sleep 40}SP90090104{Sleep 40}{Enter 2}{Sleep 40}2403{Sleep 40}{Enter 7}
    Return