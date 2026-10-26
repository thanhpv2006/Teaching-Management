# Sử dụng database đã nghiệm thu

Bạn đã có teaching_management và app_user nên chỉ kết nối, không import dump lại. Ứng dụng không có schema.sql/data.sql tự chạy. Giữ file teaching_management_final.sql bạn đã xuất làm backup.

Nếu muốn cài trên máy/server khác, dùng bộ 7 script ngày 6/7 theo đúng hướng dẫn và tạo quyền runtime. Hoặc phục hồi dump bằng tài khoản DBA trên môi trường riêng, xử lý DEFINER/quyền theo thực tế rồi tạo app_user. Dump có DROP TABLE/VIEW/PROCEDURE nên không import vào dữ liệu đang dùng để thử giao diện.

Nếu bạn đã tái tạo procedure và mất EXECUTE, root dùng REFRESH_EXECUTE_ADMIN.sql có trong bộ DB trước. Không chạy lại script tạo user ngày 5 khi user đã tồn tại; không đổi runtime thành root để tránh lỗi quyền.
