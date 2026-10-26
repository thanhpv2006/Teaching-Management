package vn.btl.teaching;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Map;
public final class Input {
 private Input(){}
 public static String text(Map<String,String> f,String key,int max){String v=f.getOrDefault(key,"").trim();if(v.isEmpty()||v.length()>max)throw new IllegalArgumentException("Trường "+key+" bắt buộc, tối đa "+max+" ký tự.");return v;}
 public static String optional(Map<String,String> f,String key,int max){String v=f.getOrDefault(key,"").trim();if(v.length()>max)throw new IllegalArgumentException("Trường "+key+" tối đa "+max+" ký tự.");return v.isEmpty()?null:v;}
 public static long id(Map<String,String> f,String key){try{long x=Long.parseLong(f.getOrDefault(key,""));if(x>0)return x;}catch(NumberFormatException ignored){}throw new IllegalArgumentException("Vui lòng chọn "+key+" hợp lệ.");}
 public static int integer(Map<String,String> f,String key,int min,int max){long v=id(f,key);if(v<min||v>max)throw new IllegalArgumentException("Giá trị "+key+" phải trong "+min+"–"+max);return (int)v;}
 public static BigDecimal money(Map<String,String> f,String key){try{BigDecimal v=new BigDecimal(f.getOrDefault(key,""));if(v.signum()>0&&v.scale()<=2&&v.compareTo(new BigDecimal("9999999999.99"))<=0)return v;}catch(NumberFormatException ignored){}throw new IllegalArgumentException("Số tiền phải lớn hơn 0, tối đa 9.999.999.999,99 và không quá 2 số lẻ.");}
 public static BigDecimal score(String v){if(v==null||v.isBlank())return null;try{BigDecimal n=new BigDecimal(v);if(n.signum()>=0&&n.compareTo(BigDecimal.TEN)<=0&&n.scale()<=2)return n;}catch(NumberFormatException ignored){}throw new IllegalArgumentException("Điểm phải từ 0 đến 10, tối đa 2 số lẻ; để trống nếu chưa có điểm.");}
 public static LocalDate date(Map<String,String> f,String key){try{return LocalDate.parse(f.getOrDefault(key,""));}catch(Exception e){throw new IllegalArgumentException("Ngày "+key+" không hợp lệ.");}}
}
