package vn.btl.teaching;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;
import java.util.*;
import java.math.BigDecimal;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.dao.DataAccessResourceFailureException;
class BusinessServiceTest {
 Identity identity=mock(Identity.class);ProcedureGateway p=mock(ProcedureGateway.class);JdbcTemplate db=mock(JdbcTemplate.class);BusinessService service=new BusinessService(identity,p,db);
 AppUser student=new AppUser(3,"sv001","hash","STUDENT",true),staff=new AppUser(2,"staff","hash","STAFF",true),lecturer=new AppUser(23,"gv001","hash","LECTURER",true);
 @Test void registrationUsesPrincipalStudent(){when(identity.student(student)).thenReturn(1L);service.register(student,20);verify(p).call("sp_register_section",1L,20L);}
 @Test void cancellationAlwaysUsesPrincipal(){when(identity.student(student)).thenReturn(1L);service.cancel(student,99);verify(p).call("sp_cancel_enrollment",1L,99L);}
 @Test void lecturerIdentityCannotComeFromForm(){when(identity.lecturer(lecturer)).thenReturn(1L);service.scores(lecturer,10,Map.of("lecturer_id","999","attendance","8","midterm","6","final","5"));verify(p).call("sp_update_scores",1L,10L,new BigDecimal("8"),new BigDecimal("6"),new BigDecimal("5"));}
 @Test void scoresAllowNullButRejectOutOfRange(){when(identity.lecturer(lecturer)).thenReturn(1L);service.scores(lecturer,10,Map.of());verify(p).call("sp_update_scores",1L,10L,null,null,null);assertThrows(IllegalArgumentException.class,()->service.scores(lecturer,10,Map.of("final","10.01")));}
 Map<String,String> payment(){return Map.of("student_id","1","semester_id","6","receipt_code","TEST-R","amount","100000","collector_account_id","999");}
 @Test void collectorComesFromLoggedInAccount(){service.payment(staff,payment());verify(p).call("sp_record_payment",1L,6L,2L,"TEST-R",new BigDecimal("100000"),null);}
 @Test void identicalReceiptAfterConnectionLossIsNotCollectedTwice(){when(p.call(anyString(),any(),any(),any(),any(),any(),any())).thenThrow(new DataAccessResourceFailureException("lost"));when(db.queryForList("SELECT student_id,semester_id,collector_account_id,amount FROM payments WHERE receipt_code=?","TEST-R")).thenReturn(List.of(Map.of("student_id",1L,"semester_id",6L,"collector_account_id",2L,"amount",new BigDecimal("100000.00"))));assertTrue(service.payment(staff,payment()).contains("không thu thêm"));verify(p,times(1)).call(anyString(),any(),any(),any(),any(),any(),any());}
 @Test void reusedReceiptForOtherAmountIsRejected(){when(p.call(anyString(),any(),any(),any(),any(),any(),any())).thenThrow(new DataAccessResourceFailureException("lost"));when(db.queryForList("SELECT student_id,semester_id,collector_account_id,amount FROM payments WHERE receipt_code=?","TEST-R")).thenReturn(List.of(Map.of("student_id",1L,"semester_id",6L,"collector_account_id",2L,"amount",new BigDecimal("200000"))));assertThrows(IllegalArgumentException.class,()->service.payment(staff,payment()));}
 @Test void precisionValidatedBeforeDatabase(){assertThrows(IllegalArgumentException.class,()->Input.money(Map.of("amount","1.001"),"amount"));assertThrows(IllegalArgumentException.class,()->Input.score("0.001"));assertNull(Input.score(""));assertThrows(IllegalArgumentException.class,()->Input.id(Map.of("id","-1"),"id"));}
}
