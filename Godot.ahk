#Requires AutoHotkey v2.0
#SingleInstance

SetTitleMatchMode("RegEx")

vscode_window := "Visual Studio Code ahk_exe Code\.exe"
godot_window := "Godot Engine ahk_exe Godot.*\.exe"

; CapsLock: toggle between VSCode and Godot
#HotIf WinActive(vscode_window) and WinExist(godot_window)
CapsLock::WinActivate(godot_window)
#HotIf

#HotIf WinActive(godot_window) and WinExist(vscode_window)
CapsLock::WinActivate(vscode_window)
#HotIf

; F5: - from VSCode switch to Godot and "Run Project (F5)"
;     - save open .gd file first
#HotIf WinActive(vscode_window)
F5::
{
    vscode_save_current_file()

    WinActivate(godot_window)
    Send("{F5}")
}
#HotIf

; F6: - from VSCode switch to Godot and "Run Current Scene (F6)
;     - save open .gd file first
#HotIf WinActive(vscode_window)
F6::
{
    vscode_save_current_file()

    WinActivate(godot_window)
    Send("{F6}")
}
#HotIf

; ---------------------------------------------------------------------------

; VSCode: save current file (if needed) and wait for a short moment
vscode_save_current_file()
{
    if WinActive("^● .+\.gd .* Visual Studio Code$") {
        Send("^s")
        Sleep(500)
    }
}
