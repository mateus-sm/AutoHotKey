#SingleInstance Force

SetTitleMatchMode, 2
;Extrai o nome da empresa
;F1::
;Send,{CtrlDown}{ShiftDown}{Right 3}{CtrlUp}{ShiftUp}{Sleep 20}00000000000{Right 27}{Sleep 20}#3{Click 175 377 0}{Click 175 377 3}{Sleep 20}^c{Sleep 20}#2{CtrlDown}{ShiftDown}{Right 1}{CtrlUp}{ShiftUp}{sleep 20}^v
;Return

;Extrai CNPJ
;F2::
;Send,{Right 27}{Sleep 20}#3{Click 174 321 0}{Click 174 321 3}{Sleep 20}^c{Sleep 20}#2{CtrlDown}{ShiftDown}{Right 1}{CtrlUp}{ShiftUp}{sleep 20}^v{BS}
;Return

;Extrai IE
;F3::
;Send,{Right 27}{Sleep 20}#3{Sleep 20}^3{Click 59 613 0}{Click 59 613 3}{Sleep 20}^c{Sleep 20}^4{Sleep 20}#2{CtrlDown}{ShiftDown}{Right 1}{CtrlUp}{ShiftUp}{sleep 20}^v
;Return

;Extrai Logradouro
;F4::
;Send,{CtrlDown}{Right 19}{CtrlUp}{Sleep 20}#3{Click 174 606 0}{Click 174 606 3}{Sleep 20}^c{Sleep 20}#2{CtrlDown}{ShiftDown}{Left 1}{CtrlUp}{ShiftUp}{sleep 20}^v
;Return

;Extrai Numero
;F5::
;Send,{Right 27}{Sleep 20}#3{Click 530 606 0}{Click 530 606 3}{Sleep 20}^c{Sleep 20}#2{CtrlDown}{ShiftDown}{Right 1}{CtrlUp}{ShiftUp}{sleep 20}^v
;Return

;Extrai Complemento
;F6::
;Send,{Right 27}{Sleep 20}#3{Click 614 606 0}{Click 614 606 3}{Sleep 20}^c{Sleep 20}#2{CtrlDown}{ShiftDown}{Right 1}{CtrlUp}{ShiftUp}{sleep 20}^v
;Return

;Extrai Bairro
;F7::
;Send,{Right 27}{Sleep 20}#3{Click 311 649 0}{Click 311 649 3}{Sleep 20}^c{Sleep 20}#2{CtrlDown}{ShiftDown}{Right 1}{CtrlUp}{ShiftUp}{sleep 20}^v
;Return

;Extrai TUDO
F12::
    Send,{CtrlDown}{ShiftDown}{Right}{CtrlUp}{ShiftUp}{Sleep 20}00000000000{Right 27}{Sleep 20}
    If WinExist("Google Chrome") {
        WinActivate
        Send,{Click 175 377 0}{Click 175 377 3}{Sleep 20}^c{Sleep 20}
    }
    if WinExist("Visual Studio Code") {
        WinActivate
        Send,{CtrlDown}{ShiftDown}{Right 1}{CtrlUp}{ShiftUp}{sleep 20}^v{Sleep 20}{Right 27}{Sleep 20}
    }
    If WinExist("Google Chrome") {
        WinActivate
        Send,{Click 174 321 0}{Click 174 321 3}{Sleep 20}^c{Sleep 20}
    }
    If WinExist("Visual Studio Code") {
        WinActivate
        Send,{CtrlDown}{ShiftDown}{Right 1}{CtrlUp}{ShiftUp}{sleep 20}^v{BS}{Sleep 20}{Right 27}{Sleep 20}
    }
    If WinExist("Google Chrome") {
        WinActivate
        Send,{Sleep 20}^3{Click 59 613 0}{Click 59 613 3}{Sleep 20}^c{Sleep 20}^4{Sleep 20}
    }
    If WinExist("Visual Studio Code") {
        WinActivate
        Send,{CtrlDown}{ShiftDown}{Right 1}{CtrlUp}{ShiftUp}{sleep 20}^v{Sleep 20}{CtrlDown}{Right 19}{CtrlUp}{Sleep 20}
    }
    If WinExist("Google Chrome") {
        WinActivate
        Send,{Click 174 606 0}{Click 174 606 3}{Sleep 20}^c{Sleep 20}
    }
    If WinExist("Visual Studio Code") {
        WinActivate
        Send,{CtrlDown}{ShiftDown}{Left 1}{CtrlUp}{ShiftUp}{sleep 20}^v{Sleep 20}{Right 27}{Sleep 20}
    }
    If WinExist("Google Chrome") {
        WinActivate
        Send,{Click 530 606 0}{Click 530 606 3}{Sleep 20}^c{Sleep 20}
    }
    If WinExist("Visual Studio Code") {
        WinActivate
        Send,{CtrlDown}{ShiftDown}{Right 1}{CtrlUp}{ShiftUp}{sleep 20}^v{Sleep 20}{Right 27}{Sleep 20}
    }
    If WinExist("Google Chrome") {
        WinActivate
        Send,{Click 614 606 0}{Click 614 606 3}{Sleep 20}^c{Sleep 20}
    }
    If WinExist("Visual Studio Code") {
        WinActivate
        Send,{CtrlDown}{ShiftDown}{Right 1}{CtrlUp}{ShiftUp}{sleep 20}^v{Sleep 20}{Right 27}{Sleep 20}
    }
    If WinExist("Google Chrome") {
        WinActivate
        Send,{Click 311 649 0}{Click 311 649 3}{Sleep 20}^c{Sleep 20}
    }
    If WinExist("Visual Studio Code") {
        WinActivate
        Send,{CtrlDown}{ShiftDown}{Right 1}{CtrlUp}{ShiftUp}{sleep 20}^v{Sleep 20}
    }

Return