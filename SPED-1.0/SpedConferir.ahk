#SingleInstance Force
GroupAdd, SPED, Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital
GroupAdd, SPED, REGISTRO - C100 - ENTRADA - Nota Fiscal Eletrônica
GroupAdd, SPED, REGISTRO - C100 - ENTRADA - Nota Fiscal
GroupAdd, SPED, REGISTRO - C170 - ENTRADA - Itens
GroupAdd, SPED, REGISTRO - 0150 - Participante
GroupAdd, SPED, REGISTRO - C190 - ENTRADA - Analítico
GroupAdd, SPED, REGISTRO - 0450 - Informação Complementar
GroupAdd, SPED, REGISTRO - C500 - ENTRADA - Nota Fiscal/Conta de Energia Elétrica
GroupAdd, SPED, Sem título - Paint
GroupAdd, SPED, Pesquisar Dados Cadastrais

;Copiar itens Klaus para 1556
End::Send,^c{Sleep 20}!{Tab}{Sleep 20}{Right}{Sleep 20}^v{Sleep 20} - {Sleep 20}!{Tab}

#IfWinActive ahk_group SPED
;Pesquisa de nota
NumpadSub::Send,{Tab}{Enter}{Tab 5}{Down}+{Tab 6}

;Voltar do analitico para a Pesquisa
NumpadAdd::Send,+{Tab 15}

;Pular 5 espaços analitico
'::Send,{Tab 5}

;Completar espaço zerado
\::Send,0{Enter}0{Enter}0{Enter}0

;Deletar participante, a parir da tela de cadastro (validação)
PgUp::Send,{Esc}{Sleep 20}{Tab 12}{sleep 20}{Enter}

;Guardar tela no paint
PgDn::Send,!{Tab}{Sleep 40}{PrintScreen}{Sleep 20}!{Tab}{Sleep 20}^v{Sleep 20}!{Tab}

;Alterar varias ALQ
Home::Send,{Enter 20}
;{Sleep 20}12,00{Enter} ;Em caso de valor especifico

;Recalcula Analitico
ScrollLock::Send,!a{Sleep 40}{Enter}{Enter}{Sleep 40}{Tab 7}{Sleep 40}{Right}{Sleep 40}{Tab 8}{Sleep 40}{Down}

;Ir para Itens a partir da pesquisa
F1::Send,{Tab 7}{Sleep 40}{Left}{Sleep 40}{Tab 8}{Sleep 40}{Down}

;Ir para Analitico pós validaçao
F2::Send,{Tab 16}{Sleep 40}{Right}{Sleep 40}{Tab 8}{Sleep 40}{Down}

;Ir para Obs e alterar codigo da observação.
F3::Send,{Tab 7}{Sleep 20}{Right}{Sleep 20}{Tab 8}{Sleep 20}{Down}{Sleep 40}{Enter}{Sleep 20}0{Enter}+{Tab}35{Enter 5}

;Voltar para Pesquisa
F4::Send,+{Tab 8}{Sleep 20}{Left}{Sleep 20}+{Tab 7}

;Alterar valor da observação
F5::Send,{Tab 9}{Sleep 20}{Down}{Enter}{Sleep 20}{Tab 8}0{Enter}+{Tab}

;Voltar para Pesquisa a partir de F5
F6::Send,!s{Sleep 20}+{Tab 17}{Sleep 20}{Left}{Sleep 20}+{Tab 7}

#IfWinNotActive, Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital
;Alterar varias Bases
Insert::Send,{Enter 21}
;{Sleep 20}128,56{Enter} ;Em caso de valor especifico

;Alterar varios ICMS
Delete::Send,{Enter 22}
;{Sleep 20}19,58{Enter} ;Em caso de valor especifico