# Chạy ứng dụng từng bước

## A. Kết nối database hiện tại
1. Mở MySQL Workbench, kiểm tra database teaching_management còn đủ dữ liệu. Không cần chạy lại ngày 1–7.
2. Kết nối BTL app_user như ngày 5/6. Chạy `database/kiem_tra_ket_noi.sql`. Xác nhận CURRENT_USER là app_user@localhost và ba view đọc được.
3. Đóng tab SQL nếu không cần; giữ dịch vụ MySQL đang bật. Workbench không bắt buộc mở khi dùng ứng dụng.
4. Đảm bảo `java -version` là 17 hoặc mới hơn. JAR đã build, không cần Maven khi chạy bản dist.
5. Giải nén bộ ứng dụng, chạy start_windows.cmd; nhập mật khẩu MySQL app_user. Script không lưu mật khẩu vào tệp. Nếu vẫn giữ mật khẩu demo ngày 5 thì dùng đúng mật khẩu bạn đã đặt cho app_user, không dùng mật khẩu admin/sv001 của ứng dụng.
6. Mở http://localhost:8080/login. Đăng nhập admin để xem tổng thể, sv001 để thử sinh viên, gv001 để nhập điểm, staff để thu tiền. Mật khẩu seed ứng dụng: BtlDemo@2026.

## B. Chạy bằng PowerShell thủ công
Tại thư mục vừa giải nén:
```powershell
$env:BTL_DB_USERNAME = 'app_user'
$secret = Read-Host 'Mat khau MySQL app_user' -AsSecureString
$ptr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secret)
try { $env:BTL_DB_PASSWORD = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr) }
finally { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr) }
java -jar .\dist	eaching-management-1.0.0.jar
```
Nếu cần cổng web khác, đặt `$env:BTL_PORT = '8081'` trước khi chạy rồi mở localhost:8081. Nếu MySQL ở cổng khác, đặt BTL_DB_URL, ví dụ:
```powershell
$env:BTL_DB_URL = 'jdbc:mysql://localhost:3307/teaching_management?connectionTimeZone=%2B07:00&forceConnectionTimeZoneToSession=true&useUnicode=true&characterEncoding=UTF-8'
```
Không đặt root làm tài khoản runtime. Không thêm allowPublicKeyRetrieval/đổi cơ chế đăng nhập hoặc bỏ TLS một cách tùy tiện; nếu Connector báo lỗi xác thực, gửi đầy đủ mã lỗi để xử lý đúng cấu hình.

## C. Chạy và sửa source bằng IntelliJ
- Open thư mục có pom.xml, chọn JDK 17/21, chờ Maven tải thư viện lần đầu (cần Internet).
- Run class vn.btl.teaching.TeachingApplication; trong Run Configuration thêm environment BTL_DB_USERNAME=app_user và BTL_DB_PASSWORD bằng mật khẩu MySQL thật.
- Hoặc chạy `mvn clean package`, sau đó chạy target/teaching-management-1.0.0.jar. Sau khi sửa source, phải build lại; JAR dist là bản build tại thời điểm bàn giao.
- Chỉ có Maven build/test cần Internet lần đầu. CSS/JS không gọi CDN.

## D. Lỗi thường gặp
| Lỗi | Cách kiểm tra |
|---|---|
| java không được nhận diện | Cài JDK, kiểm JAVA_HOME/PATH rồi mở terminal mới |
| UnsupportedClassVersionError | Đang dùng Java dưới 17 |
| Access denied for user app_user | Kiểm mật khẩu MySQL, host/cổng; thử cùng tài khoản trong Workbench |
| Communications link failure | Kiểm MySQL80, cổng 3306 và BTL_DB_URL |
| Unknown database/table | Đang kết nối nhầm server/schema; không tạo lại bảng để thử |
| EXECUTE command denied / 1370 | Sau khi tái tạo routine, root chạy script refresh EXECUTE đã có trong bộ DB; không đổi app sang root |
| Port 8080 already in use | Dừng ứng dụng cũ hoặc đổi BTL_PORT |
| Đăng nhập không được | Dùng tài khoản ứng dụng (admin/sv001…), kiểm active và mật khẩu đã đổi |
| 403 hoặc CSRF khi mở tab cũ | Tải lại trang và đăng nhập lại, không tắt CSRF |
| DB có dữ liệu nhưng màn hình trống | Chọn đúng học kỳ; mặc định ưu tiên D6_DEMO |
| Không đăng ký/hủy được | Kiểm ngày bắt đầu, trạng thái OPEN, sĩ số và đăng ký trùng môn |
| Không sửa lịch lớp được | Lớp có ACTIVE: ứng dụng cố ý bảo vệ cấu hình |

Các lỗi kết nối thường chỉ xuất hiện khi đăng nhập/truy vấn lần đầu, dù trang login đã mở được. Mở được login chưa chứng minh kết nối MySQL thành công.
