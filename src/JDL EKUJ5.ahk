#Requires AutoHotkey v2.0

; Remapping keys
^F1::Esc ; ESC
^F2::^s ; Ctrl + s
^F3::^f ; Ctrl + f (Find)
^F4::^+f ; Ctrl + Shift + f (Find in file)
^F5::^!o ; Ctrl + Alt + o (Optimize import IDE)
^F6::^!l ; Ctrl + Alt + l (Reformat code IDE)
^F7::^z ; Ctrl + z
^F8::^y ; Ctrl + y

F1::`
F2::^a ; Ctrl + a
F3::^c ; Ctrl + c
F4::^v ; Ctrl + v
F5::^x ; Ctrl + x

RCtrl & l::Suspend ; Đổi phím góc trên cùng bên phải thành tạm dừng AutoHotkey
RCtrl & m::Reload ; Đổi phím FAST/Break thành load lại script

<+Space::^Space ; Đổi phím 1/2SP thành Ctrl + Space
+Enter::!Enter ; Đổi phím 1/2 Enter thành Alt + Enter
SC073::RWin ; Đổi phím bên phải ?/ thành phím Win
SC07D::SC00C ; Đổi phím cạnh += thành -_
RCtrl & e::BackSpace ; Đổi phím cạnh Backspace thành Ctrl + Backspace
RCtrl & g::return ; Disable phím cạnh phím p
RCtrl & j::Ctrl ; Đổi phím cạnh Shift phải thành Ctrl
`::#v ; Đổi phím Half-width/full-width thành Win + v

; Run app
#!^F1::#1
#!^F2::Run "C:\Program Files\Google\Chrome\Application\chrome.exe"
#!^F3::Run "C:\Program Files\Git\git-bash.exe"
#!^F4::Run "D:\APP\ideaIU-2023.2.win\bin\idea64.exe"
#!^F5::Run "C:\Program Files\JetBrains\WebStorm 2023.2\bin\webstorm64.exe"
#!^F6::Run "D:\APP\npp.8.4.1.portable.x64\notepad++.exe"