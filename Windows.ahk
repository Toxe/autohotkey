#Requires AutoHotkey v2.0
#SingleInstance

SetTitleMatchMode("RegEx")

; Win+E: switch to existing Explorer window instead of opening a new one
#HotIf WinExist("ahk_exe explorer\.exe ahk_class CabinetWClass")
#e::WinActivate
#HotIf

; Win+O: switch to Obsidian
#HotIf WinExist("- Vault - Obsidian ahk_exe Obsidian\.exe ahk_class Chrome_WidgetWin_1")
#o::WinActivate
#HotIf

; disable Win+Space, Shift+Win+Space, Ctrl+Shift+Win+Space ("switch keyboard input methods")
  #Space::return
 +#Space::return
^+#Space::return

; Win+V: open Ditto
#v::Run("C:\Program Files\Ditto\Ditto.exe /Open")
