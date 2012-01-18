; ##############################################################################
;		Einstellungsverwaltung
; ##############################################################################

#include <Array.au3>

Global $__settings_content

Func _readSettings($filename)
	$__settings_content = ObjCreate("System.Collections.Hashtable")
	Local $filecontent = FileRead($filename)
	If @error Then Return False
	ConsoleWrite($filecontent & @CRLF)

	Local $array, $key, $value, $nOffset = 0
	While 1
		$array = StringRegExp($filecontent, "(?m)^\s*((""([^""\n]*)"")|('([^'\n]*)')|([^#;/%].*?))\s*[:>|=]\s*((""([^""]*|\n*)"")|('([^'\n]*|\n*)')|([^\n]*))", 1, $nOffset)

		If @error = 0 Then
			$nOffset = @extended
		Else
			ExitLoop
		EndIf

		if $array[2] <> "" Then $key = $array[2]
		if $array[4] <> "" Then $key = $array[4]
		if $array[5] <> "" Then $key = $array[5]
		$key = StringLower($key)
		if UBound($array) > 11 and $array[11] <> "" Then $value = $array[11]
		if UBound($array) > 10 and $array[10] <> "" Then $value = $array[10]
		if $array[8] <> "" Then $value = $array[8]

		If $__settings_content.Contains($key) Then $__settings_content.remove($key)
		$__settings_content.add($key, $value)
	WEnd
	Return True
EndFunc   ;==>_readSettings

Func _debugSettings()

EndFunc   ;==>_debugSettings

Func _getBooleanSetting($name, $default = False)
	Local $nameInternal = StringLower($name)
	If $__settings_content.Contains($nameInternal) Then
		If $__settings_content($nameInternal) = "True" Or $__settings_content($nameInternal) = "Ja" Or $__settings_content($nameInternal) == "1" Or $__settings_content($nameInternal) == "Yes" Then Return True
		Return False
	EndIf
	Return $default
EndFunc   ;==>_getBooleanSetting

Func _getStringSetting($name, $default = "")
	Local $nameInternal = StringLower($name)
	If $__settings_content.Contains($nameInternal) Then
		Return $__settings_content($nameInternal)
	EndIf
	Return $default
EndFunc   ;==>_getStringSetting

Func _getIntegerSetting($name, $default = 0)
	Local $nameInternal = StringLower($name)
	If $__settings_content.Contains($nameInternal) Then
		Return Int($__settings_content($nameInternal))
	EndIf
	Return Int($default)
EndFunc   ;==>_getIntegerSetting


;~ _test()
Func _test()
	_readSettings(@ScriptDir & "\Einstellungen.txt")
	_debugSettings()
	ConsoleWrite('TestBool: ' & _getBooleanSetting('testbool') & @CRLF)
	ConsoleWrite('TestStr: ' & _getStringSetting('TestStr') & @CRLF)
	ConsoleWrite('TestInt: ' & _getIntegerSetting('TestINT') & @CRLF)
	ConsoleWrite('Übergangs-Test: ' & _getStringSetting('Übergangs-Test') & @CRLF)
EndFunc   ;==>_test
