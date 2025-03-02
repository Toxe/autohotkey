#Requires AutoHotkey v2.0
#SingleInstance

SetTitleMatchMode("RegEx")

; Win+E: open OneCommander file manager instead of Windows Explorer
#e::Run("C:\Program Files\OneCommander\OneCommander.exe")

; disable Win+Space, Shift+Win+Space, Ctrl+Shift+Win+Space ("switch keyboard input methods")
  #Space::return
 +#Space::return
^+#Space::return

; Win+Pause: enter sleep mode
#Pause::DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)

; Everything:
; - Win+F: open Everything and search through everything
; - Alt+Space: open Everything to search for and launch executables
#f::Run("C:\Program Files\Everything 1.5a\Everything64.exe -filter Everything")
!Space::Run("C:\Program Files\Everything 1.5a\Everything64.exe -filter Executable")

; Win+P: toggle 1Password
#p::Run("C:\Users\toxe\AppData\Local\1Password\app\8\1Password.exe --toggle")

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

; ==== Monitor & Desktop ==============================================

; Use MultiMonitorTool (https://www.nirsoft.net/utils/multi_monitor_tool.html) to switch desktop resolutions.
; - Ctrl+Win+1: 1080p
; - Ctrl+Win+2: 1440p
; - Ctrl+Win+4: 4K
^#1::Run("multimonitortool /LoadConfig " . A_AppData . "\MultiMonitorTool\1080p.cfg")
^#2::Run("multimonitortool /LoadConfig " . A_AppData . "\MultiMonitorTool\1440p.cfg")
^#4::Run("multimonitortool /LoadConfig " . A_AppData . "\MultiMonitorTool\4K.cfg")

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
