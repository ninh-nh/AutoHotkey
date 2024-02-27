/************************************************************************
 * @description Script for JDL EKUJ5 keyboard
 * @file JDL EKUJ5.ahk
 * @author TigerFlame
 * @date 2024/02/20
 * @version 1.0
 ***********************************************************************/

#Requires AutoHotkey v2.0 ; Yêu cầu AutoHotkey phiên bản 2.0
#SingleInstance Force ; Đảm bảo chỉ có 1 instance của script được chạy, bỏ qua confirm
#Include Common.ahk ; Nhúng common script

/********************************
 * REMMAPING KEYS
 *******************************/

F1::` ; Đổi F1 thành `
<^F1::Esc ; ESC
<^F2::^s ; Ctrl + s (Save)
<^F3::^f ; Ctrl + f (Find)
<^F4::^+f ; Ctrl + Shift + f (Find in file)

/**
 * Các phím nóng khi code
 */
<^F5::^!o ; Ctrl + Alt + o (Optimize import)
<^F6::^!l ; Ctrl + Alt + l (Reformat code)
<^F7::^!1 ; Ctrl + Alt + 1 (Split right)
<^F8::^!2 ; Ctrl + Alt + 2 (Split down)
<^F9::+F9 ; Shift + F9 (Debug)
<^F10::^!3 ; Ctrl + Alt + 3 (Step over debug)
<^F11::^!4 ; Ctrl + Alt + 4 (Resume debug)
SC070::^/ ; Ctrl + / (Line comment)
SC079::Send("/**{Enter}") ; Create block comment

>^l::DllCall("LockWorkStation") ; Đổi phím góc trên cùng bên phải thành lock screen
>^m::Media_Play_Pause ; Đổi phím FAST/Break thành tạm dừng phát media
<^CtrlBreak::!F4 ; Fn + FAT/Break thành Alt + F4 (Close app)

<+Space::^Space ; Đổi phím 1/2 Space thành Ctrl + Space
+Enter::!Enter ; Đổi phím 1/2 Enter thành Alt + Enter
SC07D::- ; Đổi phím cạnh += thành -_
RCtrl & e::BackSpace ; Đổi phím cạnh Backspace thành Ctrl + Backspace
RCtrl & g::return ; Disable phím cạnh phím p
SC073::RWin ; Đổi phím bên phải ?/ thành phím Win
RCtrl & j::Ctrl ; Đổi phím cạnh Shift phải thành Ctrl
RCtrl & f::NumLock ; Numlock có thể bấm độc lập hoặc kèm phím fn để tắt/bật
<+SC070::!z ; Đổi phím KANA thành Alt + z (Tắt/bật Unikey)
`::#v ; Đổi phím Half-width/full-width thành Win + v (Clipboard history)
<^<+SC079::#e
NumpadDiv::/ ; Đổi phím / (Đang là numpad /) thành phím /?
NumpadClear::Down ; Đổi phím số 5 bên NumPad thành Down

/**
 * Đổi phím Tab thành Num + khi NumLock đang bật
 */
#HotIf GetKeyState("NumLock", "T")
Tab::NumpadAdd
#HotIf

>^BS::Volume_Mute ; Gán Fn + PgDn thành Mute
>^-::Volume_Up ; Gán Fn + Up thành Volume up
>^=::Volume_Down ; Gán Fn + Down thành Volume down

/**
 * Chạy ứng dụng
*/
<^<!<#F1::Run("D:\APP\WinStoreAppShortcut\Mail")
<^<!<#F2::Run("C:\Program Files\Google\Chrome\Application\chrome.exe")
<^<!<#F3::Run("D:\APP\WinStoreAppShortcut\git-bash")
<^<!<#F4::Run("D:\APP\npp.8.4.1.portable.x64\notepad++.exe")
<^<!<#F5::Run "D:\APP\ideaIU-2023.2.win\bin\idea64.exe"
<^<!<#F6::Run("C:\Program Files\JetBrains\WebStorm 2023.2\bin\webstorm64.exe")