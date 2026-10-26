package vn.btl.teaching;
import java.text.NumberFormat;
import java.util.*;
import java.math.BigDecimal;
import org.springframework.stereotype.Component;
@Component("display") public class Display {
 public String money(Object v){return NumberFormat.getNumberInstance(Locale.forLanguageTag("vi-VN")).format(v==null?BigDecimal.ZERO:v)+" đ";}
 public String cell(Object v,CatalogService.Field f){if(v==null)return "—";for(var o:f.options())if(v.toString().equals(o.get("id").toString()))return o.get("label").toString();if(f.name().contains("price"))return money(v);return v.toString();}
 public String role(String r){return switch(r){case "ADMIN"->"Quản trị viên";case "STAFF"->"Nhân viên";case "LECTURER"->"Giảng viên";case "STUDENT"->"Sinh viên";default->r;};}
 public String status(Object o){return switch(String.valueOf(o)){case "OPEN"->"Đang mở";case "DRAFT"->"Chưa mở";case "CLOSED"->"Đã đóng";case "ACTIVE"->"Đang học";case "CANCELLED"->"Đã hủy";default->String.valueOf(o);};}
 public BigDecimal sum(List<Map<String,Object>> rows,String key){return rows.stream().map(x->new BigDecimal(String.valueOf(x.get(key)))).reduce(BigDecimal.ZERO,BigDecimal::add);}
}
