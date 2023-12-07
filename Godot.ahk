#Requires AutoHotkey v2.0
#SingleInstance

SetTitleMatchMode("RegEx")

vscode_window := "Visual Studio Code ahk_exe Code\.exe"
godot_window := "Godot Engine ahk_exe Godot.*\.exe"

; CapsLock: toggle between VSCode and Godot
#HotIf WinActive(vscode_window)
CapsLock::WinActivate(godot_window)

#HotIf WinActive(godot_window)
CapsLock::WinActivate(vscode_window)

; F5: from VSCode switch to Godot and "Run Project (F5)"
#HotIf WinActive(vscode_window)
F5::
{
    WinActivate(godot_window)
    Send("{F5}")
}

; F6: from VSCode switch to Godot and "Run Current Scene (F6)
#HotIf WinActive(vscode_window)
F6::
{
    WinActivate(godot_window)
    Send("{F6}")
}
