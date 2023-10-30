#SingleInstance Force
GroupAdd, SPED, Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital

#IfWinActive ahk_group SPED

; Entrada dentro do estado
F9::Send,{Click 259 430 2}{Sleep 20}{Tab 6}{Sleep 40}{Enter 2}{Sleep 40}OBSERVACAO PARA CFOP 1403{Sleep 40}{Enter 3}{Sleep 40}!s{Sleep 40}{Tab 9}{Sleep 40}{Enter}{Sleep 40}SP90090278{Sleep 40}{Enter 2}{Sleep 40}1403{Sleep 40}{Enter 6}
F10::Send,{Insert}{Sleep 40}SP90090104{Sleep 40}{Enter 2}{Sleep 40}1403{Sleep 40}{Enter 7}
; Entrada fora do estado
F11::Send,{Click 259 430 2}{Sleep 20}{Tab 6}{Sleep 40}{Enter 2}{Sleep 40}OBSERVACAO PARA CFOP 2403{Sleep 40}{Enter 3}{Sleep 40}!s{Sleep 40}{Tab 9}{Sleep 40}{Enter}{Sleep 40}SP90090278{Sleep 40}{Enter 2}{Sleep 40}2403{Sleep 40}{Enter 6}
F12::Send,{Insert}{Sleep 40}SP90090104{Sleep 40}{Enter 2}{Sleep 40}2403{Sleep 40}{Enter 7}
