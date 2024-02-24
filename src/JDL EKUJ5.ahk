#Requires AutoHotkey v2.0
#SingleInstance Force ; Đảm bảo chỉ có 1 instance của script được chạy, bỏ qua confirm

; Remapping keys
^F1::Esc ; ESC
^F2::^s ; Ctrl + s (Save)
^F3::^f ; Ctrl + f (Find)
^F4::^+f ; Ctrl + Shift + f (Find in file)
^F5::^!o ; Ctrl + Alt + o (Optimize import IDE)
^F6::^!l ; Ctrl + Alt + l (Reformat code IDE)
^F7::^!7 ; Ctrl + Alt + 7 (Split right IDE)
^F8::^!8 ; Ctrl + Alt + 8 (Split down IDE)
^F9::+F9 ; Shift + F9 (Debug IDE)
^F10::^!9 ; Ctrl + Alt + 9 (Step over debug IDE)
^F11:: ^!0 ; Ctrl + Alt + 0 (Resume debug IDE)

F1::` ; Đổi F1 thành `
F2::^a ; Ctrl + a (Select All)
F3::^Ins ; Ctrl + Insert (Copy)
F4::+Ins ; Shift + Insert (Paste)
F5::#v ; Win + v (Clipboard history)
F6::^x ; Ctrl + x (Cut)
F7::^z ; Ctrl + z (Undo)
F8::^y ; Ctrl + y (Redo)

/*
    Mở browser hoặc explorer đoạn text được bôi đen
    Nếu không thể mở thì tìm kiếm đoạn text trên google
*/
F9::
{
    try {
        Send "^c" ; Copy
        Sleep 50 ; Chờ lệnh copy xử lý
        CurrentClipboard := A_Clipboard ; Gán clipboard vào biến
        if (DllCall("IsClipboardFormatAvailable", "uint", 1)) ; Clipboard là text
        {
            if (SubStr(CurrentClipboard, 1, 2) == "\\") ; Không xử lý nếu text bắt đầu bằng \\
                return
            else if (RegExMatch(CurrentClipboard, "^[a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)")) ; URL không bắt đầu bằng http hoặc https hoặc www.
                Run "http://" . CurrentClipboard
            else ; AutoHotkey xử lý mặc định
                Run CurrentClipboard
        } else ; Không xử lý những đối tượng được copy không phải text
            return
    } catch as e { ; Nếu không xử lý được thì tìm kiếm trên google
        Run "http://google.com/search?q=" . CurrentClipboard
    }
}

RCtrl & l::DllCall("LockWorkStation") ; Đổi phím góc trên cùng bên phải thành lock screen
RCtrl & m::Suspend ; Đổi phím FAST/Break thành tạm dừng AutoHotkey

<+Space::^Space ; Đổi phím 1/2 Space thành Ctrl + Space
+Enter::!Enter ; Đổi phím 1/2 Enter thành Alt + Enter
SC073::RWin ; Đổi phím bên phải ?/ thành phím Win
SC07D::SC00C ; Đổi phím cạnh += thành -_
RCtrl & e::BackSpace ; Đổi phím cạnh Backspace thành Ctrl + Backspace
RCtrl & g::return ; Disable phím cạnh phím p
RCtrl & j::Ctrl ; Đổi phím cạnh Shift phải thành Ctrl
`::!z ; Đổi phím Half-width/full-width thành Alt + z (Tắt/bật Unikey)

; Run app
#!^F1::Run "D:\APP\WinStoreAppShortcut\Mail"
#!^F2::Run "C:\Program Files\Google\Chrome\Application\chrome.exe"
#!^F3::Run "D:\APP\WinStoreAppShortcut\git-bash"
#!^F4::Run "D:\APP\npp.8.4.1.portable.x64\notepad++.exe"
#!^F5::Run "D:\APP\ideaIU-2023.2.win\bin\idea64.exe"
#!^F6::Run "C:\Program Files\JetBrains\WebStorm 2023.2\bin\webstorm64.exe"