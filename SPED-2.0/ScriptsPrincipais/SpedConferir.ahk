#SingleInstance Force
GroupAdd, SPED, Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital
GroupAdd, SPED, REGISTRO - C100 - ENTRADA - Nota Fiscal Eletrônica
GroupAdd, SPED, REGISTRO - C100 - ENTRADA - Nota Fiscal
GroupAdd, SPED, REGISTRO - C170 - ENTRADA - Itens
GroupAdd, SPED, REGISTRO - 0150 - Participante
GroupAdd, SPED, REGISTRO - C190 - ENTRADA - Analítico
GroupAdd, SPED, REGISTRO - C190 - SAIDA - Analítico
GroupAdd, SPED, REGISTRO - 0200 - Item/Produtos
GroupAdd, SPED, REGISTRO - 0450 - Informação Complementar
GroupAdd, SPED, REGISTRO - C500 - ENTRADA - Nota Fiscal/Conta de Energia Elétrica
GroupAdd, SPED, Sem título - Paint
GroupAdd, SPED, Pesquisar Dados Cadastrais

SetTitleMatchMode 2

;Variaveis
FlagWASD := 0
FlagItens := 0
FlagAnalitico := 0
FlagEstado := 0

;Label para usar timer na notificação das flags
    RemoveToolTip:
    ToolTip
    return

;Comandos para Usar em qualquer instancia, dentro ou fora do SPED
;Troca o Numlock por um Backspace
    NumLock::BackSpace
    Return

;Apresenta as coordenadas do mouse
    F1 & Space::
        MouseGetPos, xpos, ypos 
        MsgBox,4, Aviso, Posição do mouse = X -> %xpos% Y -> %ypos%.`nGostaria de copiar o comando click?
        IfMsgBox, Yes
            Clipboard = {Click %xpos% %ypos%}
        Else
    Return

;Ativa e desativa WASD
    +1::
        if (FlagWASD == 0) {
            FlagWASD := 1 
            ToolTip, WASD ativado, 1115, 972
            SetTimer, RemoveToolTip, -3000
        } Else {
            FlagWASD := 0
            ToolTip, WASD desativado, 1115, 972
            SetTimer, RemoveToolTip, -3000
        }
    return

;Ativa e desativa flag de estado -> FlagEstado
    +F3::
        if (FlagEstado == 0) {
            FlagEstado := 1 
            ToolTip, OBS fora do estado, 1115, 972
            SetTimer, RemoveToolTip, -3000
        } Else {
            FlagEstado := 0
            ToolTip, OBS dentro do estado, 1115, 972
            SetTimer, RemoveToolTip, -3000
        }
    return        

;Abrir e minimizar a calculadora
    SC07E::
        If WinExist("Calculadora") {
            If WinActive("Calculadora") {
                Send,!{Tab}
            } Else {
                WinActivate 
            }
        } Else {
            Run Calc.exe
            WinWaitActive, ahk_exe Calc.exe
            If WinActive("Calculadora") {
                MsgBox,48, Aviso, A Calculadora foi aberta.,1
            } Else {
                MsgBox,48, Aviso, A Calculadora não pôde ser aberta.,1
            }
        }
    Return   

#IfWinActive ahk_group SPED
;Comandos que só funcionam dentro do SPED
;Pesquisa de nota
    NumpadSub::
        if WinActive("REGISTRO - C100 - ENTRADA") {
            Send,{Click 392 215}^c{Click 363 336}
            if WinExist("Microsoft​ Edge") {
                WinActivate
                Send,^f^v
            } Else {
                MsgBox,48, Aviso, Edge não encontrado, abra o mesmo para pesquisar essa nota.,2
            }
        } Else {
            Send,{Click 1147 266}{Click 408 340}{Click 158 430}{Click 983 271}{PrintScreen}    
        }
        FlagItens := 0
        FlagWASD := 0
    Return

;Voltar do analitico para a Pesquisa
    NumpadAdd::
        if WinActive("REGISTRO - C190 - ENTRADA - Analítico") {
            Send,{Tab 5}
        } else {
            Send,{Click 983 271}
        }
    Return

;Pular 5 espaços analitico
    '::
        if WinActive("REGISTRO - C190 - ENTRADA - Analítico") {
            switch FlagAnalitico {
                case 0:
                    Send,{Tab 5}
                    FlagAnalitico := 1
                Return  
                case 1:
                    Send,{Tab 5}
                    FlagAnalitico := 2
                Return 
                case 2:
                    Send,{Enter}!s
                    FlagAnalitico := 0
                Return    
            }
        } else {
            Send,{tab 5}
        }  
    Return

;Completar espaço zerado
    \::
    Send,0{Enter}0{Enter}0{Enter}0
    Return

;Guardar tela no paint
    PgDn::
        Send,{PrintScreen}{Sleep 20}
            If WinExist("Paint") {
                WinActivate
                Send,^v{Sleep 20}{AltDown}{Tab}{AltUp}
            } Else {
                Run, mspaint.exe
                WinWaitActive, ahk_exe mspaint.exe
                If WinActive("Paint") {
                    MsgBox,48, Aviso, O Paint foi aberto para uso do comando.,1
                } Else {
                    MsgBox,48, Aviso, O Paint não pôde ser aberto.,1
                }
            }    
    Return

;Recalcula Analitico
    ScrollLock::
        If WinActive("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
            Send,{Click 63 379}{Sleep 40}{Enter}{Enter}{Sleep 40}{Click 160 430}{Click 271 521}
            FlagItens := 0 
        } Else {
            MsgBox,48, Aviso, Janela principal de correção inativa.,1
        }
    Return

;Combinas dois ultimos comandos
    PgDn & ScrollLock::
        Send,{PrintScreen}{Sleep 20}
            If WinExist("Paint") {
                WinActivate
                Send,^v{Sleep 20}{AltDown}{Tab}{AltUp}
            } Else {
                Run, mspaint.exe
                WinWaitActive, ahk_exe mspaint.exe
                If WinActive("Paint") {
                    MsgBox,48, Aviso, O Paint foi aberto para uso do comando.,1
                } Else {
                    MsgBox,48, Aviso, O Paint não pôde ser aberto.,1
                }
            }
            If WinActive("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
                Send,{Click 63 379}{Sleep 40}{Enter}{Enter}{Sleep 40}{Click 160 430}{Click 271 521}
                FlagItens := 0 
            } Else {
                MsgBox,48, Aviso, Janela principal de correção inativa.,1
            }
    Return

;Volta para o analitico
    XButton1::
    Send,{Click 43 97}{Click 330 402}
    Return

;Exclui Observação
    XButton2::
    Send,{Click 1147 266}{Click 408 340}{Click 270 431}{Click 251 521 0}{Click 1}{Click 67 530}{Enter}{Sleep 10}{Click 983 271}
    Return

;Ir para Itens a partir da pesquisa
    F1::
        If (FlagItens == 0) {
            If WinActive("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
                Send,{Click 80 430}{Click 114 519}    
            } Else {
                MsgBox,48, Aviso, Janela principal de correção inativa.,1
            }
        } Else {
            If WinActive("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
                Send,{Click 80 430}{Click 122 566}
            } Else {
                MsgBox,48, Aviso, Janela principal de correção inativa.,1
            }
        }
    Return

;Ir para itens e filtrar por CST
    F1 & F2::
        If (FlagItens == 0){
            If WinActive("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
                Send,{Click 80 430}{Click 103 457}{Click 121 492}{PgUp}{Down 8}{Enter}
            } Else {
                MsgBox,48, Aviso, Janela principal de correção inativa.,1
            }
            FlagItens := 1  
        } Else {
            If WinActive("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
                Send,{Click 80 430}{Click 415 496}
            } Else {
                MsgBox,48, Aviso, Janela principal de correção inativa.,1
            }
        }
    Return

;Ir para Analitico pós validaçao
    F2::
    Send,{Click 160 430}{Click 271 521}
    Return

;Ir para Obs e alterar codigo da observação.
    F3::
        if (FlagEstado == 0) {
            Send,{Click 270 431}{Click 251 521 0}{Click 2}{Sleep 20}0{Enter}OBSERVACAO PARA CFOP 1403{Enter 5}
        } Else {
            Send,{Click 270 431}{Click 251 521 0}{Click 2}{Sleep 20}0{Enter}OBSERVACAO PARA CFOP 2403{Enter 5}
        }
    Return

;Alterar valor da observação
    F4::
        if (FlagEstado == 0) {
            Send,{Click 1018 765 0}{Click 2}{Sleep 20}{Tab 2}1403{Enter 9}{Sleep 20}{Click 1057 748 0}{Click 2}{Sleep 20}{Tab 2}1403{Tab 6}0{Enter}+{Tab}
        } Else {
            Send,{Click 1018 765 0}{Click 2}{Sleep 20}{Tab 2}1403{Enter 9}{Sleep 20}{Click 1057 748 0}{Click 2}{Sleep 20}{Tab 2}2403{Tab 6}0{Enter}+{Tab}
        }
    Return

;Empresa com erro de CST
    ;Em especial casos onde os erros do analitico apontam duplicidade de CST
    ;Sair da primeira tela apontando o erro e voltando para a nota será necessario pesquisar ela novamente
        ;Pesquisar a nota com erro apontada pelo relatorio
            NumpadMult::
                Send,{Click 924 17}{Sleep 20}{Click 179 199}{Sleep 20}{Tab 9}{Sleep 40}{Enter}{Sleep 20}{Tab 7}{Sleep 20}^c{Sleep 20}{Click 924 17}{Sleep 20}{Click 1236 229}{Sleep 20}{Click 306 266}{Sleep 20}{Down 5}{Sleep 20}{Click 444 269}{Sleep 20}{Down 2}{Sleep 20}{Enter}{Sleep 20}{Tab}{Sleep 20}^v{Sleep 20}{Tab}{Sleep 20}{Enter}{Sleep 20}{Tab 5}{Down}{Sleep 20}{PrintScreen}{Sleep 20}
                If WinExist("Paint") {
                    WinActivate
                    Send,^v{Sleep 20}{AltDown}{Tab}{AltUp}
                } Else {
                    MsgBox,48, Aviso, A janela "Paint" não foi encontrada.,1
                }
            Return

;Da inicio ao lançamento de uma nota do 0, a partir do numero dela na barra de pesquisa do SPED
    F5 & F6::
        if WinExist("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração") {
            WinActivate
            Send, ^c{Sleep 40}
                
            If WinExist("Google Chrome") {
                WinActivate ;{Sleep 40}{Click 918 409}
                Send,^2{Sleep 40}{Click 1047 409}{Sleep 40}{Click 555 281}{Sleep 40}^v{Sleep 40}{Tab}{Sleep 40}{Right}{Sleep 40}{Tab 2}{Sleep 40}{Enter}{Sleep 80}

                If WinExist("Sped Fiscal") {
                    WinActivate
                    Send,{Click 63 319}{Sleep 20}{Tab 7}{Sleep 20}^v{Sleep 20}{Enter}{Sleep 40}

                    if WinExist("Lançamentos Fiscais") {
                        WinActivate
                        Send,{Sleep 40}!h{Sleep 40}^v{Sleep 40}{Enter}{Sleep 100}{Click 510 109 2}{Sleep 40}{Click Right}{Sleep 40}{Down 4}{Sleep 20}{Enter}{Sleep 40}

                        If WinExist("Sped Fiscal") {
                            WinActivate
                            Send,{Sleep 40}{Tab 7}{Sleep 40}^v{Sleep 40}{Click 513 196}{Sleep 40}

                            If WinExist("Google Chrome") {
                                WinActivate
                                Send,{Sleep 40}{Click 1096 745}
                            } else {
                                MsgBox,48, Aviso, A janela "Google Chrome" não foi encontrada.,1
                            }
                        } else {
                            MsgBox,48, Aviso, A janela "Sped Fiscal" não foi encontrada.,1
                        }
                    } else {
                        MsgBox,48, Aviso, A janela "Lançamentos Fiscais" não foi encontrada.,1
                    }
                } else {
                    MsgBox,48, Aviso, A janela "Sped Fiscal" não foi encontrada.,1
                }
            } else {
                MsgBox,48, Aviso, A janela "Google Chrome" não foi encontrada.,1
            }
        } else {
            MsgBox,48, Aviso, A janela "Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração" não foi encontrada.,1
        }
    Return

;Troca o frete
    ;f::
    ;    Send,{Enter}{Sleep 20}{Tab 13}{Sleep 20}{Down}{Sleep 20}+{Tab}{Sleep 20}{Enter}!s{Sleep 20}{Down}
    ;Return

;Esquema WASD, pode ser ativado ou desativado
    #if FlagWASD == 1
        w::
            send,{up}
        Return
        s::
            send,{Click 1242 655}
        Return
        a:: 
            MouseClickDrag, L, 323, 887, 125, 887
        Return
        d::
            MouseClickDrag, L, 261, 887, 311, 887
        Return
    Return

Return

#IfWinNotActive, Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital
;Comandos que só funcionam fora da janela principal de correção do SPED e a tecla original não perde a função dentro dele
;Pesquisar nota G5
    Home::
        If WinExist("Lançamentos Fiscais") {
            Send,^v{Enter}
            WinActivate
            Send,{Sleep 20}{Click 193 187}{Sleep 20}^{Enter}{Sleep 20}{Click 128 499}
        } Else {
            MsgBox,48, Aviso, A janela de Notas Fiscais do G5 não foi encontrada.,1
        }
    Return

;Sair da nota no G5
    End::
        If WinExist("Itens da NF") {
            WinActivate
            Send,{Click 736 16}{Sleep 20}!n{Sleep 20}{Click 187 71}
        } Else {
            MsgBox,48, Aviso, A janela de itens do G5 não se encontra aberta.,1
        }
    Return

Return    

;Alterar base do ICMS
    Insert::
    Send,{Click 591 342}
    Return

#IfWinNotActive, ahk_group SPED
;Comandos que funcionam fora do SPED e a tecla original não perde a função dentro dele

;Copiar itens Klaus para 1556
    Delete::
        if WinExist(".pdf - Google Chrome") {
            WinActivate
            Send, ^c{Sleep 40}

            If WinExist("Sped Fiscal") {
                WinActivate
                Send,{Right}{Sleep 20}^v{Sleep 20} -{Space}

                if WinExist(".pdf - Google Chrome") {
                    WinActivate
                } Else {
                    MsgBox,48, Aviso, A janela "NFE - Google Chrome" não foi encontrada.,1
                }
            } Else {
                MsgBox,48, Aviso, A janela "Sped Fiscal" não foi encontrada.,1
            }
        } Else {
            MsgBox,48, Aviso, A janela "NFE - Google Chrome" não foi encontrada.,1
        }    
    Return

Return      
                       