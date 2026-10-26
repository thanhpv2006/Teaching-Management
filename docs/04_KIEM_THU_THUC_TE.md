# Nghiệm thu ứng dụng trên máy bạn

Xuất backup trước thử nghiệm. Các thao tác hợp lệ sẽ thay đổi dữ liệu; giữ ảnh baseline ngày 6 và ghi log mới. Không chạy lại seed để khôi phục một vài số liệu.

1. Chạy app bằng app_user, đăng nhập admin, xác nhận chọn D6_DEMO xem danh mục và công nợ.
2. Đăng nhập sv001: điểm CSDL ban đầu 5.60; nợ ban đầu 2 triệu; phiếu thu chỉ của SV001. Thử /manage phải bị từ chối. Thêm student_id=2 vào URL điểm/công nợ không được xem dữ liệu SV002.
3. Đăng nhập gv001: xem D6_CSDL/D6_DRAFT; bảng điểm không có lớp GV khác. Màn hình /tuition và /manage phải từ chối.
4. Đăng nhập admin tạo học kỳ/môn/lớp thử riêng. Ngày lớp phải sau ngày hiện tại; chọn OPEN, sức chứa 1, giảng viên GV001, đơn giá 500000, môn 3 tín chỉ. Tạo lịch trước khi có đăng ký.
5. Đăng nhập sv019 đăng ký lớp thử: thành công, học phí tăng 1.5 triệu. Đăng ký lại: nút đã đăng ký vô hiệu hoặc SQL từ chối trùng.
6. Đăng nhập sv020 đăng ký lớp thử đang đầy: nút vô hiệu; nếu gửi request thủ công, procedure vẫn từ chối CLASS_FULL.
7. Đăng nhập gv001 nhập 8/6/5 cho sv019 ở lớp thử: tổng 5.60; xóa một thành phần rồi lưu: Chưa đủ điểm. Nhập 11 bị chặn. GV khác không được sửa điểm lớp thử.
8. Đăng nhập staff thu 1 triệu cho sv019 ở học kỳ thử: còn nợ 500000. Mở lịch sử đối chiếu người thu staff, mã phiếu, số tiền. Thử vượt nợ bị từ chối; không có phiếu mới.
9. Gửi lại cùng mã/số tiền/SV/học kỳ/người thu: chỉ xác nhận phiếu đã ghi, số phiếu và tổng thu không tăng. Mã cũ với số tiền khác bị từ chối.
10. sv019 hủy lớp thử trước ngày bắt đầu: học phí 0, dư có 1 triệu; phiếu thu vẫn còn, đăng ký không còn trong view điểm/lịch.
11. Thử thêm và sửa danh mục, tạo SV/GV mới kèm tài khoản. Mã trùng phải báo lỗi và không tạo tài khoản mồ côi từ transaction lỗi. Xóa dữ liệu có FK phải bị chặn.
12. Admin khóa tài khoản thử: đăng nhập mới thất bại, request tiếp theo của phiên đang mở bị từ chối. Mở khóa và đặt lại mật khẩu, kiểm đăng nhập mới. Staff không được quản lý tài khoản.
13. Thu nhỏ cửa sổ/điện thoại: menu mở được, bảng cuộn trong khung, form đủ nhãn và nút.

Ghi `validation/nghiem_thu_may_ban.csv`, chụp màn hình và đối chiếu Workbench. Đây là nghiệm thu còn cần bạn chạy; file kết quả không tự đánh PASS.

### Test đọc MySQL thật bằng Maven (tùy chọn)
Đặt BTL_DB_USERNAME, BTL_DB_PASSWORD như khi chạy ứng dụng. Trong PowerShell đặt `$env:BTL_LIVE_TESTS='true'`, chạy `mvn test`, sau đó xóa biến bằng `Remove-Item Env:BTL_LIVE_TESTS`. LiveDatabaseTest chỉ đọc CURRENT_USER/database/3 view, không thay thế việc thử các nút nghiệp vụ.
