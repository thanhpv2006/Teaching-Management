package vn.btl.teaching;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.*;
import static org.mockito.Mockito.*;
import java.util.*;
import java.sql.Date;
import java.math.BigDecimal;
import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.security.core.context.SecurityContextHolder;
@SpringBootTest @AutoConfigureMockMvc class WebFlowTest {
 @Autowired MockMvc web; @MockitoBean JdbcTemplate db;
 static Map<String,Object> row(Object... v){var m=new LinkedHashMap<String,Object>();for(int i=0;i<v.length;i+=2)m.put(v[i].toString(),v[i+1]);return m;}
 static final Map<String,Object> SEM=row("id",6L,"code","D6_DEMO","name","Học kỳ demo");
 static final Map<String,Object> SECTION=row("id",20L,"code","D6_CSDL","course_name","Cơ sở dữ liệu","lecturer_name","Giảng viên Demo 01","active_count",10L,"max_students",30,"start_date",Date.valueOf("2030-11-09"),"status","OPEN","before_start",1L,"tuition",new BigDecimal("1500000"),"lecturer_id",1L);
 static final Map<String,Object> GRADE=row("enrollment_id",20L,"student_code","SV001","student_name","Sinh viên Demo 01","section_code","D6_CSDL","course_name","Cơ sở dữ liệu","attendance_score",new BigDecimal("8"),"midterm_score",new BigDecimal("6"),"final_score",new BigDecimal("5"),"total_score",new BigDecimal("5.60"),"grade_status","Đạt");
 static final Map<String,Object> TUITION=row("student_id",1L,"student_code","SV001","student_name","Sinh viên Demo 01","total_tuition",new BigDecimal("3000000"),"total_paid",new BigDecimal("1000000"),"outstanding",new BigDecimal("2000000"),"credit",BigDecimal.ZERO);
 @BeforeEach void fixtures(){
  doAnswer(a->{Class<?> t=a.getArgument(1);if(t==Long.class)return 1L;if(t==Integer.class)return 1;return null;}).when(db).queryForObject(anyString(),any(Class.class),any(Object[].class));
  org.mockito.stubbing.Answer<List<Map<String,Object>>> answer=a->{String sql=a.getArgument(0);if(sql.startsWith("SELECT id FROM semesters"))return List.of(row("id",6L));if(sql.startsWith("SELECT id,code,name FROM semesters"))return List.of(SEM);
   if(sql.startsWith("SELECT sec.*"))return List.of(SECTION);
   if(sql.contains("FROM v_student_grades"))return List.of(GRADE);
   if(sql.contains("FROM v_tuition_summary"))return List.of(TUITION);
   if(sql.contains("FROM v_class_roster"))return List.of(row("student_code","SV001","student_name","Sinh viên Demo 01","admin_class_code","D26CN01","section_code","D6_CSDL","registered_at","2026-10-26 10:00"));
   if(sql.contains("FROM schedules s JOIN"))return List.of(row("code","D6_CSDL","course_name","Cơ sở dữ liệu","lecturer_name","Giảng viên Demo 01","weekday",2,"start_period",1,"period_count",3,"room","A101"));
   if(sql.startsWith("SELECT p.*"))return List.of(row("receipt_code","D6-R001","student_code","SV001","student_name","Sinh viên Demo 01","amount",new BigDecimal("1000000"),"paid_at","2026-10-26 10:00","collector","staff","note","Thu học phí"));
   if(sql.startsWith("SELECT e.id"))return List.of(row("id",20L,"status","ACTIVE","code","D6_CSDL","name","Cơ sở dữ liệu","start_date",Date.valueOf("2030-11-09"),"before_start",1L));
   if(sql.startsWith("SELECT a.id,a.username"))return List.of(row("id",3L,"username","sv001","role","STUDENT","active",true,"display_name","Sinh viên Demo 01"));
   if(sql.contains(" AS label"))return List.of(row("id",1L,"label","Mã · Tên"));
   if(sql.startsWith("SELECT id,code,full_name FROM students"))return List.of(row("id",1L,"code","SV001","full_name","Sinh viên Demo 01"));
   if(sql.contains(" FROM courses"))return List.of(row("id",1L,"code","CSDL","name","Cơ sở dữ liệu","credits",3));
   if(sql.startsWith("SELECT * FROM sections"))return List.of(SECTION);
   return List.of();
  };doAnswer(answer).when(db).queryForList(anyString(),any(Object[].class));doAnswer(answer).when(db).queryForList(anyString());
  doAnswer(a->List.of(1L)).when(db).query(startsWith("SELECT id FROM students"),any(RowMapper.class),any(Object[].class));
  doAnswer(a->List.of(1L)).when(db).query(startsWith("SELECT id FROM lecturers"),any(RowMapper.class),any(Object[].class));
  doAnswer(a->List.of(new AppUser(3,"sv001","$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num","STUDENT",true))).when(db).query(startsWith("SELECT id,username"),any(RowMapper.class),any(Object[].class));
 }
 AppUser principal(String role){return new AppUser(role.equals("ADMIN")?1:role.equals("STAFF")?2:role.equals("LECTURER")?23:3,role.toLowerCase(),"hash",role,true);}
 @Test void loginIsAccessibleAndContainsCsrf() throws Exception {web.perform(get("/login")).andExpect(status().isOk()).andExpect(content().string(org.hamcrest.Matchers.containsString("_csrf")));}
 @Test void validLoginUsesExistingBcryptHash() throws Exception {web.perform(post("/login").with(csrf()).param("username","sv001").param("password","BtlDemo@2026")).andExpect(status().is3xxRedirection()).andExpect(redirectedUrl("/"));}
 @Test void invalidLoginIsRejected() throws Exception {web.perform(post("/login").with(csrf()).param("username","sv001").param("password","wrong")).andExpect(redirectedUrl("/login?error"));}
 @Test void csrfRequiredForMutations() throws Exception {web.perform(post("/student/register").with(user(principal("STUDENT"))).param("sectionId","20").param("semester","6")).andExpect(status().isForbidden());}
 @Test void unauthenticatedCannotSeeData() throws Exception {web.perform(get("/tuition")).andExpect(status().is3xxRedirection());}
 @ParameterizedTest @ValueSource(strings={"ADMIN","STAFF","STUDENT","LECTURER"}) void commonScreensRender(String role) throws Exception {for(String url:List.of("/","/sections?semester=6","/grades?semester=6","/schedule?semester=6")){web.perform(get(url).with(user(principal(role)))).andExpect(status().isOk()).andExpect(content().string(org.hamcrest.Matchers.not(org.hamcrest.Matchers.containsString("Chưa thể hoàn tất yêu cầu"))));}}
 @ParameterizedTest @ValueSource(strings={"ADMIN","STAFF","STUDENT"}) void financialScreensRender(String role) throws Exception {web.perform(get("/tuition?semester=6").with(user(principal(role)))).andExpect(status().isOk());web.perform(get("/payments?semester=6").with(user(principal(role)))).andExpect(status().isOk());}
 @Test void lecturerCannotReadPaymentsOrAdmin() throws Exception {for(String url:List.of("/tuition","/payments","/manage"))web.perform(get(url).with(user(principal("LECTURER")))).andExpect(status().isForbidden());}
 @Test void studentCannotManageOrSubmitScores() throws Exception {web.perform(get("/manage").with(user(principal("STUDENT")))).andExpect(status().isForbidden());web.perform(post("/lecturer/scores/20").with(user(principal("STUDENT"))).with(csrf()).param("semester","6")).andExpect(status().isForbidden());}
 @Test void staffCannotManageAccounts() throws Exception {web.perform(get("/manage/accounts").with(user(principal("STAFF")))).andExpect(status().isForbidden());}
 @Test void lecturerFormAndRosterRender() throws Exception {web.perform(get("/lecturer/scores/20?semester=6").with(user(principal("LECTURER")))).andExpect(status().isOk());web.perform(get("/sections/20/roster").with(user(principal("LECTURER")))).andExpect(status().isOk());}
 @Test void studentCannotViewOtherClassRoster() throws Exception {web.perform(get("/sections/20/roster").with(user(principal("STUDENT")))).andExpect(status().isForbidden());}
 @Test void adminCatalogScreensRender() throws Exception {var admin=user(principal("ADMIN"));for(String url:List.of("/manage","/manage/accounts","/manage/courses","/manage/courses/1/edit","/manage/sections","/manage/sections/20/edit"))web.perform(get(url).with(admin)).andExpect(status().isOk());for(String k:List.of("courses","semesters","admin_classes","students","lecturers","sections","schedules"))web.perform(get("/manage/"+k+"/new").with(admin)).andExpect(status().isOk());}
 @Test void nonemptyFinancialRowsDoNotShowEmptyState() throws Exception {web.perform(get("/tuition?semester=6").with(user(principal("ADMIN")))).andExpect(status().isOk()).andExpect(content().string(org.hamcrest.Matchers.not(org.hamcrest.Matchers.containsString("Chưa có dữ liệu phù hợp"))));}
 @Test void genuinelyEmptyFinancialRowsShowHelpfulState() throws Exception {doReturn(List.of()).when(db).queryForList(contains("FROM v_tuition_summary"),any(Object[].class));web.perform(get("/tuition?semester=6").with(user(principal("ADMIN")))).andExpect(status().isOk()).andExpect(content().string(org.hamcrest.Matchers.containsString("Chưa có dữ liệu phù hợp")));}
 @Test void previewRenderedPages() throws Exception {
  var dir=java.nio.file.Path.of("target/preview");java.nio.file.Files.createDirectories(dir);
  for(String name:List.of("login","home","sections","tuition","grades","manage")){
   String url=switch(name){case "login"->"/login";case "home"->"/";default->"/"+name+"?semester=6";};
   String html=web.perform(get(url).with(user(principal("ADMIN")))).andExpect(status().isOk()).andReturn().getResponse().getContentAsString(java.nio.charset.StandardCharsets.UTF_8);
   java.nio.file.Files.writeString(dir.resolve(name+".html"),html);
  }
 }

 @Test void scopedQueriesContainPrincipalFilter() throws Exception {web.perform(get("/grades?semester=6&student_id=999").with(user(principal("STUDENT")))).andExpect(status().isOk());verify(db).queryForList(contains("FROM v_student_grades WHERE semester_id=? AND student_id=?"),eq(6L),eq(1L));}
}
