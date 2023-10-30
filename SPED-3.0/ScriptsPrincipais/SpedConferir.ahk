#Include %A_ScriptDir%\Lib\FindText.ahk
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

;Imagens de referencias para clicks
Lupa:="|<Lupa>*220$17.3k0Ds0kM30sC1kTDUzzVzy1zg30s3Xs3zs1Xs03s02s03k03E"
NFE:="|<NFE>*139$25.C2108200400031ncsl5YW4yWT1EF81g8a7XoFw"
NumeroDoc:="|<NumeroDoc>*137$107.0400000000000000014000000U04000000838000001008000000E6GHyQtkCC1llmHyQxneYYZ94UYY4YYIYZ999J99/u919899899/uGGaGGI4G2GEGGEGGI4YZAYYd8Y4YUYYWYYd99+9t9CEk760sktt9CGNY"
BaseCalcC100:="|<BaseCalcC100>*135$119.00000000200000000000w0000E000E040101C8Fl40000U000U080202mNYG8tss770stCGHUQQ50n87mGGEGG2+GWYd198+16Q8Xb7kYy43Z19G2GEI246F93819089+2GY4YUc5c2WGHG2GEFGIIZ8991NfG9swwQ3XUQwbD9UCA2SGXo"
IconeAnalitico:="|<IconeAnalitico>*204$23.00000000000000000E001k103k20DU40P080r0E360U7y10Tw20kQ43UM860sEQ0kUk1l1U1W00040008000nzzzk"
Item1Analitico:="|<Item1Analitico>*138$32.000000wyD7UE84N48222F20UUYEUD8948222S20UUY0E84N03m0sE000002"
Relatorios:="|<Relatorios>*137$50.0000000000000U000y0E402008U41000028tCtndnkWGIYYWYYDbot98dC2F1GGG+EkWGIYYWYa8nZta8aD000000002"
MensagemRelatorio:="|<MensagemRelatorio>*110$76.sQ00000000003lk0000000000D700000000000wwD6sS3kv7VivHlyTnwTbwz7zxj6NXA06MnAMnqgzqAy1tXTtXDSnzMlwTaBzaAwv61X0taMn0MnngRaAn6tzClXDAkwMlwTngS6Ak00000000k00000000001r000000000003s0008"
OBS:="|<OBS>*142$104.000000000000000000w4180001000000200E20E0000E000000M08004000040000000020QD8wQ1lQstsLXbXUU8YGF8UWN8FN89U948294YG88YH7oGCECF20WF94W294912YY4YEE8YGF8UWN1MEl9V943lkwXlk77XXoASCSC000004000000001U000000300000000080000007U00000000A008"
BaseCalcC170:="|<BaseCalcC170>*137$138.0000000000000000000000000000000100000000000000D0000400040100E0HW4Q1nw8U000400040100E0KHAW28E8XbXUQQ3XYt9C1lkI3AU20EDYYYUYY4IZ59G2GEI2As3UE8Xb7kYy43Z19G2GEI2460ME8YVY0YU44Z19G2GEI2o104E8YYoUYY4IZ59G2GEKOoW28ED7bXUQQ3bYttA1lUHmIS1sE00000000000000000000000U"
C197:="|<C197>*162$35.000000Aw8xyUH8l88V42aMl2814l34E2Da68U438AFa8YEMVsFsUUU00011U0004000000U"
C195:="|<C195>*162$35.000000Aw8wwUH8l90V42aO12814rX4E2DVa8U433AFa8YaMVsFtsUU00011U0004000000U"
C170:="|<C170>*151$35.000000As9yMUH8k98V42UWF28114W4E26968U48GAFa8EYEVsEUkUU00011U0004000000U"
C190:="|<C190>*154$33.As8sMVAX4YWF0daYG814oWF08yYO810YXFa8YYG7V73280000FU0004U"

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
            if (ok:=FindText(X, Y, 567-150000, 429-150000, 567+150000, 429+150000, 0, 0, NumeroDoc)) {
                FindText().Click(X+239, Y+0, "L")
            }
            Send,^c
            if (ok:=FindText(X, Y, 572-150000, 549-150000, 572+150000, 549+150000, 0, 0, BaseCalcC100)) {
                FindText().Click(X+239, Y, "L")
            }
            if WinExist("Microsoft​ Edge") {
                WinActivate
                Send,^f^v
            } Else {
                MsgBox, 48, Aviso, Edge não encontrado abra o mesmo para pesquisar essa nota.,2
            }
        } Else {
            if (ok:=FindText(X, Y, 1469, 81, 1919, 406, 0, 0, Lupa)) {
                FindText().Click(X, Y, "L")
            }
            if (ok:=FindText(X, Y, 0, 0, 1919, 1079, 0, 0, NFE)) {
                FindText().Click(X+10, Y+20, "L")
            }
            if (ok:=FindText(X, Y, 0, 0, 1919, 1079, 0, 0, C190)) {
                FindText().Click(X, Y, "L")
            }
            if (ok:=FindText(X, Y, 1469, 81, 1919, 406, 0, 0, Lupa)) {
                FindText().Click(X-200, Y, "L")
            }
            Send,{PrintScreen}    
        }
        FlagItens := 0
        FlagWASD := 0
    Return

;Voltar do analitico para a Pesquisa
    NumpadAdd::
        if WinActive("REGISTRO - C190 - ENTRADA - Analítico") {
            Send,{Tab 5}
        } else {
            if (ok:=FindText(X, Y, 1469, 81, 1919, 406, 0, 0, Lupa)) {
                FindText().Click(X-200, Y, "L")
            }
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
            if (ok:=FindText(X, Y, 303-150000, 373-150000, 303+150000, 373+150000, 0, 0, IconeAnalitico)) {
                FindText().Click(X, Y, "L")
            }
            Send,{Sleep 40}{Enter}{Enter}{Sleep 40}
            if (ok:=FindText(X, Y, 0, 0, 1919, 1079, 0, 0, C190)) {
                FindText().Click(X, Y, "L")
            }
            if (ok:=FindText(X, Y, 362-150000, 493-150000, 362+150000, 493+150000, 0, 0, Item1Analitico)) {
                FindText().Click(X+106, Y+20, "L")
            }
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
                if (ok:=FindText(X, Y, 303-150000, 373-150000, 303+150000, 373+150000, 0, 0, IconeAnalitico)) {
                    FindText().Click(X, Y, "L")
                }
                Send,{Sleep 40}{Enter}{Enter}{Sleep 40}
                if (ok:=FindText(X, Y, 0, 0, 1919, 1079, 0, 0, C190)) {
                    FindText().Click(X, Y, "L")
                }
                if (ok:=FindText(X, Y, 362-150000, 493-150000, 362+150000, 493+150000, 0, 0, Item1Analitico)) {
                    FindText().Click(X+106, Y+20, "L")
                }
                FlagItens := 0 
            } Else {
                MsgBox,48, Aviso, Janela principal de correção inativa.,1
            }
    Return

;Volta para o analitico
    XButton1::
        if (ok:=FindText(X, Y, 32-150000, 90-150000, 32+150000, 90+150000, 0, 0, Relatorios)) {
            FindText().Click(X, Y, "L")
        }
        Send,{Sleep 10}
        if (ok:=FindText(X, Y, 401-150000, 632-150000, 401+150000, 632+150000, 0, 0, MensagemRelatorio)) {
            FindText().Click(X, Y, "L")
        }
    Return

;Exclui Observação
    XButton2::
        if (ok:=FindText(X, Y, 1469, 81, 1919, 406, 0, 0, Lupa)) {
            FindText().Click(X, Y, "L")
        }
        if (ok:=FindText(X, Y, 0, 0, 1919, 1079, 0, 0, NFE)) {
            FindText().Click(X+10, Y+20, "L")
        }
        if (ok:=FindText(X, Y, 550-150000, 423-150000, 550+150000, 423+150000, 0, 0, C195)) {
            FindText().Click(X, Y, "L")
        }
        if (ok:=FindText(X, Y, 387-150000, 493-150000, 387+150000, 493+150000, 0, 0, OBS)) {
            FindText().Click(X, Y+19, "L")
        }
        Send,+{Tab}{Enter 2}{Sleep 10}
        if (ok:=FindText(X, Y, 1469, 81, 1919, 406, 0, 0, Lupa)) {
            FindText().Click(X-200, Y, "L")
        }
    Return

;Ir para Itens a partir da pesquisa
    F1::
        If (FlagItens == 0) {
            If WinActive("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
                if (ok:=FindText(X, Y, 288-150000, 423-150000, 288+150000, 423+150000, 0, 0, C170)) {
                    FindText().Click(X, Y, "L")
                    FindText().Click(X+30, Y+90, "L")
                }       
            } Else {
                MsgBox,48, Aviso, Janela principal de correção inativa.,1
            }
        } Else {
            If WinActive("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
                if (ok:=FindText(X, Y, 288-150000, 423-150000, 288+150000, 423+150000, 0, 0, C170)) {
                    FindText().Click(X, Y, "L")
                    FindText().Click(X+540, Y+64, "L")
                }
            } Else {
                MsgBox,48, Aviso, Janela principal de correção inativa.,1
            }
        }
    Return

;Ir para itens e filtrar por CST
    F1 & F2::
        If (FlagItens == 0){
            If WinActive("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
                if (ok:=FindText(X, Y, 288-150000, 423-150000, 288+150000, 423+150000, 0, 0, C170)) {
                    FindText().Click(X, Y, "L")
                    FindText().Click(X-13, Y+31, "L")
                    FindText().Click(X+3, Y+69, "L")
                }
                Send,{PgUp}{Down 8}{Enter}
            } Else {
                MsgBox,48, Aviso, Janela principal de correção inativa.,1
            }
            FlagItens := 1  
        } Else {
            If WinActive("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
                if (ok:=FindText(X, Y, 288-150000, 423-150000, 288+150000, 423+150000, 0, 0, C170)) {
                    FindText().Click(X, Y, "L")
                    FindText().Click(X+30, Y+90, "L")
                }
            } Else {
                MsgBox,48, Aviso, Janela principal de correção inativa.,1
            }
        }
    Return

;Ir para Analitico pós validaçao
    F2::
        if (ok:=FindText(X, Y, 0, 0, 1919, 1079, 0, 0, C190)) {
            FindText().Click(X, Y, "L")
            FindText().Click(X, Y+90, "L")
        }
    Return

;Ir para Obs e alterar codigo da observação.
    F3::
        if (FlagEstado == 0) {
            if (ok:=FindText(X, Y, 550-150000, 423-150000, 550+150000, 423+150000, 0, 0, C195)) {
                FindText().Click(X, Y, "L")
                FindText().Click(X, Y+90, "L")
            }
            Send,{Click 2}{Sleep 20}0{Enter}OBSERVACAO PARA CFOP 1403{Enter 5}
        } Else {
            if (ok:=FindText(X, Y, 550-150000, 423-150000, 550+150000, 423+150000, 0, 0, C195)) {
                FindText().Click(X, Y, "L")
                FindText().Click(X, Y+90, "L")
            }
            Send,{Click 2}{Sleep 20}0{Enter}OBSERVACAO PARA CFOP 2403{Enter 5}
        }
    Return

;Alterar valor da observação
    F4::
        if (FlagEstado == 0) {
            if (ok:=FindText(X, Y, 359-150000, 653-150000, 359+150000, 653+150000, 0, 0, C197)) {
                FindText().Click(X, Y+100, "L")
            }
            Send,{Click 2}{Sleep 20}{Tab 2}1403{Enter 9}{Sleep 20}
            FindText().Click(X, Y+90, "L")
            Send,{Click 2}{Sleep 20}{Tab 2}1403{Tab 6}0{Enter}+{Tab}
        } Else {
            if (ok:=FindText(X, Y, 359-150000, 653-150000, 359+150000, 653+150000, 0, 0, C197)) {
                FindText().Click(X, Y+100, "L")
            }
            Send,{Click 2}{Sleep 20}{Tab 2}2403{Enter 9}{Sleep 20}
            FindText().Click(X, Y+90, "L")
            Send,{Click 2}{Sleep 20}{Tab 2}2403{Tab 6}0{Enter}+{Tab}            
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
            if (ok:=FindText(X, Y, 5, 549, 1919, 1029, 0, 0, X)) {
                FindText().Click(X, Y, "L")
            }
        Return

        a::Right
        Return 
        +a::Send,{Right 14}
        Return

        d::Left
        Return
        +d::Send,{Left 14}
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
    if (ok:=FindText(X, Y, 952-150000, 528-150000, 952+150000, 528+150000, 0, 0, BaseCalcC170)) {
        FindText().Click(X+125, Y-24, "L")
    }
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
                       