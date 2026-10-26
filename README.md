# Học vụ — Bài tập lớn Cơ sở dữ liệu

Ứng dụng Java Spring Boot 3.5.7 + Thymeleaf + JDBC + Spring Security, Java 17. Giao diện tiếng Việt, CSS/JS kèm sẵn, không cần Node/React hoặc CDN khi chạy. Dữ liệu lấy từ MySQL teaching_management bạn đã hoàn thành.

## Chạy nhanh trên Windows (đã có DB)
1. Giải nén ZIP vào một thư mục bình thường; không chạy trực tiếp bên trong ZIP.
2. Mở Terminal/PowerShell, gõ `java -version`. Cần Java 17 trở lên (khuyến nghị JDK 17 hoặc 21). Có thể dùng terminal của IntelliJ nếu đã có JDK.
3. Bật MySQL80 như khi dùng Workbench. KHÔNG import lại dump, KHÔNG chạy schema/seed lại trên DB hiện tại.
4. Bấm đúp `start_windows.cmd`. Script hỏi mật khẩu MySQL của **app_user** bằng ô nhập ẩn và chạy JAR đã build. Tên MySQL mặc định là app_user, cổng DB mặc định 3306, DB teaching_management.
5. Giữ cửa sổ chạy ứng dụng mở. Khi log hiện `Started TeachingApplication`, mở http://localhost:8080/login.
6. Đăng nhập tài khoản ứng dụng: admin / staff / sv001 / gv001… Mật khẩu mẫu trong dump gốc: `BtlDemo@2026`. Nếu đã đổi mật khẩu bằng giao diện thì dùng mật khẩu mới. Đây không phải mật khẩu MySQL app_user.
7. Dừng ứng dụng bằng Ctrl+C trong cửa sổ đang chạy.

Nếu Windows không mở được script hoặc không tìm thấy Java, xem `docs/01_HUONG_DAN_CHAY.md` để chạy bằng lệnh hoặc IntelliJ. JAR ở `dist/teaching-management-1.0.0.jar`.

## Chức năng
- ADMIN/STAFF: quản lý môn, học kỳ, lớp hành chính, hồ sơ SV/GV, lớp học phần và lịch học; đọc điểm, danh sách lớp, công nợ; thu tiền và xem phiếu thu.
- ADMIN: thêm quyền khóa/mở tài khoản, đặt lại mật khẩu. Không khóa chính tài khoản đang dùng.
- STUDENT: xem lớp, đăng ký/hủy học phần bằng procedure; chỉ xem đăng ký, lịch, điểm, công nợ và phiếu thu của mình.
- LECTURER: xem lớp/danh sách/lịch/điểm trong phân công; nhập hoặc xóa điểm thành phần qua procedure. Không truy cập màn hình học phí.
- Tạo SV/GV mới sẽ tạo hồ sơ và tài khoản cùng transaction Java; vai trò do server quy định, không lấy từ form.
- Mọi thao tác ghi dùng POST + CSRF; danh tính SV/GV/người thu lấy từ tài khoản đã đăng nhập. Truy vấn bind tham số.

Xem `docs/02_CHUC_NANG_VA_BUTTON.md`, `docs/03_KIEN_TRUC_VA_SQL.md`, `docs/04_KIEM_THU_THUC_TE.md`.

## Build và test từ source
Cần Maven 3.6.3+ và JDK 17. Tại thư mục có pom.xml:
```powershell
mvn clean package
java -jar target/teaching-management-1.0.0.jar
```
Đặt BTL_DB_PASSWORD trước khi chạy bằng lệnh (xem hướng dẫn). Mặc định `mvn test` dùng mock JDBC cho test Java, không ghi dữ liệu MySQL. Test đọc MySQL thật chỉ chạy khi chủ động bật BTL_LIVE_TESTS=true.

## Giới hạn và nghiệm thu
Đây là BTL chạy cục bộ, chưa có thanh toán online/hoàn tiền, môn tiên quyết, tự kiểm tra trùng lịch/phòng, nhập Excel hoặc khôi phục mật khẩu bằng email. Lịch hiển thị theo tuần. Không có nút giả cho các chức năng này.

Xem `validation/KET_QUA_KIEM_TRA.md` để phân biệt kiểm thử Java/mock, kiểm tra MySQL engine và phần chưa nghiệm thu Java→MySQL trên máy thật. Ảnh docs/preview dùng dữ liệu kiểm thử minh họa, không phải ảnh nghiệm thu DB máy bạn.
