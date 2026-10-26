package vn.btl.teaching;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;
import javax.sql.DataSource;
import java.sql.*;
import org.junit.jupiter.api.Test;
import org.springframework.transaction.support.TransactionSynchronizationManager;
class ProcedureGatewayTest {
 @Test void rejectsOuterTransactionBeforeAcquiringConnection() throws Exception {DataSource ds=mock(DataSource.class);TransactionSynchronizationManager.setActualTransactionActive(true);try{assertThrows(IllegalStateException.class,()->new ProcedureGateway(ds).call("sp_register_section",1,2));verifyNoInteractions(ds);}finally{TransactionSynchronizationManager.setActualTransactionActive(false);}}
 @Test void rejectsNonAutocommitConnection() throws Exception {DataSource ds=mock(DataSource.class);Connection c=mock(Connection.class);when(ds.getConnection()).thenReturn(c);when(c.getAutoCommit()).thenReturn(false);assertThrows(IllegalStateException.class,()->new ProcedureGateway(ds).call("sp_register_section",1,2));verify(c).close();}
 @Test void disallowsArbitraryProcedureNames(){assertThrows(IllegalArgumentException.class,()->new ProcedureGateway(mock(DataSource.class)).call("other_procedure"));}
}
