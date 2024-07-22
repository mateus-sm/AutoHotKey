#SingleInstance Force
#IfWinActive Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital

; V 1.0.5
; Entrada
F9::Send,{Tab 6}{Sleep 40}{Enter}{Sleep 40}35{Sleep 40}{Enter 3}{Sleep 40}!s{Sleep 40}{Tab 9}{Sleep 40}{Enter}{Sleep 40}SP90090278{Sleep 40}{Enter 2}{Sleep 40}1403{Sleep 40}{Enter 6}
F10::Send,{Insert}{Sleep 40}SP90090104{Sleep 40}{Enter 2}{Sleep 40}1403{Sleep 40}{Enter 7}
;Saida
F11::Send,{Tab 6}{Sleep 40}{Enter}{Sleep 40}36{Sleep 40}{Enter 3}{Sleep 40}!s{Sleep 40}{Tab 9}{Sleep 40}{Enter}{Sleep 40}SP90090278{Sleep 40}{Enter 2}{Sleep 40}2403{Sleep 40}{Enter 6}
F12::Send,{Insert}{Sleep 40}SP90090104{Sleep 40}{Enter 2}{Sleep 40}2403{Sleep 40}{Enter 7}

; V 1.0.4
;F1::Send,{Tab 6}{Sleep 40}{Enter}{Sleep 40}36{Sleep 40}{Enter 3}{Sleep 40}!s{Sleep 40}{Tab 9}{Sleep 40}{Enter}{Sleep 40}{Down}{Sleep 40}+{Tab}{Sleep 40}{Enter 3}{Sleep 40}1403{Sleep 40}{Enter 6}
;F2::Send,{Insert}{Sleep 40}{Down}{Sleep 40}+{Tab}{Sleep 40}{Up 3}{Sleep 40}{Enter 3}{Sleep 40}1403{Sleep 40}{Enter 7}

; V 1.0.3
;F1::Send,{Tab 6}{Sleep 40}{Enter}{Sleep 40}35{Sleep 40}{Enter 3}{Sleep 40}!s
;F2::Send,{Tab 9}{Sleep 40}{Enter}{Sleep 40}{Down}{Sleep 40}+{Tab}{Sleep 40}{Enter 3}{Sleep 40}1403{Sleep 40}{Enter 6}
;F3::Send,{Insert}{Sleep 40}{Down}{Sleep 40}+{Tab}{Sleep 40}{Up 3}{Sleep 40}{Enter 3}{Sleep 40}1403{Sleep 40}{Enter 7}

;V 1.0.2
;F1::Send,{Tab 6}{Sleep 40}{Enter}{Sleep 40}35{Sleep 40}{Enter 3}{Sleep 40}!s
;F2::Send,{Tab 9}{Sleep 40}{Enter}
;F3::Send,{Down}{Sleep 40}+{Tab}{Sleep 40}{Enter 3}{Sleep 40}1403{Sleep 40}{Enter 6}
;F4::Send,{Insert}{Sleep 40}{Down}{Sleep 40}+{Tab}{Sleep 40}{Up 3}{Sleep 40}{Enter 3}{Sleep 40}1403{Sleep 40}{Enter 7}

;V 1.0.1
;F1::Send,{Tab 6}{Sleep 40}
;F2::Send,35{Sleep 40}{Enter 3}{Sleep 40}!s
;F3::Send,{Tab 9}{Sleep 40}
;F4::Send,{Down}{Sleep 40}+{Tab}{Sleep 40}{Enter 3}{Sleep 40}1403{Sleep 40}{Enter 6}
;F5::Send,{Insert}{Sleep 40}{Down}{Sleep 40}+{Tab}{Sleep 40}{Up 3}{Sleep 40}{Enter 3}{Sleep 40}1403{Sleep 40}{Enter 7}

;V 1.0.0
;F1::Send,{Tab 6}{Sleep 40}
;F2::Send,35{Sleep 40}{Enter 3}{Sleep 40}!s
;F3::Send,{Tab 9}{Sleep 40}
;F4::Send,{Down}{Sleep 40}+{Tab}{Sleep 40}{Enter 3}{Sleep 40}1403{Sleep 40}{Enter 6}
;F5::Send,{Insert}
;F6::Send,{Down}{Sleep 40}+{Tab}{Sleep 40}{Up 3}{Sleep 40}{Enter 3}{Sleep 40}1403{Sleep 40}{Enter 7}