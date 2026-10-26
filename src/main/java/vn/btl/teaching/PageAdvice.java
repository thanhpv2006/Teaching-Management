package vn.btl.teaching;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.Model;
import jakarta.servlet.http.HttpServletResponse;
@ControllerAdvice public class PageAdvice {
 private final Identity identity;public PageAdvice(Identity i){identity=i;}
 @ModelAttribute void current(@AuthenticationPrincipal AppUser u,Model m){if(u!=null){identity.active(u);m.addAttribute("current",u);}}
 @ExceptionHandler(AccessDeniedException.class) String denied(AccessDeniedException e,Model m,HttpServletResponse r){r.setStatus(403);m.addAttribute("error",e.getMessage());return "forbidden";}
 @ExceptionHandler(Exception.class) String failure(Exception e,Model m,HttpServletResponse r){r.setStatus(e instanceof IllegalArgumentException?400:500);org.slf4j.LoggerFactory.getLogger(PageAdvice.class).warn("Request failed: {}",e.getClass().getSimpleName());m.addAttribute("error",Errors.message(e));return "failure";}
}
