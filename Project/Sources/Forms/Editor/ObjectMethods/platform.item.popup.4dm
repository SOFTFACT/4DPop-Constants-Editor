C_TEXT:C284($Mnu_pop; $Txt_icon; $kTxt_template)

If (Form event code:C388=On Clicked:K2:4)
	$Mnu_pop:=Create menu:C408
	APPEND MENU ITEM:C411($Mnu_pop; "Macintosh + Windows")
	SET MENU ITEM PARAMETER:C1004($Mnu_pop; -1; "mac_win")
	APPEND MENU ITEM:C411($Mnu_pop; "Macintosh")
	SET MENU ITEM PARAMETER:C1004($Mnu_pop; -1; "mac")
	APPEND MENU ITEM:C411($Mnu_pop; "Windows")
	SET MENU ITEM PARAMETER:C1004($Mnu_pop; -1; "win")
	
	$Txt_icon:=Dynamic pop up menu:C1006($Mnu_pop)
	RELEASE MENU:C978($Mnu_pop)
	
	If (Length:C16($Txt_icon)#0)
		$kTxt_template:=";#images/{file}.png"
		OBJECT SET FORMAT:C236(*; "platform.item.popup"; Replace string:C233($kTxt_template; "{file}"; $Txt_icon))
		
		If ($Txt_icon="mac_win")
			SET LIST ITEM PARAMETER:C986(<>Lst_constants; *; "d4:includeIf"; "")
		Else 
			SET LIST ITEM PARAMETER:C986(<>Lst_constants; *; "d4:includeIf"; $Txt_icon)
		End if 
		SET LIST ITEM PARAMETER:C986(<>Lst_files; *; "modified"; True:C214)
		
	End if 
	
End if 

