#Requires AutoHotkey v2.0
#SingleInstance

SetTitleMatchMode("RegEx")

obsidian_window := "- Vault - Obsidian ahk_exe Obsidian\.exe ahk_class Chrome_WidgetWin_1"

; Win+O: switch to Obsidian
#HotIf WinExist(obsidian_window)
#o::WinActivate
#HotIf
