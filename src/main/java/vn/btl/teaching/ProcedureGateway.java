package vn.btl.teaching;
import java.sql.*;
import java.util.*;
import javax.sql.DataSource;
import org.springframework.jdbc.support.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.support.TransactionSynchronizationManager;
@Repository public class ProcedureGateway {
 private final DataSource source;private final SQLExceptionTranslator translator=new SQLStateSQLExceptionTranslator();
 public ProcedureGateway(DataSource source){this.source=source;}
 public Map<String,Object> call(String name,Object... args){
  if(!Set.of("sp_register_section","sp_cancel_enrollment","sp_update_scores","sp_record_payment").contains(name))throw new IllegalArgumentException("Procedure không được hỗ trợ");
  if(TransactionSynchronizationManager.isActualTransactionActive())throw new IllegalStateException("Procedure phải được gọi ngoài transaction Java.");
  String sql="{call "+name+"("+String.join(",",Collections.nCopies(args.length,"?"))+")}";
  try(Connection c=source.getConnection()){
   if(!c.getAutoCommit())throw new IllegalStateException("Connection gọi procedure cần autocommit=true.");
   try(CallableStatement st=c.prepareCall(sql)){
    for(int i=0;i<args.length;i++){if(args[i]==null)st.setNull(i+1,Types.NULL);else st.setObject(i+1,args[i]);}
    Map<String,Object> result=new LinkedHashMap<>();boolean more=st.execute();
    while(true){if(more){try(ResultSet rs=st.getResultSet()){ResultSetMetaData m=rs.getMetaData();while(rs.next()){if(result.isEmpty())for(int k=1;k<=m.getColumnCount();k++)result.put(m.getColumnLabel(k),rs.getObject(k));}}}else if(st.getUpdateCount()==-1)break;more=st.getMoreResults(Statement.CLOSE_CURRENT_RESULT);}
    if(!result.containsKey("id"))throw new IllegalStateException("Procedure không trả id. Kiểm tra hợp đồng SQL.");return result;
   }
  }catch(SQLException e){var converted=translator.translate(name,sql,e);if(converted!=null)throw converted;throw new org.springframework.jdbc.UncategorizedSQLException(name,sql,e);}
 }
}
