package vn.btl.teaching;
import java.util.*;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.transaction.PlatformTransactionManager;
@Service public class CatalogService {
 public record Field(String name,String label,String type,boolean required,int max,List<Map<String,Object>> options){}
 private final JdbcTemplate db;private final TransactionTemplate tx;private final PasswordEncoder encoder;private final Identity identity;
 private static final Map<String,String> TITLES=Map.of("courses","Môn học","semesters","Học kỳ","admin_classes","Lớp hành chính","students","Sinh viên","lecturers","Giảng viên","sections","Lớp học phần","schedules","Lịch học");
 public CatalogService(JdbcTemplate d,PlatformTransactionManager tm,PasswordEncoder e,Identity i){db=d;tx=new TransactionTemplate(tm);encoder=e;identity=i;}
 public Map<String,String> titles(){return new TreeMap<>(TITLES);} public String title(String kind){valid(kind);return TITLES.get(kind);}
 private void valid(String k){if(!TITLES.containsKey(k))throw new IllegalArgumentException("Danh mục không tồn tại");}
 private Field f(String n,String l,String t,boolean r,int max){return new Field(n,l,t,r,max,List.of());}
 private Field select(String n,String l,String sql){return new Field(n,l,"select",true,0,db.queryForList(sql));}
 public List<Field> fields(String k,boolean create){valid(k);var a=new ArrayList<Field>();
  if(!k.equals("schedules"))a.add(f("code","Mã","text",true,k.equals("sections")?30:20));
  switch(k){
  case "courses" -> {a.add(f("name","Tên môn học","text",true,150));a.add(f("credits","Số tín chỉ (1–6)","number",true,6));}
  case "semesters" -> {a.add(f("name","Tên học kỳ","text",true,100));a.add(f("start_date","Ngày bắt đầu","date",true,0));a.add(f("end_date","Ngày kết thúc","date",true,0));a.add(f("default_unit_price","Đơn giá mỗi tín chỉ (đ)","number",true,0));}
  case "admin_classes" -> {a.add(f("name","Tên lớp","text",true,100));a.add(f("cohort","Khóa","text",true,20));}
  case "students","lecturers" -> {a.add(f("full_name","Họ và tên","text",true,100));a.add(f("email","Email","email",false,120));if(k.equals("students"))a.add(select("admin_class_id","Lớp hành chính","SELECT id,CONCAT(code,' · ',name) AS label FROM admin_classes ORDER BY code"));if(create){a.add(f("username","Tên đăng nhập mới","text",true,50));a.add(f("password","Mật khẩu mới (ít nhất 8 ký tự)","password",true,72));}}
  case "sections" -> {if(create){a.add(select("course_id","Môn học","SELECT id,CONCAT(code,' · ',name) AS label FROM courses ORDER BY code"));a.add(select("semester_id","Học kỳ","SELECT id,CONCAT(code,' · ',name) AS label FROM semesters ORDER BY start_date DESC"));}a.add(select("lecturer_id","Giảng viên","SELECT l.id,CONCAT(l.code,' · ',l.full_name) AS label FROM lecturers l JOIN accounts a ON a.id=l.account_id WHERE a.active=1 AND a.role='LECTURER' ORDER BY l.code"));a.add(f("max_students","Sĩ số tối đa","number",true,0));a.add(f("start_date","Ngày bắt đầu lớp","date",true,0));a.add(new Field("status","Trạng thái","select",true,0,List.of(Map.of("id","DRAFT","label","Chưa mở"),Map.of("id","OPEN","label","Đang mở"),Map.of("id","CLOSED","label","Đã đóng"))));}
  case "schedules" -> {a.add(select("section_id","Lớp học phần","SELECT id,code AS label FROM sections ORDER BY code"));a.add(new Field("weekday","Thứ","select",true,0,List.of(Map.of("id",2,"label","Thứ 2"),Map.of("id",3,"label","Thứ 3"),Map.of("id",4,"label","Thứ 4"),Map.of("id",5,"label","Thứ 5"),Map.of("id",6,"label","Thứ 6"),Map.of("id",7,"label","Thứ 7"),Map.of("id",8,"label","Chủ nhật"))));a.add(f("start_period","Tiết bắt đầu (1–15)","number",true,15));a.add(f("period_count","Số tiết","number",true,15));a.add(f("room","Phòng học","text",true,30));}
  }return a;
 }
 public List<Map<String,Object>> list(String k){valid(k);String columns=switch(k){case "students"->"id,code,full_name,email,admin_class_id";case "lecturers"->"id,code,full_name,email";default->"*";};return db.queryForList("SELECT "+columns+" FROM "+k+" ORDER BY id DESC");}
 public Map<String,Object> row(String k,long id){valid(k);return db.queryForList("SELECT * FROM "+k+" WHERE id=?",id).stream().findFirst().orElseThrow(()->new IllegalArgumentException("Bản ghi không còn tồn tại"));}
 private String password(String value){if(value==null||value.length()<8||value.getBytes(StandardCharsets.UTF_8).length>72)throw new IllegalArgumentException("Mật khẩu cần ít nhất 8 ký tự, tối đa 72 byte UTF-8.");return encoder.encode(value);}
 private void lockEmpty(long section){db.queryForObject("SELECT id FROM sections WHERE id=? FOR UPDATE",Long.class,section);if(db.queryForObject("SELECT COUNT(*) FROM enrollments WHERE section_id=? AND status='ACTIVE'",Long.class,section)>0)throw new IllegalArgumentException("Lớp đã có sinh viên đang học; không thay đổi lịch hoặc cấu hình. Hãy tạo lớp mới nếu cần.");}
 public void save(AppUser u,String k,Long id,Map<String,String> f){identity.manager(u);valid(k);tx.executeWithoutResult(t->{
  var v=new LinkedHashMap<String,Object>();if(!k.equals("schedules"))v.put("code",Input.text(f,"code",k.equals("sections")?30:20));
  switch(k){
   case "courses" -> {v.put("name",Input.text(f,"name",150));v.put("credits",Input.integer(f,"credits",1,6));}
   case "semesters" -> {v.put("name",Input.text(f,"name",100));var start=Input.date(f,"start_date");var end=Input.date(f,"end_date");if(end.isBefore(start))throw new IllegalArgumentException("Ngày kết thúc phải từ ngày bắt đầu trở đi.");v.put("start_date",start);v.put("end_date",end);v.put("default_unit_price",Input.money(f,"default_unit_price"));}
   case "admin_classes" -> {v.put("name",Input.text(f,"name",100));v.put("cohort",Input.text(f,"cohort",20));}
   case "students","lecturers" -> {v.put("full_name",Input.text(f,"full_name",100));String email=Input.optional(f,"email",120);if(email!=null&&!email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$"))throw new IllegalArgumentException("Địa chỉ email không hợp lệ.");v.put("email",email);if(k.equals("students"))v.put("admin_class_id",Input.id(f,"admin_class_id"));if(id==null){String username=Input.text(f,"username",50);String hash=password(f.get("password"));db.update("INSERT INTO accounts(username,password_hash,role,active) VALUES(?,?,?,1)",username,hash,k.equals("students")?"STUDENT":"LECTURER");v.put("account_id",db.queryForObject("SELECT id FROM accounts WHERE username=?",Long.class,username));}}
   case "sections" -> {long lecturer=Input.id(f,"lecturer_id");if(db.queryForObject("SELECT COUNT(*) FROM lecturers l JOIN accounts a ON a.id=l.account_id WHERE l.id=? AND a.role='LECTURER' AND a.active=1",Long.class,lecturer)!=1)throw new IllegalArgumentException("Giảng viên không hợp lệ hoặc đã khóa.");v.put("lecturer_id",lecturer);v.put("max_students",Input.integer(f,"max_students",1,10000));v.put("start_date",Input.date(f,"start_date"));String status=Input.text(f,"status",10);if(!Set.of("DRAFT","OPEN","CLOSED").contains(status))throw new IllegalArgumentException("Trạng thái không hợp lệ");v.put("status",status);
    if(id==null){long course=Input.id(f,"course_id"),sem=Input.id(f,"semester_id");v.put("course_id",course);v.put("semester_id",sem);v.put("credits_snapshot",db.queryForObject("SELECT credits FROM courses WHERE id=?",Integer.class,course));v.put("unit_price_snapshot",db.queryForObject("SELECT default_unit_price FROM semesters WHERE id=?",BigDecimal.class,sem));}
    else{db.queryForObject("SELECT id FROM sections WHERE id=? FOR UPDATE",Long.class,id);var old=row(k,id);long active=db.queryForObject("SELECT COUNT(*) FROM enrollments WHERE section_id=? AND status='ACTIVE'",Long.class,id);if(((Integer)v.get("max_students"))<active)throw new IllegalArgumentException("Sĩ số tối đa không được nhỏ hơn số đang học ("+active+").");if(active>0&&(((Number)old.get("lecturer_id")).longValue()!=lecturer||!old.get("start_date").toString().equals(v.get("start_date").toString())||!old.get("status").equals(status)))throw new IllegalArgumentException("Lớp có sinh viên đang học: chỉ sửa mã và sức chứa; giữ nguyên giảng viên, ngày và trạng thái.");}
   }
   case "schedules" -> {long section=Input.id(f,"section_id");if(id!=null){long old=((Number)row(k,id).get("section_id")).longValue();for(long s:new java.util.TreeSet<>(List.of(old,section)))lockEmpty(s);}else lockEmpty(section);int start=Input.integer(f,"start_period",1,15),count=Input.integer(f,"period_count",1,15);if(start+count-1>15)throw new IllegalArgumentException("Tiết kết thúc không được vượt 15.");v.put("section_id",section);v.put("weekday",Input.integer(f,"weekday",2,8));v.put("start_period",start);v.put("period_count",count);v.put("room",Input.text(f,"room",30));}
  }
  if(id==null){db.update("INSERT INTO "+k+" ("+String.join(",",v.keySet())+") VALUES ("+String.join(",",Collections.nCopies(v.size(),"?"))+")",v.values().toArray());}
  else{var a=new ArrayList<>(v.values());a.add(id);if(db.update("UPDATE "+k+" SET "+String.join(",",v.keySet().stream().map(x->x+"=?").toList())+" WHERE id=?",a.toArray())==0)throw new IllegalArgumentException("Bản ghi không còn tồn tại hoặc không có thay đổi.");}
 });}
 public void delete(AppUser u,String k,long id){identity.manager(u);valid(k);tx.executeWithoutResult(t->{if(k.equals("sections"))lockEmpty(id);if(k.equals("schedules"))lockEmpty(((Number)row(k,id).get("section_id")).longValue());if(db.update("DELETE FROM "+k+" WHERE id=?",id)!=1)throw new IllegalArgumentException("Bản ghi không tồn tại.");});}
 public List<Map<String,Object>> accounts(AppUser u){identity.admin(u);return db.queryForList("SELECT a.id,a.username,a.role,a.active,COALESCE(s.full_name,l.full_name,a.username) AS display_name FROM accounts a LEFT JOIN students s ON s.account_id=a.id LEFT JOIN lecturers l ON l.account_id=a.id ORDER BY a.id");}
 public void toggle(AppUser u,long id){identity.admin(u);if(id==u.getId())throw new IllegalArgumentException("Không thể khóa tài khoản đang sử dụng.");db.update("UPDATE accounts SET active=IF(active=1,0,1) WHERE id=?",id);}
 public void reset(AppUser u,long id,String pass){identity.admin(u);db.update("UPDATE accounts SET password_hash=? WHERE id=?",password(pass),id);}
}
