#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
#MaxHotkeysPerInterval, 200
SetTitleMatchMode, 2

;~ is esc
;`::Esc

;Disable Caps lock
*CapsLock::return

#If GetKeyState("CapsLock", "p")
	;Toggle caps lock
	Tab::
	if GetKeyState("CapsLock", "t") == 0 {
		SetCapsLockState, On
	}
	else if GetKeyState("CapsLock", "t") == 1 {
		SetCapsLockState, Off
	}
	return

	;Volume Control
	WheelDown::
	Down::
	Send {Volume_Down}
	return

	WheelUp::
	Up::
	Send {Volume_Up}
	return

	`::`
	Esc::`
	
	;Arrow keys
	i::Up
	j::Left
	k::Down
	l::Right
	
	;Delete
	Backspace::Delete

	;Function Keys
	1::F1
	2::F2
	3::F3
	4::F4
	5::F5
	6::F6
	7::F7
	8::F8
	9::F9
	0::F10
	-::F11
	=::F12

	;Win + Shift + S (Screenshot)
	u::<#+S
	
	/*
	if WinActive("Microsoft Visual Studio") {
		;Comment selected
		c::
		Send ^k
		Send ^c
		return
		
		;Uncomment selected
		u::
		Send ^k
		Send ^u
		return
		
		;Format nice nice
		d::
		Send ^k
		Send ^d
		return
		}
		*/
#If


#If WinActive("- PowerPoint")
XButton1::
Send {Up}
return
		
XButton2::
Send {Down}
return
#If


#If WinActive("- SumatraPDF")
XButton1::
Send {Left}
return
		
XButton2::
Send {Right}
return
#If

;To disable the script
LShift & RShift::
RShift & LShift::
Suspend
Active := !Active
if (A_IsSuspended)
{
TrayTip, ,Hotkeys suspended, ,16
Sleep 1000
TrayTip
}
else
{
TrayTip, ,Hotkeys unsuspended, ,16
Sleep 1000
TrayTip
}
return