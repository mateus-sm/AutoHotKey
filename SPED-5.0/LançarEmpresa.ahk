#SingleInstance Force
#Include <UIA>
#Include <matFunctionsV2>
#Include <FindTextV2>
#Include <AccV2>
TraySetIcon("Shell32.dll","26")

SetTitleMatchMode 2

SetKeyDelay 500
;Imagens de referencias para clicks
;Imagens SPED

+=:: {
	myGui := Construct()

	Construct() {
		myGui := Gui()
		myGui.Add("ListBox", "x2 y0 w210 h238 vNomeEmpresa", [
		"-=-=-=-=-=-=-=- A -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- B -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- C -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- D -=-=-=-=-=-=-=-", "Demonstracao",
		"-=-=-=-=-=-=-=- E -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- F -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- G -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- H -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- I -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- J -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- L -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- M -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- N -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- O -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- P -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- Q -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- R -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- S -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- T -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- U -=-=-=-=-=-=-=-",
		"-=-=-=-=-=-=-=- V -=-=-=-=-=-=-=-", 
		"-=-=-=-=-=-=-=- W -=-=-=-=-=-=-=-"
		])
		ButtonCriar := myGui.Add("Button", "x62 y250 w90 h30", "Criar")
		ButtonCriar.OnEvent("Click", OnEventHandler)
		myGui.OnEvent('Close', (*) => myGui.Destroy())
		myGui.Title := "Lista de Empresas"
		myGui.Show("w217 h298")
		
		OnEventHandler(*)
		{   
			oSaved := myGui.Submit() ; é preciso salvar como obejto antes de trabalhar
			NomeEmpresa := oSaved.NomeEmpresa
			Criar(NomeEmpresa)
		}
		
		return myGui
	}

}

Criar(NomeEmpresa) {
    
    switch NomeEmpresa {
	;A

	;B

	;C

	;D
		case "Demonstracao": CriarEmpresa("Demonstracao empresa LTDA", "00000000000000", "000000000000", "0000000", "Rua", "000", "Complemento", "Bairro")

	;E

	;F

	;G

	;H

	;I

	;J

	;L

	;M

	;N

	;O

	;P

	;Q

	;R
	
	;S

	;T

	;U

	;V

	;W

    }
}
