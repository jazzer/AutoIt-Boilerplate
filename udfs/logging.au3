#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.6.1
	Author:         Johannes Mitlmeier

#ce ----------------------------------------------------------------------------

#include-once


; ##############################################################################
;		Logging
; ##############################################################################
; Konstanten
Global Enum $LOG_ALL, $LOG_DEBUG, $LOG_WARN, $LOG_ERROR, $LOG_FIX
Global Enum $LOG_TARGET_CONSOLE, $LOG_TARGET_TRAYTIP, $LOG_TARGET_MSGBOX
; Default
$log_level = $LOG_ALL
$log_target = $LOG_TARGET_CONSOLE

Func _Log($msg_title, $msg = "", $level = $LOG_ERROR)
	; Log-Level beachten
	If $level < $log_level Then Return

	; Log-Typ beachten
	Switch $log_target
		Case $LOG_TARGET_CONSOLE
			If $msg = "" Then
				ConsoleWrite(StringFormat("%s\n\n", $msg_title))
			Else
				ConsoleWrite(StringFormat("%s: %s\n\n", $msg_title, $msg))
			EndIf
		Case $LOG_TARGET_TRAYTIP
			TrayTip($msg_title, $msg, 20)
		Case $LOG_TARGET_MSGBOX
			MsgBox(64 + 4096 + 262144, $msg_title, $msg)
	EndSwitch
EndFunc   ;==>_Log

