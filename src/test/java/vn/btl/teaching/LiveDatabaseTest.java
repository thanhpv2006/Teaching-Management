package vn.btl.teaching;
import static org.junit.jupiter.api.Assertions.*;
import java.sql.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.EnabledIfEnvironmentVariable;
@EnabledIfEnvironmentVariable(named="BTL_LIVE_TESTS",matches="true") class LiveDatabaseTest {
 @Test void readOnlyContractOnUsersMysql() throws Exception {
 String url=System.getenv().getOrDefault("BTL_DB_URL","jdbc:mysql://localhost:3306/teaching_management?connectionTimeZone=%2B07:00&forceConnectionTimeZoneToSession=true");
 try(Connection c=DriverManager.getConnection(url,System.getenv().getOrDefault("BTL_DB_USERNAME","app_user"),System.getenv("BTL_DB_PASSWORD"));Statement s=c.createStatement()){
 c.setReadOnly(true);try(ResultSet r=s.executeQuery("SELECT CURRENT_USER(),DATABASE()")){assertTrue(r.next());assertTrue(r.getString(1).startsWith("app_user@"));assertEquals("teaching_management",r.getString(2));}
 for(String view:new String[]{"v_class_roster","v_student_grades","v_tuition_summary"})try(ResultSet r=s.executeQuery("SELECT * FROM "+view+" LIMIT 1")){assertTrue(r.getMetaData().getColumnCount()>0);}
 }
 }
}
