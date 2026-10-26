package vn.btl.teaching;
import org.springframework.context.annotation.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
@Configuration public class SecurityConfig {
 @Bean PasswordEncoder passwords(){return new BCryptPasswordEncoder();}
 @Bean UserDetailsService users(JdbcTemplate db){return username -> db.query("SELECT id,username,password_hash,role,active FROM accounts WHERE username=?",(r,n)->new AppUser(r.getLong(1),r.getString(2),r.getString(3),r.getString(4),r.getBoolean(5)),username).stream().findFirst().orElseThrow(()->new UsernameNotFoundException("Tài khoản không tồn tại"));}
 @Bean SecurityFilterChain security(HttpSecurity h) throws Exception {
 h.authorizeHttpRequests(a->a.requestMatchers("/login","/css/**","/js/**","/error").permitAll()
 .requestMatchers("/manage/accounts/**").hasRole("ADMIN")
 .requestMatchers("/manage/**","/payments/record").hasAnyRole("ADMIN","STAFF")
 .requestMatchers("/student/**").hasRole("STUDENT")
 .requestMatchers("/lecturer/**").hasRole("LECTURER")
 .requestMatchers("/tuition","/payments").hasAnyRole("ADMIN","STAFF","STUDENT")
 .anyRequest().authenticated())
 .formLogin(f->f.loginPage("/login").defaultSuccessUrl("/",true).failureUrl("/login?error").permitAll())
 .logout(l->l.logoutSuccessUrl("/login?logout"))
 .exceptionHandling(e->e.accessDeniedPage("/forbidden"));
 return h.build();
 }
}
