#Requires AutoHotkey v2.0
#SingleInstance

; CapsLock: toggle between VSCode and Godot
#HotIf WinActive("Visual Studio Code")
CapsLock::WinActivate("Godot Engine")

#HotIf WinActive("Godot Engine")
CapsLock::WinActivate("Visual Studio Code")

; F5: from VSCode switch to Godot and "Run Project (F5)"
#HotIf WinActive("Visual Studio Code")
F5::
{
    WinActivate("Godot Engine")
    Send "{F5}"
}

; F6: from VSCode switch to Godot and "Run Current Scene (F6)
#HotIf WinActive("Visual Studio Code")
F6::
{
    WinActivate("Godot Engine")
    Send "{F6}"
}
