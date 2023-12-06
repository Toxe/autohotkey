#Requires AutoHotkey v2.0
#SingleInstance

; Win+E: switch to existing Explorer window instead of opening a new one
#HotIf WinExist("ahk_exe explorer.exe ahk_class CabinetWClass")
#e::WinActivate
