/************************************************************************
 * @description Common script
 * @file Common.ahk
 * @author TigerFlame
 * @date 2024/02/25
 * @version 1.0
 ***********************************************************************/

#Requires AutoHotkey v2.0 ; Yêu cầu AutoHotkey phiên bản 2.0

/********************************
 * REMMAPING KEYS
 *******************************/

F2::^a ; Ctrl + a (Select All)
F3::^Ins ; Ctrl + Insert (Copy)
F4::+Ins ; Shift + Insert (Paste)
; F5::#v ; Win + v (Clipboard history)
F6::^x ; Ctrl + x (Cut)
F7::^z ; Ctrl + z (Undo)
F8::^y ; Ctrl + y (Redo)
F9::processTextInClipboard() ; Xử lý văn bản được chọn
F10::translateTextInClipboard() ; Dịch văn bản được chọn

/**
 * Điều khiển media khi đưa chuột vào thanh tác vụ
 */ 
#HotIf (mouseIsOver("ahk_class Shell_TrayWnd") || mouseIsOver("ahk_class Shell_SecondaryTrayWnd"))
WheelUp::Send("{Volume_Up}") ; Tăng âm lượng
WheelDown::Send("{Volume_Down}") ; Giảm âm lượng
MButton::Send("{Volume_Mute}") ; Tắt âm
XButton1::Send("{Media_Prev}") ; Previous track
XButton2::Send("{Media_Next}") ; Next track
#HotIf

/********************************
 * FUNCTIONS
 *******************************/

/**
 * Mở browser hoặc explorer đoạn text được bôi đen
 * Nếu không thể mở thì tìm kiếm đoạn text trên google
 */
processTextInClipboard()
{
    try {
        Send("^{Ins}") ; Copy
        Sleep(50) ; Chờ lệnh copy xử lý
        currentClipboard := A_Clipboard ; Gán clipboard vào biến
        if (DllCall("IsClipboardFormatAvailable", "uint", 1)) ; Clipboard là text
        {
            if (SubStr(currentClipboard, 1, 2) == "\\") ; Không xử lý nếu text bắt đầu bằng \\
            {
                MsgBox("Định dạng không được hỗ trợ", "Thông báo")
            } else if (RegExMatch(currentClipboard, "^[a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)")) ; URL không bắt đầu bằng http hoặc https hoặc www.
            {
                Run("http://" . currentClipboard)
            } else ; AutoHotkey xử lý mặc định
            {
                Run(currentClipboard)
            }
        }
    } catch as e { ; Nếu không xử lý được thì tìm kiếm trên google
        Run("https://www.google.com/search?q=" . currentClipboard)
    }
}

/**
 * Dịch đoạn text được bôi đen bằng google translate
 */
translateTextInClipboard()
{
    try {
        Send("^{Ins}") ; Copy
        Sleep(50) ; Chờ lệnh copy xử lý
        if (DllCall("IsClipboardFormatAvailable", "uint", 1)) ; Clipboard là text
        {
            Run("https://translate.google.com/?hl=vi&sl=auto&tl=vi&text=" . A_Clipboard . "&op=translate") ; Mở trang google translate
            if (WinWaitActive("Google Dịch - Google Chrome", , 1)) ; Chờ đến khi trang mở xong thì paste lại nội dung cho đúng format
            {
                Sleep(500)
                Send("^{a}")
                Sleep(50)
                Send("+{Ins}")
            }
        }
    } catch as e {
        MsgBox("Có lỗi phát sinh:`n" . e.Message, "Lỗi")
    }
}

/**
 * Kiểm tra chuột có đang ở vị trí của màn hình được truyền vào không
 * @param winTitle màn hình
 * @returns {Integer} 1: true, 0: false
 */
mouseIsOver(winTitle) {
    MouseGetPos ,, &Win
    return WinExist(winTitle " ahk_id " Win)
}