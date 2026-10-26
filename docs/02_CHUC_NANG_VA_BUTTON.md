# Màn hình và hành vi các nút

| Màn hình | Nút | Hành vi thật / giới hạn |
|---|---|---|
| Đăng nhập | Hiện/ẩn | Đổi cách hiển thị mật khẩu trên thiết bị; không đổi mật khẩu |
| Đăng nhập | Đăng nhập | Đọc accounts, kiểm BCrypt/active, tạo phiên theo vai trò |
| Mọi trang | Đăng xuất | POST + CSRF, hủy phiên |
| Trang danh sách | Áp dụng | Gửi GET theo học kỳ/từ khóa, không thay dữ liệu |
| Lớp học phần / SV | Đăng ký | Xác nhận rồi gọi sp_register_section bằng student_id từ phiên; vô hiệu khi đã đăng ký, lớp chưa mở, đầy hoặc hết hạn |
| Đăng ký của tôi | Hủy đăng ký | Xác nhận rồi gọi sp_cancel_enrollment; hết hạn thì nút vô hiệu |
| Lớp / quản lý và GV | Danh sách SV | Đọc v_class_roster; GV phải phụ trách lớp, SV không truy cập được |
| Bảng điểm / GV | Nhập điểm | Mở form cho đăng ký ACTIVE thuộc lớp phụ trách |
| Form điểm | Lưu điểm | Gọi sp_update_scores bằng lecturer_id từ phiên; ô trống lưu NULL; tổng kết từ view |
| Công nợ / quản lý | Thu tiền ở dòng | Chọn SV và điền sẵn số nợ vào form, CHƯA ghi DB |
| Form thu tiền | Xác nhận thu tiền | Xác nhận đã nhận tiền rồi gọi sp_record_payment, collector lấy từ phiên; không vượt nợ |
| Công nợ | Lịch sử phiếu thu | Đọc payments; SV chỉ xem phiếu của mình |
| Quản lý danh mục | Thêm mới | Mở form, lựa chọn tham chiếu từ DB |
| Form danh mục | Lưu dữ liệu | Validate rồi INSERT/UPDATE whitelist cột; SV/GV mới tạo kèm tài khoản trong một transaction |
| Danh mục | Sửa | Điền dữ liệu hiện có; không sửa môn/học kỳ/snapshot của lớp đã tạo |
| Danh mục | Xóa | Xác nhận; khóa ngoại bảo vệ dữ liệu liên kết; không có xóa phiếu thu/đăng ký trực tiếp |
| Tài khoản / ADMIN | Khóa / mở khóa | Đổi active; request tiếp theo của tài khoản bị khóa sẽ bị từ chối; không tự khóa mình |
| Tài khoản / ADMIN | Đặt lại | Hash BCrypt mật khẩu mới, tối thiểu 8 ký tự/tối đa 72 byte UTF-8; không hiển thị hash |
| Mobile | Menu | Mở/đóng điều hướng bằng nút có aria-expanded |

## Quy tắc tránh lỗi thao tác
- Form có nhãn, trường bắt buộc, giới hạn số/ngày; server luôn kiểm tra lại.
- Lỗi có thông báo tiếng Việt; các form điểm/thu tiền/danh mục giữ dữ liệu vừa nhập khi có thể. Mật khẩu không điền lại.
- Nút submit được khóa sau xác nhận để giảm gửi lặp; backend vẫn dựa trên transaction/unique để đảm bảo dữ liệu.
- Thu tiền gửi lại mã phiếu cũ: chỉ xác nhận đã ghi nếu SV, học kỳ, số tiền và người thu cùng khớp. Mã trùng với khoản thu khác bị từ chối. Không tự tạo mã mới khi kết nối gián đoạn.
- Phần đăng ký/hủy/điểm không tự retry khi mất kết nối; tải lại dữ liệu kiểm kết quả trước khi thao tác tiếp.
- Tổng học phí và số tiền dùng BigDecimal/DECIMAL; không tự tính số tiền đáng tin từ trình duyệt.
- Admin/nhân viên không được nhập điểm thay giảng viên. Muốn demo điểm, đăng nhập GV được phân công.

Không có nút thanh toán online, xuất Excel hoặc email vì chưa thực hiện chức năng đó. Tài khoản admin/staff mẫu đã có; giao diện tạo tài khoản mới gắn với hồ sơ STUDENT/LECTURER, không tạo thêm quản trị viên.
