package vn.btl.teaching;
import java.util.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.dao.DataAccessException;
@Service public class BusinessService {
 private final Identity identity;private final ProcedureGateway routines;private final JdbcTemplate db;
 public BusinessService(Identity i,ProcedureGateway p,JdbcTemplate d){identity=i;routines=p;db=d;}
 public void register(AppUser u,long section){routines.call("sp_register_section",identity.student(u),section);}
 public void cancel(AppUser u,long enrollment){routines.call("sp_cancel_enrollment",identity.student(u),enrollment);}
 public void scores(AppUser u,long enrollment,Map<String,String> f){routines.call("sp_update_scores",identity.lecturer(u),enrollment,Input.score(f.get("attendance")),Input.score(f.get("midterm")),Input.score(f.get("final")));}
 public String payment(AppUser u,Map<String,String> f){
  identity.manager(u);long student=Input.id(f,"student_id"),semester=Input.id(f,"semester_id");String receipt=Input.text(f,"receipt_code",30);var amount=Input.money(f,"amount");String note=Input.optional(f,"note",255);
  try{routines.call("sp_record_payment",student,semester,u.getId(),receipt,amount,note);return "Đã ghi nhận phiếu thu "+receipt+".";}
  catch(DataAccessException e){
   // On timeout/retry, never change receipt code. Reconcile exact financial identity first.
   var existing=db.queryForList("SELECT student_id,semester_id,collector_account_id,amount FROM payments WHERE receipt_code=?",receipt);
   if(!existing.isEmpty()){var r=existing.get(0);boolean match=((Number)r.get("student_id")).longValue()==student&&((Number)r.get("semester_id")).longValue()==semester&&((Number)r.get("collector_account_id")).longValue()==u.getId()&&new java.math.BigDecimal(r.get("amount").toString()).compareTo(amount)==0;
    if(match)return "Phiếu "+receipt+" đã được ghi nhận trước đó; không thu thêm lần nữa.";
    throw new IllegalArgumentException("Mã phiếu đã được dùng cho một khoản thu khác. Kiểm tra lịch sử trước khi thao tác tiếp.");
   }throw e;
  }
 }
}
