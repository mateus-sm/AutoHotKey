#SingleInstance Force
#Include <FindTextV2>
#Include <matFunctionsV2>
#Include <AccV2>
#Include <UIA>
TraySetIcon("Shell32.dll","14")

GroupAdd("SPED", "Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital")
GroupAdd("SPED", "REGISTRO - C100 - ENTRADA - Nota Fiscal Eletrônica")
GroupAdd("SPED", "REGISTRO - C100 - ENTRADA - Nota Fiscal")
GroupAdd("SPED", "REGISTRO - C170 - ENTRADA - Itens")
GroupAdd("SPED", "REGISTRO - 0150 - Participante")
GroupAdd("SPED", "REGISTRO - C190 - ENTRADA - Analítico")
GroupAdd("SPED", "REGISTRO - C190 - SAIDA - Analítico")
GroupAdd("SPED", "REGISTRO - 0200 - Item/Produtos")
GroupAdd("SPED", "REGISTRO - 0450 - Informação Complementar")
GroupAdd("SPED", "REGISTRO - C500 - ENTRADA - Nota Fiscal/Conta de Energia Elétrica")
GroupAdd("SPED", "REGISTRO - C590 - ENTRADA - Registro Analítico de NF Elétrica")
GroupAdd("SPED", "Sem título - Paint")
GroupAdd("SPED", "Pesquisar Dados Cadastrais")

SetTitleMatchMode(2)

;Imagens de referencias para clicks
;Imagens SPED
Lupa:="|<Lupa>*210$18.0000z031k40M80A8Q4Ey2Fr2FX2EQ2Ey29r49X4A0860E31U0y0000U"
NFE:="|<NFE>*139$25.C2108200400031ncsl5YW4yWT1EF81g8a7XoFw"
NumeroDoc:="|<NumeroDoc>*137$72.m000000E0200mGTnbC1lkCCCeGGIYG2GEGGFeGGLoG2GEGGEaGGI4G2GEGGEaGGIYG2GEGGFWSGHYA1lUCACU"
BaseCalcC100:="|<BaseCalcC100>*135$53.200U0gaN4Ys771EAm1+EGG2UFb2IUYY50V1Yd198+1O0dG2GEKOoWU"
IconeAnalitico:="|<IconeAnalitico>*197$14.0U0Q07U3s0q0Bk6A1zUzsA770lUCs1g0T03U"
Item1Analitico:="|<Item1Analitico>*138$32.000000wyD7UE84N48222F20UUYEUD8948222S20UUY0E84N03m0sE000002"
Relatorios:="|<Relatorios>*137$50.0000000000000U000y0E402008U41000028tCtndnkWGIYYWYYDbot98dC2F1GGG+EkWGIYYWYa8nZta8aD000000002"
OBS:="|<OBS>*142$73.1000010000007YSC0siQQw/loGF8UWN8FN89W98YEF8aDcYQV4YG88YEY4+GEWG944H8/269AD8wQ1lssx37XU02000000000s"
BaseCalcC170:="|<BaseCalcC170>*137$65.E0404sV70QyU080/9aF149C1lkI3AU20GY4YUc4Nk70Z8991E8EM1V+EGG2UKU80WIUYY5ah8UW5"
C197:="|<C197>*162$35.000000Aw8xyUH8l88V42aMl2814l34E2Da68U438AFa8YEMVsFsUUU00011U0004000000U|<C197-2>*162$35.0000004s8syUH8l88V42W8V2814l04E2Da28U4284Fa8YEEVsFkUUU00010U0004000000U"
C195:="|<C195>*162$35.000000Aw8wwUH8l90V42aO12814rX4E2DVa8U433AFa8YaMVsFtsUU00011U0004000000U|<C195-2>*160$35.0000004s8swUH8l90V42W+12814rU4E2DU28U4214Fa8YUEVsFlsUU00010U0004000000U"
C170:="|<C170>*151$35.000000As9yMUH8k98V42UWF28114W4E26968U48GAFa8EYEVsEUkUU00011U0004000000U|<C170-2>*159$35.0000004s8yMUH8k98V42UWF28114U4E26928U48G4Fa8EYEVsEUkUU00010U0004000000U"
C190:="|<C190>*137$25.C2C6AX4YY2W+G0FB908yYU42GNW997V738|<C190-2>*152$25.C2C6AX4YY2W+G0FB908yYU42GNW997V738"
SetaBaixo:="|<SetaBaixo>*191$29.0004G0068Y004F8008WE00F4UH0W91y14G0k28Y1k4F8Dk8WE90F4U00W90014G0028Y004F8008WM"
Operacao:="|<Operacao>*137$28.01000040071lkCE99190YQ4Y2GEGE99190Qw38"

;Imagens Chrome
Klaus:="|<Klaus>*176$29.00000XE001AU002F00072SFCA44WEI8t4UYGG8l4gYEGBD7b00000E"

;Variaveis
Global FlagItens := ""
Global FlagEstado := ""

;OBSOLETO
    ;ClickACC(oAcc) {
    ;    oRect := Acc_Location(oAcc)
    ;    CoordMode("Mouse", "Screen")
    ;    vCurX := oRect.x + oRect.w/2
    ;    vCurY := oRect.y + oRect.h/2
    ;    MouseClick(, vCurX, vCurY)
    ;    oAcc := oRect := ""
    ;}

;Label para usar timer na notificação das flags
    RemoveToolTip:
    ToolTip()
    Return

;Comandos para Usar em qualquer instancia, dentro ou fora do SPED
;Troca o Numlock por um Backspace
    ;NumLock::BackSpace
    ;Return

;OBSOLETO - Usar cliper
    ;click & drag to select area to clip
        ;XButton1 & RButton::SCW2_ScreenClip2Win() 

    ;destroys all screen clipping windows.
        ;+Esc::SCW2_DestroyAllClipWins()

;Melhora navegaçao dos itens
;Fecha a aba aberta em baixo dos itens
    +Down:: {
        ClickOnImage(SetaBaixo, 0, 0, "L", "SetaBaixo")
    }

;Vai direto para base de calculo
    +Right:: {
        Send "{Right 11}"
    }
    
;Volta a mesma quantidade que o comando anterior
    +Left:: {
        Send "{Left 11}"
    }

;Apresenta as coordenadas do mouse
    F1 & Space:: { 
        MouseGetPos(&xpos, &ypos)
        msgResult := MsgBox("Posição do mouse = X -> " xpos " Y -> " ypos ".`nGostaria de copiar o comando click?", "Aviso", 4)
        if (msgResult = "Yes")
            A_Clipboard := "{Click " . xpos . " " . ypos . "}"
        Else
            Return
    }

;Ativa e desativa flag de estado -> FlagEstado
    +F3:: { 
        If (!FlagEstado) {
            Global FlagEstado := 1
            ToolTip "OBS fora do estado", 1115, 972
            Sleep 3000
            ToolTip
        } Else {
            Global FlagEstado := ""
            ToolTip "OBS dentro do estado", 1115, 972
            Sleep 3000
            ToolTip
        }
    } 

;Abrir e minimizar a calculadora
    SC07E:: {
        If WinExist("Calc") {
            If WinActive("Calc") {
                WinMinimize
            } Else {
                WinActivate()
            }
        } Else {
            Run("Calc.exe")
            WinWaitActive("ahk_exe Calc.exe")
        }
    } 

;Lança componentes principais da nota fiscal
    Ctrl & Numpad1:: {
        IB := InputBox("Digite o nome do participante:", "Nome do participante", "w300 h130"), NomePartici := IB.Value, ErrorLevel := IB.Result="OK" ? 0 : IB.Result="CANCEL" ? 1 : IB.Result="Timeout" ? 2 : "ERROR"
        if (ErrorLevel = 1)
            Return
        IB := InputBox("Digite a Serie:", "Serie", "w300 h130"), Serie := IB.Value, ErrorLevel := IB.Result="OK" ? 0 : IB.Result="CANCEL" ? 1 : IB.Result="Timeout" ? 2 : "ERROR"
        if (ErrorLevel = 1)
            Return
        IB := InputBox("Digite a Data:", "Data", "w300 h130"), Data := IB.Value, ErrorLevel := IB.Result="OK" ? 0 : IB.Result="CANCEL" ? 1 : IB.Result="Timeout" ? 2 : "ERROR"
        if (ErrorLevel = 1)
            Return
        IB := InputBox("Digite o tipo de pagamento:", "Tipo de Pagamento", "w300 h130"), TipoPag := IB.Value, ErrorLevel := IB.Result="OK" ? 0 : IB.Result="CANCEL" ? 1 : IB.Result="Timeout" ? 2 : "ERROR"
        if (ErrorLevel = 1)
            Return
        IB := InputBox("Digite o valor da NFE:", "Valor da NFE", "w300 h130"), Valor := IB.Value, ErrorLevel := IB.Result="OK" ? 0 : IB.Result="CANCEL" ? 1 : IB.Result="Timeout" ? 2 : "ERROR"
        if (ErrorLevel = 1)
            Return
        IB := InputBox("Digite o numero da NFE:", "Numero da NFE", "w300 h130"), NumNFE := IB.Value, ErrorLevel := IB.Result="OK" ? 0 : IB.Result="CANCEL" ? 1 : IB.Result="Timeout" ? 2 : "ERROR"
        if (ErrorLevel = 1)
            Return

        ExistActivate("REGISTRO - C100 - ENTRADA - Nota Fiscal")
        ClickOnImage(NumeroDoc, 434, -23, "L", "NumeroDoc")
            Sleep 20
            Send NomePartici 
            Sleeper("{Tab}", 5, 2)
            Send NumNFE 
            Sleeper("{Tab}", 5, 1)
            Send Serie 
            Sleeper("{Tab}", 5, 1)
            Send Data
            Sleeper("{Tab}", 5, 1)
            Send Data 
            Sleeper("{Tab}", 5, 1)
            Send TipoPag 
            Sleeper("{Tab}", 5, 2)
            Send "{Delete}{Sleep 5}9"
            Sleeper("{Tab}", 5, 3)
            Sleeper("0{Tab}", 5, 4)
            Send Valor 
            Sleeper("{Tab}", 5, 1)
            Send Valor "{Tab}"
            Sleeper("0{Tab}", 5, 11)
    }

;Comandos que só funcionam dentro do SPED
#HotIf WinActive("ahk_group SPED", )

;Completar espaço zerado
    \:: {
        Send "0{Enter}0{Enter}0{Enter}0"
    }

;Pular 5 espaços analitico
    ':: {
        if WinActive("REGISTRO - C190") or WinActive("Pesquisar Dados Cadastrais") {
            Send "{tab 5}"
        }
    }

;Volta para o analitico
    XButton1:: { 
        ClickOnImage(Relatorios, 0, 0, "L", "Relatorios")
            Send "{Sleep, 10}{Click, 611, 537}"
    } 

    MButton:: { 
        ClickOnImage(Relatorios, 0, 0, "L", "Relatorios")
            Send "{Sleep, 10}{Click, 611, 537}"
    }


;Pesquisa de nota
    NumpadSub:: {
        If WinActive("REGISTRO - C100 - ENTRADA") {
            ClickOnImage(NumeroDoc, 239, 0, "L", "NumeroDoc")
                Send "^a^a^c^c"
            ClickOnImage(BaseCalcC100, 239, 0, "L", "Base de Cálculo C100")
            ExistActivate(".pdf")
                Send "^f^v"

        } Else {
            ClickOnImage(Lupa, -82, 37, "L", "Lupa")
            ClickOnImage(NFE, 10, 20, "L", "NFE")
            ClickOnImage(C190, 0, 0, "L", "C190")
            ClickOnImage(Lupa, -200, 37, "L", "Caixa Pesquisa")
                Send "{PrintScreen}"
            Global FlagItens := ""
        }
    }

;Voltar do analitico para a Pesquisa
    NumpadAdd:: { 
        If WinActive("REGISTRO - C190 - ENTRADA - Analítico") {
            Send "{Tab 5}"
        } Else {
            ClickOnImage(Lupa, -200, 37, "L", "Lupa")
                Send "{Click}"
        }
    } 

;Faz subtração ou calcula icms dependendo da janela
    NumpadDiv:: {
        if WinActive("REGISTRO - C190") or WinActive("REGISTRO - C590") {
            ClickOnImage(Operacao, 158, 0, "L", "Valor da operaçao")
            ;Esvazia clip, copia e aguarda conteudo estar preenchido
            A_Clipboard := ""
            Send "^a^a^c^c"
            ClipWait
            A := StrReplace(A_Clipboard, ",", ".")

            ;Esvazia clip, copia e aguarda conteudo estar preenchido
            A_Clipboard := ""
            Sleeper("{Tab}", 5, 1)
            Send "^a^a^c^c"
            ClipWait
            B := StrReplace(A_Clipboard, ",", ".")

            Sub := A - B
            Sub := StrReplace(Sub, ".", ",")
            Sleeper("{Tab}", 10, 4)
            Send Sub "{Tab}+{Tab}"
        }
        If WinActive("REGISTRO - C170") {
            ClickOnImage(BaseCalcC170, -175, -23, "L", "ALQ")
            ;Esvazia clip, copia e aguarda conteudo estar preenchido
            A_Clipboard := ""
            Send "^a^a^c^c"
            ClipWait
            A := StrReplace(A_Clipboard, ",", ".")

            ;Esvazia clip, copia e aguarda conteudo estar preenchido
            A_Clipboard := ""
            Sleeper("{Tab}", 5, 1)
            Send "^a^a^c^c"
            ClipWait
            B := StrReplace(A_Clipboard, ",", ".")

            ICMS := (A * B) / 100
            ICMS := StrReplace(ICMS, ".", ",")
            Sleeper("{Tab}", 5, 1)
            Send ICMS
        }
    }


;Tira print da tela, guarda, recalcula analitico, entra no cfop especifico, 
;fica na posição, fec ne le itens, pesquisa nota no g5, e entra em itens
    End & ScrollLock:: {
        ;pagedown + ScrollLock 
        IB := InputBox("Digite o CFOP a ser filtrado:", "CFOP para filtrar", "w300 h130"), CFOP := IB.Value, ErrorLevel := IB.Result="OK" ? 0 : IB.Result="CANCEL" ? 1 : IB.Result="Timeout" ? 2 : "ERROR"
        if (ErrorLevel = 1)
            Return
        ;Vai para o analitico
        ClickOnImage(C190, 0, 0, "L", "C190")
        Sleep 40
        ClickOnImage(Item1Analitico, 90, 20, "L", "Item 1 Analitico")
        Global FlagItens := ""
        Sleep 80
        ;Pagedown

        ;Tira print
            Send "{PrintScreen}{Sleep 20}"
        ;continuaçao page down
        ExistActivate("Paint")
            Send("^v{Sleep 20}{AltDown}{Tab}{AltUp}")

        ;NumpadSub para reiniciar menu de itens, sem a parte de voltar para pesquisa
        ExistActivate("Sped Fiscal - EFD ICMS/IPI")

        ClickOnImage(Lupa, -200, 37, "L", "Caixa Pesquisa")
        Sleep 80
            Send "^a^a^c^c"

        ClickOnImage(Lupa, -82, 37, "L", "Lupa")
        ClickOnImage(NFE, 10, 20, "L", "NFE")

        ;F1 + F2
        ClickOnImage(C170, 0, 0, "L", "C170")
        Sleep 10
        ClickOnImage(C170, -13, 31, "L", "Lupa Itens")
        Sleep 10
        ClickOnImage(C170, 3, 69, "L", "Caixa de seleção") 
            Send "{PgUp}{Down 8}{Enter}"
        Sleep 20
        Sleeper("{Tab}", 20, 1)
            Send CFOP
        Sleeper("{Enter}", 20, 2)   
        Global FlagItens := 1       
        Sleep 80

        ;F1
        Coord := ClickOnImage(C170, 0, 0, "L", "C170")
        X := Coord.FoundX
        Y := Coord.FoundY
        FindText().Click(X + 20, Y + 145, "L")
        Sleep 80

        ;Caso CFOP for 1403 ou 2403, pula a etapa de deixar os itens com a base em evidencia
        if (CFOP == 1403 or CFOP == 2403) {

        } else {
            ;shift right
                Send "{Right 11}"
            Sleep 80
            ;shift down
            ClickOnImage(SetaBaixo, 0, 0, "L", "SetaBaixo")
            Sleep 80
        }

        ;end
        If WinExist("Itens da NF") {
            WinActivate()
            WinClose()
                Send "{Sleep 20}!n{Sleep 20}!h{Sleep 20}^v{Sleep 20}{Enter}"
        } else {
            ExistActivate("Lançamentos Fiscais")
                Send "{Sleep 20}!h{Sleep 20}^v{Sleep 20}{Enter}"
        }

        ;home
        ExistActivate("Lançamentos Fiscais")
        Sleep 10

        ;Clicar em itens G5
        PgwFEl := UIA.ElementFromHandle("Lançamentos Fiscais | ahk_exe PgwF.exe")
        PgwFEl.ElementFromPath("IYYq4/").ControlClick()

        Send("{Sleep 20}^{Enter}{Sleep 20}")

        ErrorLevel := !WinWaitActive("Itens da NF")
        PgwFEl := UIA.ElementFromHandle("Itens da NF| ahk_exe PgwF.exe")
        PgwFEl.ElementFromPath("Ys").ControlClick()
    }

;Ir para Itens a partir da pesquisa
    F1:: { 
        If (FlagItens == "") {
            ExistActivate("Sped Fiscal - EFD ICMS/IPI")
            Coord := ClickOnImage(C170, 0, 0, "L", "C170")
            X := Coord.FoundX
            Y := Coord.FoundY
            FindText().Click(X + 30, Y + 90, "L")
        } Else {
            ExistActivate("Sped Fiscal - EFD ICMS/IPI")
            Coord := ClickOnImage(C170, 0, 0, "L", "C170")
            X := Coord.FoundX
            Y := Coord.FoundY
            FindText().Click(X + 20, Y + 145, "L")
        }
    }

;Ir para Analitico pós validaçao
    F2:: {
        Coord := ClickOnImage(C190, 0, 0, "L", "C190")
        X := Coord.FoundX
        Y := Coord.FoundY
        FindText().Click(X, Y + 90, "L")
    }

    ;Ir para itens e filtrar por CST
    F1 & F2:: { 
        If (!FlagItens) {
            ActiveActivate("Sped Fiscal - EFD ICMS/IPI")
            ClickOnImage(C170, 0, 0, "L", "C170")
            Sleep 10
            ClickOnImage(C170, -13, 31, "L", "Lupa Itens")
            Sleep 10
            ClickOnImage(C170, 3, 69, "L", "Caixa de seleção") 
                Send("{PgUp}{Down 8}{Enter}")
            Global FlagItens := 1      
        } Else {
            ActiveActivate("Sped Fiscal - EFD ICMS/IPI")
            Coord := ClickOnImage(C170, 0, 0, "L", "C170")
            X := Coord.FoundX
            Y := Coord.FoundY
            FindText().Click(X + 540, Y + 64, "L")
        }
    }

;Ir para Obs e alterar codigo da observação.
    F3:: { 
        If (FlagEstado == "") {
            Coord := ClickOnImage(C195, 0, 0, "L", "C195")
            X := Coord.FoundX
            Y := Coord.FoundY
            FindText().Click(X, Y + 90, "L")
                Send "{Click 2}{Sleep 20}0{Enter}OBSERVACAO PARA CFOP 1403"
            Sleeper("{Enter}", 5, 5)
        } Else {
            Coord := ClickOnImage(C195, 0, 0, "L", "C195")
            X := Coord.FoundX
            Y := Coord.FoundY
            FindText().Click(X, Y + 90, "L")
                Send "{Click 2}{Sleep 20}0{Enter}OBSERVACAO PARA CFOP 2403"
            Sleeper("{Enter}", 5, 5)
        }
    }

;Alterar valor da observação
    F4:: { 
        If (FlagEstado == "") {
            Coord := ClickOnImage(C197, 0, 100, "L", "C197")
            X := Coord.FoundX
            Y := Coord.FoundY
                Send "{Click 2}{Sleep 40}{Tab 2}{Sleep 40}^a^a1403"
            Sleeper("{Enter}", 40, 9)
            Sleep 10
            FindText().Click(X, Y + 90, "L")
                Send "{Click 2}{Sleep 40}{Tab 2}{Sleep 40}^a^a1403"
            Sleeper("{Tab}", 40, 6)
            Send "0{Enter}+{Tab}"
        } Else {
            Coord := ClickOnImage(C197, 0, 100, "L", "C197")
            X := Coord.FoundX
            Y := Coord.FoundY
                Send "{Click 2}{Sleep 40}{Tab 2}{Sleep 40}^a^a2403"
            Sleeper("{Enter}", 40, 9)
            Sleep 10
            FindText().Click(X, Y + 90, "L")
                Send "{Click 2}{Sleep 40}{Tab 2}{Sleep 40}^a^a2403"
            Sleeper("{Tab}", 40, 6)
            Send "0{Enter}+{Tab}"
        }
    }

;Guardar tela no paint ;Só funciona v1 + 32bit
    PgDn:: {
        Send "{PrintScreen}{Sleep 20}"
        ExistActivate("Paint") 
            Send "^v{Sleep 20}"
        WinMinimize
    }

;Recalcula Analitico
    ScrollLock:: {
        ExistActivate("Sped Fiscal - EFD ICMS/IPI")
        ClickOnImage(IconeAnalitico, 0, 0, "L", "Icone Analitico")
            Send("{Sleep 40}{Enter}{Enter}{Sleep 40}")
        Sleep 200
        ClickOnImage(C190, 0, 0, "L", "C190")
        Click
        Sleep 200
        ClickOnImage(Item1Analitico, 90, 20, "L", "Item 1 Analitico")
        Global FlagItens := ""   
    }

