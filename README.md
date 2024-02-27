# AutoHotkey

AutoHotkey 2.0 portable và một số scipt hữu ích

Trang chủ: https://www.autohotkey.com/

Các tính năng chính của script:
- [Common](src/script/Common.ahk): tiện ích dùng chung
  - Gán lại các nút hàng F để xử lý các tác vụ văn bản (copy, paste, cut, undo, redo, ...)
  - Tính năng điểu khiển media (tăng giảm âm lượng, chạy/tạm dừng media, ...) khi đưa chuột vào thanh tác vụ
  - Chạy các đoạn text được chọn hoặc tìm kiếm trên google
  - Dịch đoạn text được chọn bằng google dịch
- [JDL EKUJ5](src/script/JDL%20EKUJ5.ahk): script sử dụng cho bàn phím JDL EKUJ5
- [JER-1800](src/script/JER-1800.ahk): script sử dụng cho bàn phím JER-1800
- [JER-80S](src/script/JER-80S.ahk): script sử dụng cho bàn phím JER-80S

## Tải AutoHotkey

- Từ trang chủ: https://www.autohotkey.com/download/ (Chọn bản ZIP)
- Có thể sử dụng phiên bản portable trong thư mục src/app

## Cài đặt AutoHotkey

Có thể cài đặt AutoHotkey chạy nền để có thể chạy trực tiếp script, hoặc không cần cài đặt vẫn có thể chạy được script nhưng cần nhiều thao tác hơn, xem [Chạy Script](#run-script)

- Giải nén file zip
- Chạy `Install.cmd`
- Bỏ qua cảnh báo nếu có và tiến hành cài đặt

[Tham khảo thêm](https://www.autohotkey.com/docs/v2/howto/Install.htm)

## <a id="run-script" /> Chạy Script

- Nếu đã cài đặt AutoHotkey chạy nền thì chỉ cần double click vào file script là được
- Nếu không cài đặt thì làm các bước sau để chạy script:
  - Giải nén AutoHotkey bản ZIP
  - Copy file script (.ahk) cần chạy vào thư mục đã giải nén
  - Đổi tên file `AutoHotkey64.exe` cho giống với tên của file script
  - Chạy file `exe` vừa đổi tên
  - Nếu có nhiều file script thì có thể clone file `exe` ra và đổi tên theo từng script, muốn chạy script nào thì chỉ cần chạy file `exe` tương ứng (_Lưu ý: cần để file script và file `exe` cùng thư mục_)

## Chỉnh sửa script

- Các công cụ hỗ trợ: Notepad++, Visual Studio Code (VS Code), SciTE4AutoHotkey ([Chi tiết](https://www.autohotkey.com/docs/v2/misc/Editors.htm))
- Chuột phải vào file script hoặc biểu tượng AutoHotkey đang chạy dưới khay hệ thống và chọn `Edit Script`
- Tài liệu hướng dẫn: https://www.autohotkey.com/docs/v2/

## Giấy phép

[MIT License](License.txt)