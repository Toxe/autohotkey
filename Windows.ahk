#Requires AutoHotkey v2.0
#SingleInstance

SetTitleMatchMode("RegEx")

; Win+E: switch to existing Explorer window instead of opening a new one
#HotIf WinExist("ahk_exe explorer\.exe ahk_class CabinetWClass")
#e::WinActivate
#HotIf

; disable Win+Space, Shift+Win+Space, Ctrl+Shift+Win+Space ("switch keyboard input methods")
  #Space::return
 +#Space::return
^+#Space::return

; Win+Pause: enter sleep mode
#Pause::DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)

; Win+V: Ditto, open clipboard menu
#v::
{
    Run("C:\Program Files\Ditto\Ditto.exe /Open")

    if WinWait("ahk_exe Ditto\.exe ahk_class QPasteClass", , 3)
        WinActivate
    else
        MsgBox("Unable to show Ditto clipboard window.")
}

; Shift+Win+V: Ditto, paste as plain text
+#v::Run("C:\Program Files\Ditto\Ditto.exe /PlainTextPaste")

; ==== Mouse ==========================================================

; remap Mouse Button 4 to Middle Mouse Button
XButton1::MButton

; ---- Alt+Tab menu ---------------------------------------------------

; Mouse Button 5 opens the Alt+Tab menu and...
#HotIf !WinActive("Task Switching ahk_exe explorer.exe")
XButton2::Send("!^{Tab}")
#HotIf

; ...while Alt+Tab menu is open AND holding Mouse Button 5...
#HotIf WinActive("Task Switching ahk_exe explorer.exe")
; ...Mouse Wheel up/down selects previous/next program
WheelUp::Send("{Left}")
WheelDown::Send("{Right}")

; ...pressing Left Mouse Button or releasing Mouse Button 5 switches to selected program
LButton::Send("{Enter}")
XButton2 up::Send("{Enter}")
#HotIf
