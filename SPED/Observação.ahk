#SingleInstance Force
#IfWinActive Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital

; Entrada
F9::Send,{Tab 6}{Sleep 40}{Enter}{Sleep 40}35{Sleep 40}{Enter 3}{Sleep 40}!s{Sleep 40}{Tab 9}{Sleep 40}{Enter}{Sleep 40}SP90090278{Sleep 40}{Enter 2}{Sleep 40}1403{Sleep 40}{Enter 6}
F10::Send,{Insert}{Sleep 40}SP90090104{Sleep 40}{Enter 2}{Sleep 40}1403{Sleep 40}{Enter 7}
;Saida
F11::Send,{Tab 6}{Sleep 40}{Enter}{Sleep 40}36{Sleep 40}{Enter 3}{Sleep 40}!s{Sleep 40}{Tab 9}{Sleep 40}{Enter}{Sleep 40}SP90090278{Sleep 40}{Enter 2}{Sleep 40}2403{Sleep 40}{Enter 6}
F12::Send,{Insert}{Sleep 40}SP90090104{Sleep 40}{Enter 2}{Sleep 40}2403{Sleep 40}{Enter 7}
