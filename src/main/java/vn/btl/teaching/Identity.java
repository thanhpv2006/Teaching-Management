package vn.btl.teaching;
import org.springframework.stereotype.Service;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.access.AccessDeniedException;
@Service public class Identity {
 private final JdbcTemplate db; public Identity(JdbcTemplate db){this.db=db;}
 public void active(AppUser u){Integer n=db.queryForObject("SELECT COUNT(*) FROM accounts WHERE id=? AND active=1 AND role=?",Integer.class,u.getId(),u.getRole());if(n==null||n!=1)throw new AccessDeniedException("Tài khoản đã khóa hoặc đổi quyền. Vui lòng đăng nhập lại.");}
 public long student(AppUser u){active(u);if(!u.getRole().equals("STUDENT"))throw new AccessDeniedException("Chỉ dành cho sinh viên");return linked("students",u.getId());}
 public long lecturer(AppUser u){active(u);if(!u.getRole().equals("LECTURER"))throw new AccessDeniedException("Chỉ dành cho giảng viên");return linked("lecturers",u.getId());}
 private long linked(String table,long account){return db.query("SELECT id FROM "+table+" WHERE account_id=?",(r,n)->r.getLong(1),account).stream().findFirst().orElseThrow(()->new AccessDeniedException("Tài khoản chưa có hồ sơ liên kết"));}
 public void manager(AppUser u){active(u);if(!u.isManager())throw new AccessDeniedException("Bạn không có quyền quản lý");}
 public void admin(AppUser u){active(u);if(!u.getRole().equals("ADMIN"))throw new AccessDeniedException("Chỉ quản trị viên được quản lý tài khoản");}
}
