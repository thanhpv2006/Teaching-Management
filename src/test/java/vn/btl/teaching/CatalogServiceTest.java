package vn.btl.teaching;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;
import java.sql.Date;
import java.util.*;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.SimpleTransactionStatus;
import org.springframework.dao.DuplicateKeyException;
class CatalogServiceTest {
 JdbcTemplate db=mock(JdbcTemplate.class);PlatformTransactionManager tm=mock(PlatformTransactionManager.class);PasswordEncoder encoder=mock(PasswordEncoder.class);Identity identity=mock(Identity.class);AppUser admin=new AppUser(1,"admin","hash","ADMIN",true);
 CatalogService service(){when(tm.getTransaction(any())).thenReturn(new SimpleTransactionStatus());return new CatalogService(db,tm,encoder,identity);}
 @Test void catalogNameCannotInjectSql(){assertThrows(IllegalArgumentException.class,()->service().list("courses; DROP TABLE accounts"));verifyNoInteractions(db);}
 @Test void profileAndAccountAreOneJavaTransaction(){var s=service();when(encoder.encode("NewPass123")).thenReturn("hash");when(db.queryForObject("SELECT id FROM accounts WHERE username=?",Long.class,"newstudent")).thenReturn(42L);s.save(admin,"students",null,Map.of("code","SV099","full_name","Nguyễn An","email","an@example.com","admin_class_id","1","username","newstudent","password","NewPass123"));verify(db).update("INSERT INTO accounts(username,password_hash,role,active) VALUES(?,?,?,1)","newstudent","hash","STUDENT");verify(db).update(eq("INSERT INTO students (code,full_name,email,admin_class_id,account_id) VALUES (?,?,?,?,?)"),eq("SV099"),eq("Nguyễn An"),eq("an@example.com"),eq(1L),eq(42L));verify(tm).commit(any());}
 @Test void profileFailureRollsBackAccountCreation(){var s=service();when(encoder.encode(any())).thenReturn("hash");when(db.queryForObject("SELECT id FROM accounts WHERE username=?",Long.class,"newstudent")).thenReturn(42L);when(db.update(startsWith("INSERT INTO students"),any(Object[].class))).thenThrow(new DuplicateKeyException("duplicate"));assertThrows(DuplicateKeyException.class,()->s.save(admin,"students",null,Map.of("code","SV099","full_name","Nguyễn An","admin_class_id","1","username","newstudent","password","NewPass123")));verify(tm).rollback(any());}
 @Test void activeSectionCannotChangeLecturer(){var s=service();when(db.queryForObject(contains("SELECT COUNT(*) FROM lecturers"),eq(Long.class),eq(2L))).thenReturn(1L);when(db.queryForObject("SELECT COUNT(*) FROM enrollments WHERE section_id=? AND status='ACTIVE'",Long.class,20L)).thenReturn(10L);when(db.queryForList("SELECT * FROM sections WHERE id=?",20L)).thenReturn(List.of(Map.of("lecturer_id",1L,"start_date",Date.valueOf("2030-11-09"),"status","OPEN")));assertThrows(IllegalArgumentException.class,()->s.save(admin,"sections",20L,Map.of("code","D6_CSDL","lecturer_id","2","max_students","30","start_date","2030-11-09","status","OPEN")));verify(db,never()).update(startsWith("UPDATE sections"),any(Object[].class));verify(tm).rollback(any());}
 @Test void adminCannotLockSelf(){assertThrows(IllegalArgumentException.class,()->service().toggle(admin,1L));verifyNoInteractions(db);}
}
