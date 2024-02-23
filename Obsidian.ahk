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

#HotIf WinActive(obsidian_window) and !ctrl_k_chord_pressed
^K::
{
  global ctrl_k_chord_pressed
  ctrl_k_chord_pressed := true
}
#HotIf

; Ctrl+K, Ctrl+D --> Ctrl+Alt+L (Lint current file)
#HotIf WinActive(obsidian_window) and ctrl_k_chord_pressed
^D::
{
  global ctrl_k_chord_pressed
  ctrl_k_chord_pressed := false
  Send("^!l")
}
#HotIf

#HotIf WinActive(obsidian_window) and ctrl_k_chord_pressed
LCtrl UP::
{
  global ctrl_k_chord_pressed
  ctrl_k_chord_pressed := false
}
#HotIf
