package vn.btl.teaching;
import java.util.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
@Repository public class Queries {
 private final JdbcTemplate db;private final Identity identity;
 public Queries(JdbcTemplate d,Identity i){db=d;identity=i;}
 public List<Map<String,Object>> semesters(){return db.queryForList("SELECT id,code,name FROM semesters ORDER BY start_date DESC,id DESC");}
 public long defaultSemester(){var r=db.queryForList("SELECT id FROM semesters ORDER BY (code='D6_DEMO') DESC,start_date DESC,id DESC LIMIT 1");return r.isEmpty()?0:((Number)r.get(0).get("id")).longValue();}
 public List<Map<String,Object>> students(){return db.queryForList("SELECT id,code,full_name FROM students ORDER BY code");}
 public List<Map<String,Object>> sections(AppUser u,long sem,String q){
  String sql="SELECT sec.*,c.name AS course_name,l.full_name AS lecturer_name,COALESCE(cnt.n,0) AS active_count,sem.name AS semester_name,(sec.start_date>CURRENT_DATE()) AS before_start,(sec.credits_snapshot*sec.unit_price_snapshot) AS tuition FROM sections sec JOIN courses c ON c.id=sec.course_id JOIN lecturers l ON l.id=sec.lecturer_id JOIN semesters sem ON sem.id=sec.semester_id LEFT JOIN (SELECT section_id,COUNT(*) n FROM enrollments WHERE status='ACTIVE' GROUP BY section_id) cnt ON cnt.section_id=sec.id WHERE sec.semester_id=? AND (sec.code LIKE ? OR c.name LIKE ?)";
  var args=new ArrayList<Object>(List.of(sem,"%"+q+"%","%"+q+"%"));
  if(u.getRole().equals("LECTURER")){sql+=" AND sec.lecturer_id=?";args.add(identity.lecturer(u));}
  return db.queryForList(sql+" ORDER BY sec.code",args.toArray());
 }
 public List<Map<String,Object>> roster(AppUser u,long section){
  if(u.getRole().equals("STUDENT"))throw new org.springframework.security.access.AccessDeniedException("Sinh viên không được xem danh sách lớp này.");
  if(u.getRole().equals("LECTURER")){Integer n=db.queryForObject("SELECT COUNT(*) FROM sections WHERE id=? AND lecturer_id=?",Integer.class,section,identity.lecturer(u));if(n==null||n!=1)throw new org.springframework.security.access.AccessDeniedException("Lớp không thuộc phân công của bạn.");}
  return db.queryForList("SELECT * FROM v_class_roster WHERE section_id=? ORDER BY student_code",section);
 }
 public List<Map<String,Object>> enrollments(AppUser u,long sem){return db.queryForList("SELECT e.id,e.status,sec.code,c.name,sec.start_date,(sec.start_date>CURRENT_DATE()) AS before_start,e.registered_at FROM enrollments e JOIN sections sec ON sec.id=e.section_id JOIN courses c ON c.id=sec.course_id WHERE e.student_id=? AND sec.semester_id=? ORDER BY e.registered_at DESC",identity.student(u),sem);}
 public List<Map<String,Object>> grades(AppUser u,long sem){String sql="SELECT * FROM v_student_grades WHERE semester_id=?";var a=new ArrayList<Object>();a.add(sem);if(u.getRole().equals("STUDENT")){sql+=" AND student_id=?";a.add(identity.student(u));}else if(u.getRole().equals("LECTURER")){sql+=" AND lecturer_id=?";a.add(identity.lecturer(u));}return db.queryForList(sql+" ORDER BY section_code,student_code",a.toArray());}
 public List<Map<String,Object>> tuition(AppUser u,long sem,String q){String sql="SELECT * FROM v_tuition_summary WHERE semester_id=? AND (student_code LIKE ? OR student_name LIKE ?)";var a=new ArrayList<Object>(List.of(sem,"%"+q+"%","%"+q+"%"));if(u.getRole().equals("STUDENT")){sql+=" AND student_id=?";a.add(identity.student(u));}else identity.manager(u);return db.queryForList(sql+" ORDER BY student_code",a.toArray());}
 public List<Map<String,Object>> payments(AppUser u,long sem){String sql="SELECT p.*,s.code AS student_code,s.full_name AS student_name,a.username AS collector FROM payments p JOIN students s ON s.id=p.student_id JOIN accounts a ON a.id=p.collector_account_id WHERE p.semester_id=?";var a=new ArrayList<Object>();a.add(sem);if(u.getRole().equals("STUDENT")){sql+=" AND p.student_id=?";a.add(identity.student(u));}else identity.manager(u);return db.queryForList(sql+" ORDER BY p.paid_at DESC,p.id DESC",a.toArray());}
 public List<Map<String,Object>> schedules(AppUser u,long sem){String sql="SELECT sec.code,c.name AS course_name,l.full_name AS lecturer_name,s.weekday,s.start_period,s.period_count,s.room FROM schedules s JOIN sections sec ON sec.id=s.section_id JOIN courses c ON c.id=sec.course_id JOIN lecturers l ON l.id=sec.lecturer_id WHERE sec.semester_id=?";var a=new ArrayList<Object>();a.add(sem);if(u.getRole().equals("STUDENT")){sql+=" AND EXISTS(SELECT 1 FROM enrollments e WHERE e.section_id=sec.id AND e.student_id=? AND e.status='ACTIVE')";a.add(identity.student(u));}else if(u.getRole().equals("LECTURER")){sql+=" AND sec.lecturer_id=?";a.add(identity.lecturer(u));}return db.queryForList(sql+" ORDER BY s.weekday,s.start_period,sec.code",a.toArray());}
}
