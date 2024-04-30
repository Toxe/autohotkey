#Requires AutoHotkey v2.0
#SingleInstance

SetTitleMatchMode("RegEx")

obsidian_window := "- Vault - Obsidian ahk_exe Obsidian\.exe ahk_class Chrome_WidgetWin_1"

; Win+O: switch to Obsidian
#HotIf WinExist(obsidian_window)
#o::WinActivate
#HotIf

; ---- Ctrl+K chords ----------------------------
ctrl_k_chord_pressed := false

set_ctrl_k_chord_pressed(pressed)
{
    global ctrl_k_chord_pressed
    ctrl_k_chord_pressed := pressed
}

#HotIf WinActive(obsidian_window) and !ctrl_k_chord_pressed
^K::set_ctrl_k_chord_pressed(true)
#HotIf

#HotIf WinActive(obsidian_window) and ctrl_k_chord_pressed
LCtrl UP::set_ctrl_k_chord_pressed(false)
#HotIf

; Ctrl+K, Ctrl+D --> Ctrl+Alt+L (Lint current file)
#HotIf WinActive(obsidian_window) and ctrl_k_chord_pressed
^D::
{
    Send("^!l")
    set_ctrl_k_chord_pressed(false)
}
#HotIf
