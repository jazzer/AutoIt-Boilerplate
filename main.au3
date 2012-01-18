#cs ----------------------------------------------------------------------------

	[Programmbeschreibung]

	Autor:         [name]
	Datum:		   2012

#ce ----------------------------------------------------------------------------


#Region Kompilieren
#cs ----------------------------------------------------------------------------
		Kompilierungseinstellungen
#ce ----------------------------------------------------------------------------
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=icon.ico
#AutoIt3Wrapper_outfile=Programm.exe
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_Language=1031
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#EndRegion Kompilieren


#Region Includes
#cs ----------------------------------------------------------------------------
		Includes
#ce ----------------------------------------------------------------------------

#include "udfs/logging.au3"
#include "udfs/settings.au3"
#EndRegion Includes


#Region Einstellungen
#cs ----------------------------------------------------------------------------
		Einstellungen laden, globale Variablen
#ce ----------------------------------------------------------------------------

Global $PROGRAM_NAME = ""
Global $VERSION = "0.01"

; Logging einstellen
Global $log_level = $LOG_ALL
Global $log_target = $LOG_TARGET_CONSOLE
#EndRegion Einstellungen


#Region Hotkeys
#cs ----------------------------------------------------------------------------
		Globale Hotkeys
#ce ----------------------------------------------------------------------------
#EndRegion Hotkeys


#Region GUI
#cs ----------------------------------------------------------------------------
		GUI
#ce ----------------------------------------------------------------------------
#EndRegion GUI



#Region Main
#cs ----------------------------------------------------------------------------
		Hauptschleife
#ce ----------------------------------------------------------------------------
While True
	Sleep(10000000)
WEnd
#EndRegion Main
