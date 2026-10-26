# Cấu trúc source và hợp đồng Database

WebController nhận form → Identity xác nhận tài khoản và danh tính → BusinessService gọi ProcedureGateway hoặc CatalogService → MySQL. Queries đọc view/danh mục theo quyền. Thymeleaf render HTML, CSS/JS chạy cục bộ.

- SecurityConfig: form login, BCrypt, CSRF mặc định, whitelist URL theo vai trò.
- PageAdvice/Identity: kiểm active và role hiện tại trên mỗi request có đăng nhập; ID SV/GV lấy từ bảng liên kết account_id.
- Queries: bind tham số và thêm student_id/lecturer_id theo principal; URL giả student_id không thay đổi phạm vi đọc.
- ProcedureGateway: chỉ chấp nhận 4 tên routine cố định, connection autocommit=true, từ chối transaction caller, đọc hết resultset/updatecount.
- BusinessService: không có @Transactional quanh CALL; phục hồi trạng thái phiếu thu theo mã khi kết quả kết nối chưa rõ.
- CatalogService: whitelist tên bảng/cột; dùng transaction Java cho CRUD nhiều bước. Không ghi trực tiếp enrollments/payments. UPDATE sections chỉ 5 cột đã được cấp quyền. Khóa lớp và kiểm ACTIVE trước đổi cấu hình/lịch.
- Display/Input/Errors: định dạng tiền, kiểm đầu vào và ánh xạ lỗi nghiệp vụ.

| Routine | Tham số từ ứng dụng |
|---|---|
| sp_register_section | student_id từ phiên, section_id từ lựa chọn |
| sp_cancel_enrollment | student_id từ phiên, enrollment_id từ lựa chọn |
| sp_update_scores | lecturer_id từ phiên, enrollment_id, 3 điểm nullable |
| sp_record_payment | student_id, semester_id, collector_account_id từ phiên, receipt_code, amount, note |

View: v_class_roster, v_student_grades, v_tuition_summary. Không join lịch học để tính lại điểm/học phí nên lớp có nhiều lịch không nhân dòng. Tiền dư sau hủy được giữ dưới dạng credit.

Không dùng JPA, không migration tự động, spring.sql.init.mode=never. Ứng dụng không tạo/sửa schema, routine, trigger, view hoặc user MySQL. Database chạy bằng app_user với quyền ngày 5; giữ root/definer của đối tượng như DB đã nghiệm thu. Nếu triển khai lại routine thì DBA refresh EXECUTE theo bộ DB cũ.

## Các giới hạn đã giữ đúng phạm vi
- Không kiểm tra trùng lịch, tiên quyết hoặc GPA; không có hoàn tiền tự động.
- Lịch chỉ chỉnh khi lớp không còn ACTIVE; lớp có ACTIVE chỉ đổi mã/sức chứa, không giảm dưới sĩ số.
- Môn và học kỳ có thể đổi thông tin danh mục; snapshot của lớp cũ vẫn giữ nguyên.
- Khóa tài khoản được áp dụng ở request tiếp theo; đặt lại mật khẩu không tự đóng mọi phiên đã đăng nhập. Muốn chặn ngay tài khoản khác, dùng Khóa.
- Không cung cấp REST API riêng/SPA; form POST và MVC phục vụ bài tập lớn và trình bày DB.

Tài liệu tham chiếu: https://docs.spring.io/spring-boot/3.5/system-requirements.html ; https://docs.spring.io/spring-security/reference/servlet/authentication/passwords/form.html ; https://docs.spring.io/spring-security/reference/servlet/exploits/csrf.html
