#SingleInstance Force
GroupAdd, PARTICIPANTE, REGISTRO - 0150 - ENTRADA - Participante
GroupAdd, ITEM, REGISTRO - 0200 - ENTRADA - Item/Produtos

SetTitleMatchMode, 2

#IfWinActive ahk_group PARTICIPANTE
;Modelo de cadastro
    0 & X::
    Send,CodigoParticipante{Sleep 20}{Enter}{Sleep 20}Nome{Sleep 20}{Enter}{Sleep 20}CNPJ{Sleep 20}{Tab 2}{Sleep 20}InscriçãoEstadual{Sleep 20}{Tab 3}{Sleep 20}CodigoMunicipio{Sleep 40}{Tab 3}{Sleep 20}Logradouro{Sleep 20}{Enter}{Sleep 20}Numero{Sleep 20}{Enter}{Sleep 20}Complemento{Sleep 20}{Enter}{Sleep 20}Bairro{Enter}
    return

#IfWinActive ahk_group ITEM
;Modelo de cadastro
    0 & x::
    Send,CodigoItens{Sleep 20}{Enter}{Sleep 20}Nome{Sleep 20}{Enter 4}{Sleep 20}{CtrlDown}{Enter}{CtrlUp}{Sleep 20}{Tab 5}{Sleep 20}{Enter}{Sleep 20}CodUnidade{Sleep 20}{Enter}{Sleep 20}Unidade{Sleep 20}{Enter 2}{Sleep 20}{Tab 3}{Sleep 20}{Enter}{Sleep 20}{Tab 2}{Sleep 20}TipoItem{Sleep 20}{Enter}{Sleep 20}{Tab 9}
    return
