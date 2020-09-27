#NoEnv
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%
#MaxHotkeysPerInterval 120
Process, Priority, , H
SetTitleMatchMode 3
#installkeybdhook
SetNumLockState,On
SetNumLockState,AlwaysOn
SetScrollLockState,Off
SetScrollLockState,AlwaysOff
SetDefaultMouseSpeed, 1
return
Backspace::F13
CapsLock::Backspace
Volume_Up::
    soundset, +1
return
Volume_Down::
    soundset, -1
return
+Volume_Up::
    soundset, +20
return
+Volume_Down::
    soundset, -20
return
Volume_Mute::
    SoundSet, +1, , mute
return
F12::Media_Next
Media_Next::F12
F11::Media_Prev
F10::Media_Play_Pause
AppsKey:: return
AppsKey & Volume_Up::
    Send, ^!+{F8}
    sleep, 80
    Send, ^!+{F8}
    sleep, 80
    Send, ^!+{F8}
return
AppsKey & Volume_Down::
    Send, ^!+{F7}
    sleep, 80
    Send, ^!+{F7}
    sleep, 80
    Send, ^!+{F7}
    sleep, 80
    Send, ^!+{F7}
return
e::f
r::p
t::b
y::j
u::l
i::u
o::y
p::`;
s::r
d::s
f::t
g::g
h::m
j::n
k::e
l::i
`;::o
z::x
x::c
c::d
b::z
n::k
m::h
$*XButton2::
    Hotkey, $*XButton2 Up, XButton2up, off
    Hotkey, $*XButton2 Up, XButton2up, on
    MouseGetPos, ox, oy
    SetTimer, WatchTheMouse, 5
    movedx := 0
    movedy := 0
    pixelsMoved := 0
return
XButton2up:
    Hotkey, $*XButton2 Up, XButton2up, off
    SetTimer, WatchTheMouse, off
    If (pixelsMoved = 0)
    {
        Send {XButton2alt}
        Send {XButton2Up}
    }
return
WatchTheMouse:
    MouseGetPos, nx, ny
    movedx := movedx+nx-ox
    movedy := movedy+ny-oy
    pixelsMoved := pixelsMoved + Abs(nx-ox) + Abs(ny-oy)
    timesX := Abs(movedx) / 10
    ControlGetFocus, control, A
    Loop, %timesX%
    {
        If (movedx > 0)
        {
            SendMessage, 0x114, 1, 0, %control%, A
            movedx := movedx / 8
        }
        Else
        {
            SendMessage, 0x114, 0, 0, %control%, A
            movedx := movedx / 8
        }
    }
    timesY := Abs(movedy) / 10
    Loop, %timesY%
    {
        If (movedy > 0)
        {
            Click WheelDown
            movedy := movedy / 6
        }
        Else
        {
            Click WheelUp
            movedy := movedy / 6
        }
    }
    MouseMove ox, oy
return
RButton::Send {RButton}
RButton & XButton2::
    Send, ^w
    Sleep, 10
return
RButton & XButton1::
    Send, {PGUP}
    Sleep, 20
return
RButton & LButton::
    Send, {PGDN}
    Sleep, 20
return
RButton & MButton::
    Send, ^w
    Sleep, 200
return
RButton & WheelUp::
    Send, {PGUP}
    Sleep, 10
return
RButton & WheelDown::
    Send, {PGDN}
    Sleep, 10
return
return
SetKeyDelay 30,50
XButton2alt:
XButton2 & XButton1::
    Send, ^{PGUP}
    Sleep, 10
return
XButton2 & RButton::
return
XButton2 & LButton::
    Send, ^{PGDN}
    Sleep, 10
return
return
XButton1::Send {MButton}
XButton1 & XButton2::
    soundset, +5
return
XButton1 & LButton::
return
XButton1 & RButton::
    soundset, -5
return
return
Lwin::
    KeyWait, Lwin
Return
#If, GetKeyState("Lwin", "P")
    *e::
    run, explorer /n`,/e`,a:\working
return
return
LCtrl::
    KeyWait, LCtrl
Return
#If, GetKeyState("LCtrl", "P")
    *z::Send ^z
*x::Send ^x
*c::Send ^c
*v::Send ^v
*b::Send ^b
*n::Send ^n
*m::Send ^m
*a::Send ^a
*s::Send ^s
*d::Send ^d
*f::Send ^f
*g::Send ^g
*h::Send ^h
*j::Send ^j
*k::Send ^k
*l::Send ^l
*e::Send ^e
*r::Send ^r
*t::Send ^t
*y::Send ^y
*u::Send ^u
*i::Send ^i
*o::Send ^o
*p::Send ^p
*+z::Send ^+z
*+x::Send ^+x
*+c::Send ^+c
*+v::Send ^+v
*+b::Send ^+b
*+n::Send ^+n
*+m::Send ^+m
*+a::Send ^+a
*+s::Send ^+s
*+d::Send ^+d
*+f::Send ^+f
*+g::Send ^+g
*+h::Send ^+h
*+j::Send ^+j
*+k::Send ^+k
*+l::Send ^+l
*+e::Send ^+e
*+r::Send ^+r
*+t::Send ^+t
*+y::Send ^+y
*+u::Send ^+u
*+i::Send ^+i
*+o::Send ^+o
*+p::Send ^+p
return
Lalt::
    KeyWait, Lalt
Return
#If, GetKeyState("Lalt", "P")
    ;     *`::`
; *1::1
; *2::2
; *3::3
; *4::4
; *5::5
; *6::6
; *7::7
; *8::8
; *9::9
; *0::0
; *-::-
; *=::=
*q::Send ^{Home}
*w::Send ^{End}
*e::e
*r::r
*t::t
*y::Send {Home}
*u::Send {Up}
*i::Send {End}
; *o::MouseMove, -15,-20, 0, R
; *p::MouseMove, 0,-20, 0, R
; *[::MouseMove, 15,-20, 0, R
*]::]
*\::Capslock
*a::a
*s::Send {F2}
*d::Send {Del}
*f::f
*g::g
*h::Send {Left}
*j::Send {Down}
*k::Send {Up}
*l::Send {Right}
*`;::
CoordMode, Mouse, Screen
MouseMove, (A_ScreenWidth // 2), (A_ScreenHeight // 2)
return
*'::MouseMove, 20, 0, 0, R
*z::Send, !{F4}
*x::x
*c::LButton
*v::RButton
*b::b
*n::n
*m::m
*,::MouseMove, -15, 15, 0, R
*.::MouseMove, 0, 20, 0, R
*/::MouseMove, 15, 15, 0, R
*Space::Send {Return}
*+`::`
*+1::1
*+2::2
*+3::3
*+4::4
*+5::5
*+6::6
*+7::7
*+8::8
*+9::9
*+0::0
*+-::-
*+=::=
*+q::Send {Blind}{PgUp}
*+w::Send {Blind}{PgDn}
*+e::e
*+r::r
*+t::t
*+y::Send ^{Home}
*+u::Send {Alt Down}+{Up}{Alt Up}
*+i::Send ^{End}
; *+o::MouseMove, -215,-220, 0, R
; *+p::MouseMove, 0,-220, 0, R
; *+[::MouseMove, 215,-220, 0, R
; *+]::]
*+\::\
*+a::a
*+s::Send {F2}
*+d::Send {Blind}{Del}
*+f::f
*+g::g
*+h::Send {Alt Down}+{Left}{Alt Up}
*+j::Send {Alt Down}+{Down}{Alt Up}
*+k::Send {Alt Down}+{Up}{Alt Up}
*+l::Send {Alt Down}+{Right}{Alt Up}
*+`;::
CoordMode, Mouse, Screen
MouseMove, (A_ScreenWidth // 4), (A_ScreenHeight // 4)
return
*+'::MouseMove, 220, 0, 0, R
*+z::Send, !{F4}
*+x::x
*+c::c
*+v::v
*+b::b
*+n::n
*+m::m
*+,::MouseMove, -225, 225, 0, R
*+.::MouseMove, 0, 220, 0, R
*+/::MouseMove, 225, 225, 0, R
*+Space::Send {Return}
return
#If WinActive("ahk_class Notepad++")
    return
#If WinActive("ahk_class OpusApp") || WinActive("ahk_class XLMAIN")
    +^z::Send ^y
return
#If WinActive("ahk_class SUMATRA_PDF_FRAME") || WinActive("ahk_class MediaPlayerClassicW")
    RButton::Send {RButton}
RButton & XButton2::
    Send, !{F4}
    Sleep, 10
return
return
#If