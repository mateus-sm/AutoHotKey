#SingleInstance Force
#Include <UIA>
#Include <matFunctionsV2>
#Include <FindTextV2>
#Include <AccV2>
TraySetIcon("Shell32.dll","55")

SetTitleMatchMode 2


F1 & Space:: {
	A_Clipboard := ""
    Send "^a^a^c^c"
    ClipWait

    sampleString := A_Clipboard

	;MsgBox sampleString

    ;https://www.autohotkey.com/docs/v2/misc/RegEx-QuickRef.htm
    ;regexPattern := "CNPJ:\s([^`n]*)"
    Global CNPJ := RegExFindValue(sampleString, "CNPJ:\s([^`r`n]*)")
    ;MsgBox "Valor do campo 'CNPJ': " . CNPJ, "Sucesso", 64
    Global IE := RegExFindValue(sampleString, "IE:\s([^`r`n]*)")
    Global IE := StrReplace(IE, ".", "")
    ;MsgBox "Valor do campo 'IE': " . IE, "Sucesso", 64
    Global NomeEmpresarial := RegExFindValue(sampleString, "Nome Empresarial:\s([^`r`n]*)")
    ;MsgBox "Valor do campo 'Nome': " . NomeEmpresarial, "Sucesso", 64
    Global Logradouro := RegExFindValue(sampleString, "Logradouro:\s([^`r`n]*)")
    ;MsgBox "Valor do campo 'Logradouro': " . Logradouro, "Sucesso", 64
    Global Numero := RegExFindValue(sampleString, "Nº:\s([^\s]*)")
    ;MsgBox "Valor do campo 'Numero': " . Numero, "Sucesso", 64
    Global Complemento := RegExFindValue(sampleString, "Complemento:\s([^`r`n]*)")
    ;MsgBox "Valor do campo 'Complemento': " . Complemento, "Sucesso", 64
    Global Bairro := RegExFindValue(sampleString, "Bairro:\s([^`r`n]*)")
    ;MsgBox "Valor do campo 'bairro': " . Bairro, "Sucesso", 64
    Global MunicipioAlvo := RegExFindValue(sampleString, "Município:\s([^\t]*)")
    ;MsgBox "Valor do campo 'municipio': " . MunicipioAlvo, "Sucesso", 64

    MsgBox ("CNPJ:`t`t" CNPJ "`nIE:`t`t" IE "`nNome:`t`t" NomeEmpresarial "`nLogradouro:`t" Logradouro "`nNumero:`t`t" Numero "`nComplemento:`t" Complemento "`nBairro:`t`t" Bairro "`nMunicipio:`t" MunicipioAlvo), "Itens"

    ;Verifica se a pasta de municipios existe
    filePath := A_ScriptDir '\CidadeSemAcentos.txt'
    If !FileExist(filePath)
    MsgBox 'File not found.`n`n' filePath, 'Error', 48

    ;Atribui a pasta toda a string 
    Municipios := FileRead(filePath)

    ;Cria o regex para pegar o municipio em especifico
    RegEx := "i)([0-9]+)\|" MunicipioAlvo ""

    Global CodMunicipio := RegExFindValue(Municipios, RegEx)
    ;MsgBox "Valor do Codigo do Municipio': " . CodMunicipio, "Sucesso", 64
   
    Str := Format("case `"Nome`": CriarEmpresa(`"{1}`", `"{2}`", `"{3}`", `"{4}`", `"{5}`", `"{6}`", `"{7}`", `"{8}`")", NomeEmpresarial, CNPJ, IE, CodMunicipio, Logradouro, Numero, Complemento, Bairro)
    A_Clipboard := StrReplace(A_Clipboard, sampleString, Str)

    Click
}

F1:: {
    Send CNPJ
}
F2:: {
    Send IE
}
F3:: {
    Send NomeEmpresarial
}
F4:: {
    Send Logradouro
}
F5:: {
    Send Numero
}
F6:: {
    Send Complemento
}
F7:: {
    Send Bairro
}
F8:: {
    Send MunicipioAlvo
}

;Secretaria da Fazenda
;Estado de São Paulo
;Consulta Pública ao Cadastro ICMS	Cadastro de Contribuintes de ICMS - Cadesp
;Fechar
 	
;Código de controle da consulta: 951d4e31-707d-4ade-a2e5-5c9b2f203a28

 

;Estabelecimento
 
;IE:	108.383.949.112
;CNPJ:	02.558.157/0001-62
;Nome Empresarial:	TELEFONICA BRASIL S.A.
;Nome Fantasia:	
;Natureza Jurídica:	Sociedade Anônima Aberta
 
;Endereço
 
;Logradouro:	AVENIDA ENGENHEIRO LUIZ CARLOS BERRINI
;Nº:	1376	Complemento:
;CEP:	04.571-936	Bairro: CIDADE MONCOES
;Município:	SAO PAULO	UF: SP
 
;Informações Complementares
 
;Situação Cadastral:	Ativo	Data da Situação Cadastral: 05/08/1970
;Ocorrência Fiscal:	Ativa	Posto Fiscal: PFC-10 - BUTANTÃ
;Regime de Apuração:	NORMAL - REGIME PERIÓDICO DE APURAÇÃO	
;Atividades Econômicas:	Serviços de telefonia fixa comutada - STFC
 
;Informações NF-e
 
;Data de Credenciamento como emissor de NF-e:	20/09/2010
;Indicador de Obrigatoriedade de NF-e:	Obrigatoriedade Total
;Data de Início da Obrigatoriedade de NF-e:	01/12/2010
 
 

 	
;Observação:	Os dados acima estão baseados em informações fornecidas pelos próprios contribuintes cadastrados. Não valem como certidão de sua efetiva existência de fato e de direito, não são oponíveis à Fazenda e nem excluem a responsabilidade tributária derivada de operações com eles ajustadas.	
 
;Versão: 4.29.0
;Secretaria da Fazenda do Estado de São Paulo