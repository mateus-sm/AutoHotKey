#SingleInstance Force
SetTitleMatchMode 2
Flag := 0

;Excluir uma pagina de itens, participantes ou observaçoes
PgUp:: 
    if WinExist("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
        If WinActive("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
            Flag := 1
            Loop, 7 {
                If (flag == 1) {
                   Send,{Click 271 779}{Sleep 40}
                    if WinActive("Aviso") {
                        Return
                    }
                    Else
                    {   
                        if WinActive("REGISTRO"){
                            Send,{Esc}{Sleep 40}{Click 139 297}{Sleep 40}{Enter}{Sleep 40}{Click 43 97}
                            Flag := 2
                        }
                        Else
                        {
                            Return
                        }
                    } 
                } else if (flag == 2) {
                    Send,{Click 271 704}{Sleep 40}
                    if WinActive("Aviso") {
                        Return
                    }
                    Else
                    {
                        if WinActive("REGISTRO"){
                            Send,{Esc}{Sleep 40}{Click 139 297}{Sleep 40}{Enter}{Sleep 40}{Click 43 97}
                            Flag := 3
                        }
                        Else
                        {
                            Return
                        }                        

                    } 
                } else if (flag == 3) {
                    Send,{Click 271 629}{Sleep 40}
                    if WinActive("Aviso") {
                        Return
                    }
                    Else
                    {
                        if WinActive("REGISTRO"){
                            Send,{Esc}{Sleep 40}{Click 139 297}{Sleep 40}{Enter}{Sleep 40}{Click 43 97}
                            Flag := 4
                        }
                        Else
                        {
                            Return
                        }  
                    } 
                } else if (flag == 4) {
                    Send,{Click 271 553}{Sleep 40}
                    if WinActive("Aviso") {
                        Return
                    }
                    Else
                    {
                        if WinActive("REGISTRO"){
                            Send,{Esc}{Sleep 40}{Click 139 297}{Sleep 40}{Enter}{Sleep 40}{Click 43 97}
                            Flag := 5
                        }
                        Else
                        {
                            Return
                        } 
                    } 
                } else if (flag == 5) {
                    Send,{Click 271 477}{Sleep 40}
                    if WinActive("Aviso") {
                        Return
                    }
                    Else
                    {
                        if WinActive("REGISTRO"){
                            Send,{Esc}{Sleep 40}{Click 139 297}{Sleep 40}{Enter}{Sleep 40}{Click 43 97}
                            Flag := 6
                        }
                        Else
                        {
                            Return
                        } 
                    } 
                } else if (flag == 6) {
                    Send,{Click 271 402}{Sleep 40}
                    if WinActive("Aviso") {
                        Return
                    }
                    Else
                    {
                        if WinActive("REGISTRO"){
                            Send,{Esc}{Sleep 40}{Click 139 297}{Sleep 40}{Enter}{Sleep 40}{Click 43 97}
                            Flag := 7
                        }
                        Else
                        {
                            Return
                        }
                    } 
                } else if (flag == 7) {
                    Send,{Click 271 326}{Sleep 40}
                    if WinActive("Aviso") {
                        Return
                    }
                    Else
                    {
                        if WinActive("REGISTRO"){
                            Send,{Esc}{Sleep 40}{Click 139 297}{Sleep 40}{Enter}{Sleep 40}{Click 43 97}{Sleep 20}{Click 241 243}
                            Flag := 0
                        }
                        Else
                        {
                            Return
                        }
                    } 
                } Else {
                    Return
                }
            }    
        }
    } Else {
        MsgBox,48, Aviso, Janela principal de correção inativa.,1
    }
Return