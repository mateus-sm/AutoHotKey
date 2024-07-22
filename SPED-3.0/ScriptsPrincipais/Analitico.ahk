#Include <matFunctions>
#Include <FindText>
#SingleInstance Force
Menu, Tray, Icon, pifmgr.dll, 3

GroupAdd, SPED, Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital
GroupAdd, SPED, REGISTRO - C100 - ENTRADA - Nota Fiscal Eletrônica
GroupAdd, SPED, REGISTRO - C100 - ENTRADA - Nota Fiscal
GroupAdd, SPED, REGISTRO - C190 - ENTRADA - Analítico
GroupAdd, SPED, REGISTRO - C190 - SAIDA - Analítico

SetTitleMatchMode 2
;SetKeyDelay, 5

C190:="|<C190>*137$25.C2C6AX4YY2W+G0FB908yYU42GNW997V738|<C190-2>*152$25.C2C6AX4YY2W+G0FB908yYU42GNW997V738"
IconeAnalitico:="|<IconeAnalitico>*197$14.0U0Q07U3s0q0Bk6A1zUzsA770lUCs1g0T03U"
Item1Analitico:="|<Item1Analitico>*138$32.000000wyD7UE84N48222F20UUYEUD8948222S20UUY0E84N03m0sE000002"

#IfWinActive ahk_group SPED

;Testar array
;+p::
;    Loop % array.Length()
;        MsgBox % array[A_Index]
;Return

;Copia CST, ALQ e Valor total de um item do analitico, para que possa ser restaurado depois de ser recalculado 
PgUp::
    NumCasas := 0
    If ClickOnImage(C190, 0, 0, "L", "C190", X, Y) {
        FindText().Click(X, Y + 90, "L")

        ;InputBox, NumCasas, Itens Analitico, Quantos CSTs deseja guardar?:, , 300, 130
        ;IfEqual, ErrorLevel, 1, Return
        ;vet_CST_1 := []
        TrayCST := ""
        TrayALQ := ""
        TrayTOTAL := ""

        while True {
        ;loop %NumCasas% {
            MsgBox, 4, Guardar Valores., Gostaria de copiar o Valor do CST atual?`n`nUltimos valores guardados:`nCST:`t%TrayCST%`nALQ:`t%TrayALQ%`nTOTAL:`t%TrayTOTAL%
            IfMsgBox No
                return
            
            if (NumCasas == 0) {
                vet_CST_1 := []
            }

            Send,{Enter}{Sleep 20}^a{Sleep 20}^c^c
            vet_CST_1.Push(Clipboard)
            TrayCST := Clipboard
            len := StrLen(TrayCST)
            if (len > 3 || len < 3) {
                Sair()
            }

            Send,{Tab 4}{Sleep 20}^c^c
            vet_CST_1.Push(Clipboard)
            TrayALQ := Clipboard
            len := StrLen(TrayALQ)
            if (len > 2) {
                Sair()
            }
            
            Send,{Tab}{Sleep 20}^c^c
            vet_CST_1.Push(Clipboard)
            TrayTOTAL := StrReplace(Clipboard, ",", ".")
            
            Send,{Sleep 10}!s{Sleep 20}{Down}{Sleep 10}
            NumCasas += 1
        }

        FindText().Click(X, Y + 90, "L")
    }
Return

;Restaura os valores armazenados
+PgUp::
    loop %NumCasas% {
        ;Perguntar o CST para usar como referencia de onde achar os valores no array
        InputBox, CSTAtual, CST Atual, Digite o CST atual a ser restaurado:, , 300, 130
        IfEqual, ErrorLevel, 1, Return

        ;Verificar se só tem uma copia do CST buscado
        flagCST := 0
        for index, value in vet_CST_1 {
            if (value == CSTAtual) {

                ;Verifica se o valor encontrado é do tamanho de um CST
                len := StrLen(value)
                if (len == 3) {
                    flagCST := flagCST + 1
                }

            }
        }

        ;Se tiver mais que uma copia perguntar ALQ para buscar corretamente
        if (flagCST > 1) {
            InputBox, ALQAtual, Aliquota Atual, Digite a Aliquota do CST atual a ser restaurado:, , 300, 150
            IfEqual, ErrorLevel, 1, Return
        }

        ;Se tiver uma copia do CST fazer busca apenas com CST
        if (flagCST == 1) {
            ;Encontrar a posição onde o Valor total do CST esta
            for index, value in vet_CST_1 {
                ;Encontra o CST
                if (value == CSTAtual) {
                    
                    ;Verifica se o valor encontrado é do tamanho de um CST
                    len := StrLen(value)
                    if (len == 3) {
                        ;O valor total do CST sera duas casas após o CST
                        pos := index + 2
                    }
                    
                }
            }
        } else {
            ;Encontrar a posição onde o Valor total do CST esta
            for index, value in vet_CST_1 {
                ;Encontra o CST
                if (value == CSTAtual) {
                    ;verifica se a ALQ daquele CST é a procurada
                    if (vet_CST_1[index + 1] == ALQAtual){
                        ;O valor total do CST sera duas casas após o CST
                        pos := index + 2
                    }
                }
            }
        }


        ;Entrar e enviar o valor total do CST que foi passado
        Send,{Enter}{Sleep 10}
        WinWaitActive, REGISTRO - C190, ,2
        if ErrorLevel {
            MsgBox, 48, Aviso, Janela de preenchimento do CST inativa.,1
            Return
        } else {
            Send,{Tab 5}{Sleep 5}
            Send, % vet_CST_1[pos]
            Send,{Tab}
        }

        ;Se o CST for 020 calcula valor nao tributado, caso contrario zera
        if (CSTAtual == 020) {
            SetFormat, float, 0.2
            Send,+{Tab}^c^c
            op1 := StrReplace(Clipboard, ",", ".")
            Send,{Enter}^c^c
            op2 := StrReplace(Clipboard, ",", ".")
            diff := op1 - op2
            diff := StrReplace(diff, ".", ",")
            Send,{Tab 4}{Sleep 5}%diff%{Tab}{Sleep 5}!s{Sleep 10}{Down}
        } else {
            Send,{Tab 4}{Sleep 5}0{Tab}{Sleep 5}!s{Sleep 10}{Down}
        }
    }
Return


;Testar recuperador automatico
NumLock::
    NumCasas := 0
    If ClickOnImage(C190, 0, 0, "L", "C190", X, Y) {
        FindText().Click(X, Y + 90, "L")

        ;InputBox, NumCasas, Itens Analitico, Quantos CSTs deseja guardar?, , 300, 130
        ;IfEqual, ErrorLevel, 1, Return
        ;If (NumCasas == "" || NumCasas == 0)
            ;Return
        vet_CST_1 := []
        vet_CST_2 := []
        flag0 := ""
        flag1 := ""
        flag2 := ""

        while True {
        ;loop %NumCasas% {
            ;MsgBox, 4, Guardar Valores., Gostaria de copiar o Valor do CST atual?
            ;IfMsgBox No
            ;    return
            
            ;if (NumCasas == 0) {
            ;    vet_CST_2 := []
            ;}

            
            Send,{Enter}{Sleep 15}^a{Sleep 10}^c^c
            vet_CST_2.Push(Clipboard)
            vet_CST_1.Push(Clipboard)
            TrayCST := Clipboard
            len := StrLen(TrayCST)
            if (len > 3 || len < 3) {
                Sair()
            }

            Send,{Tab 4}{Sleep 15}^c^c
            vet_CST_2.Push(Clipboard)
            vet_CST_1.Push(Clipboard)
            TrayALQ := Clipboard
            len := StrLen(TrayALQ)
            if (len > 2) {
                Sair()
            }

            flag := 0
            Send,{Tab}{Sleep 15}^c^c
            vet_CST_2.Push(Clipboard)
            vet_CST_1.Push(Clipboard)
            TrayTOTAL := StrReplace(Clipboard, ",", ".")
            if TrayTOTAL is not float
                flag := 1
            
            ;Condição de parada, ve se tudo copiado é igual aos ultimos valores copiados
            if (flag0 == TrayCST and flag1 == TrayALQ and flag2 == TrayTOTAL) {
                loop 3 {
                    vet_CST_2.Pop()
                    vet_CST_1.Pop()
                }
                Send,{Sleep 10}!s{Sleep 15}{Down}{Sleep 10}
                Break
            } else {
                flag0 := TrayCST
                flag1 := TrayALQ
                flag2 := TrayTOTAL
            }
            
            Send,{Sleep 10}!s{Sleep 15}{Down}{Sleep 10}
            NumCasas += 1

            if (flag == 1) {
                MsgBox, 4, Confirmar Valores., Confirma o Valor do CST atual?`n`nValores guardados:`nCST:`t%TrayCST%`nALQ:`t%TrayALQ%`nTOTAL:`t%TrayTOTAL%
                IfMsgBox No
                    return
            }

        }
    }


    ;Recalcular analitico
    If (ExistActivate("Sped Fiscal - EFD ICMS/IPI")
     and ClickOnImage(IconeAnalitico, 0, 0, "L", "Icone Analitico", X, Y)) {
        Send,{Sleep 40}{Enter}{Enter}{Sleep 40}
        if ClickOnImage(C190, 0, 0, "L", "C190", X, Y) {
            Sleep, 40
            ClickOnImage(Item1Analitico, 90, 20, "L", "Item 1 Analitico", X, Y)
        }
    }

    loop %NumCasas% {
        aux := 999
        ;achar menor CST
        for index, value in vet_CST_2 {
            ;verifica se o valor tem 3 de tamanho para filtrara os CSTs
            len := StrLen(value)
            if (len == 3) {

                if (value < aux) {
                    menorCST := value
                    aux := value
                    pos := index + 2
                }

            }
        }

        ;Verificar se só tem uma copia do CST encontrado
        flagCST := 0
        for index, value in vet_CST_2 {
            if (value == menorCST) {

                ;Verifica se o valor encontrado é do tamanho de um CST
                len := StrLen(value)
                if (len == 3) {
                    flagCST := flagCST + 1
                }

            }
        }

        if (flagCST > 1) {
            ;Se tiver mais que uma copia, achar a copia com ALQ menor
            aux := 99
            for index, value in vet_CST_2 {
                if (value == menorCST) {

                    ;Verifica se o valor encontrado é do tamanho de um CST
                    len := StrLen(value)
                    if (len == 3) {

                        if (vet_CST_2[index + 1] < aux) {
                            menorALQ := vet_CST_2[index + 1]
                            aux := vet_CST_2[index + 1]
                            pos := index + 2
                        }

                    }

                }
            }
        } else {
            ;Se não tiver mais que uma copia achar a pos apenas com CST
            for index, value in vet_CST_2 {
                ;Encontra o CST
                if (value == menorCST) {
                    
                    ;Verifica se o valor encontrado é do tamanho de um CST
                    len := StrLen(value)
                    if (len == 3) {
                        ;O valor total do CST sera duas casas após o CST
                        pos := index + 2
                    }
                    
                }
            }
        }

        ;Entrar e enviar o valor total do CST que foi passado
        Send,{Enter}{Sleep 10}
        if WinActive("REGISTRO - C190") {
            Send,{Tab 5}{Sleep 10}
            Send, % vet_CST_2[pos]
            Send,{Tab}{Sleep 5}
        } else {
            MsgBox, 48, Aviso, Janela de preenchimento do CST inativa.,1
            Exit
        }

        ;Se o CST for 020 calcula valor nao tributado, caso contrario zera
        if (menorCST == 020) {
            SetFormat, float, 0.2
            Send,+{Tab}^c^c
            op1 := StrReplace(Clipboard, ",", ".")
            Send,{Enter}^c^c
            op2 := StrReplace(Clipboard, ",", ".")
            diff := op1 - op2
            diff := StrReplace(diff, ".", ",")
            Send,{Tab 4}{Sleep 5}%diff%{Sleep 5}{Tab}{Sleep 5}!s{Sleep 10}{Down}
        } else {
            Send,{Tab 4}{Sleep 5}0{Tab}{Sleep 5}!s{Sleep 10}{Down}
        }

        loop 3 {
            vet_CST_2.RemoveAt(pos)
            pos := pos - 1
        }
    }
Return

Sair() {
    Send,{Esc 2}
    Exit
}
