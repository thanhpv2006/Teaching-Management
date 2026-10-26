# Kết quả kiểm tra trước bàn giao — 26/10/2026

- Maven package thành công, JAR Java 17 đã đối chiếu byte tài nguyên với source cuối.
- **38 test Java/Spring PASS**, 0 lỗi; **1 test MySQL thật được bỏ qua có chủ đích** vì chưa có kết nối máy bạn. Báo cáo từng lớp test kèm trong thư mục này.
- WebFlowTest dùng Spring Security + MVC + Thymeleaf thật với JdbcTemplate giả lập: login BCrypt theo hash dump, CSRF, phân quyền 4 vai trò, giới hạn truy vấn theo principal, render trang và form; kiểm cả trạng thái rỗng/có dữ liệu.
- BusinessServiceTest/CatalogServiceTest/ProcedureGatewayTest kiểm principal cho writer, số/điểm/precision, phiếu gửi lại, whitelist, rollback profile+account, bảo vệ lớp ACTIVE và ranh giới transaction procedure. Đây không phải test JDBC tới MySQL thật.
- JAR khởi động thật, GET /login qua HTTP trả 200, có token CSRF. Mở được login không chứng minh datasource kết nối thành công.
- Dump gốc nạp và 4 procedure được kiểm riêng bằng MySQL Community 8.4.11 trong instance init-file cô lập: 7 assertion và 6 lỗi mong đợi đều đạt. Gồm đăng ký, trùng, đầy, quyền GV, điểm 5.60, thu tiền từng phần/đủ, trùng mã, vượt nợ, hết nợ, hủy và dư có. Không dùng TCP hoặc app_user cho lượt kiểm SQL này.
- Chromium: đã xem ảnh desktop/mobile thực tế từ HTML Thymeleaf test, kiểm không tràn ngang toàn trang, hiện/ẩn mật khẩu và mở/đóng menu mobile. Dữ liệu ảnh là fixture minh họa, không phải ảnh nghiệm thu DB máy bạn.

## Còn cần nghiệm thu

Java → MySQL 8.0 trên máy bạn bằng app_user; thao tác thật các nút; quyền SQL runtime thực tế; các tình huống gửi lại/mất kết nối thật; backup/restore và đa người dùng trong ứng dụng. Xem docs/04_KIEM_THU_THUC_TE.md và điền CSV. SQL engine PASS và mock tests không thay thế nghiệm thu tích hợp.

Môi trường tạo bộ source chặn UNIX socket cần để MySQL server hoạt động bình thường, vì vậy không có kết quả MySQL qua JDBC/TCP. Không chỉnh sửa schema, view, procedure, trigger hoặc file dump gốc của bạn.
