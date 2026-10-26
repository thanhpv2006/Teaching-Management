package vn.btl.teaching;
import java.util.List;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
public class AppUser extends User {
 private final long id; private final String role;
 public AppUser(long id,String username,String password,String role,boolean active){super(username,password,active,true,true,true,List.of(new SimpleGrantedAuthority("ROLE_"+role)));this.id=id;this.role=role;}
 public long getId(){return id;} public String getRole(){return role;} public boolean isManager(){return role.equals("ADMIN")||role.equals("STAFF");}
}
