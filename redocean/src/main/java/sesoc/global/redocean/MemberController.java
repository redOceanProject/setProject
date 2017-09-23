package sesoc.global.redocean;



import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sesoc.global.redocean.dao.MemberDao;
import sesoc.global.redocean.vo.Member;

@Controller
public class MemberController {
	@Autowired
	SqlSession sqlsession;
	MemberDao mapper;

	@RequestMapping(value = "joinform")
	public String join() {
		return "joinform";
	}

	@RequestMapping(value = "join")
	public String join(Member m) {
		System.out.println(m);
		mapper = sqlsession.getMapper(MemberDao.class);
		mapper.insert(m);

		return "home";
	}
	
	//이메일 체크
	@ResponseBody
	@RequestMapping(value = "idcheck")
	public String idcheck(String email) {
		mapper = sqlsession.getMapper(MemberDao.class);
		Member m = mapper.select(email);
		if (m==null) {
			
		}
		return"";
	}
	
	//로그인폼
	@RequestMapping(value="login")
	public String login(){
		return "Member/login";
	}
	
	
	@RequestMapping(value = "login", method=RequestMethod.POST)
	   public String login(
	         String email
	         , String password
	         , HttpSession ss) {
	      System.out.println(email);
	      System.out.println(password);
	      mapper = sqlsession.getMapper(MemberDao.class);
	      Member mem = mapper.select(email);
	      System.out.println(mem);
	      // 비번 검사
	      if (mem != null && mem.getPassword().equals(password)) {

	         ss.setAttribute("email", email);
	         ss.setAttribute("name", mem.getName());
	         if (mem.getType() != 0) {
	            // 탈퇴자
	            if (mem.getType() == 2) {
	               //관리자 계정 확인
	               ss.setAttribute("type", mem.getType());
	               System.out.println(mem.getType());
	            }
	            return "loginform";
	         }
	         return "redirect:/index";

	      }
	      return "redirect:loginform";
	   }

	
	//회원탈퇴시 type이  1로 변함
	   @RequestMapping(value="unRegistered", method=RequestMethod.GET)   //왜 GET인지 POST가 아니고   
	   public String delete(String email, HttpSession session) {
	      //
	      
	      mapper = sqlsession.getMapper(MemberDao.class);
	      email= (String) session.getAttribute("email");
	      int result = mapper.delete(email);
	      System.out.println(result);
	      if(result == 1) {
	         return "loginform";
	      } 
	      else {
	         return "redirect:/";
	      }
	   }
	
	@RequestMapping(value ="logout")
	public String logout(HttpSession ss) {
		ss.invalidate();
		return "redirect:/";
	}
	
	
	
	
}
