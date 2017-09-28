package sesoc.global.redocean;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sesoc.global.redocean.dao.BoardDao;
import sesoc.global.redocean.dao.MemberDao;
import sesoc.global.redocean.vo.Mainboard;
import sesoc.global.redocean.vo.Member;

@Controller
public class MemberController {

	@Autowired
	SqlSession sqlsession;
	MemberDao mapper;

	// 회원가입 폼으로 이동
	@RequestMapping(value = "joinform")
	public String join() {
		return "joinform";
	}

	// 회원가입 처리
	@RequestMapping(value = "join")
	public String join(Member m) {
		System.out.println(m);
		mapper = sqlsession.getMapper(MemberDao.class);
		mapper.insert(m);

		return "home";
	}

	// 이메일 체크
	@ResponseBody
	@RequestMapping(value = "idcheck")
	public String idcheck(String email) {
		mapper = sqlsession.getMapper(MemberDao.class);
		Member m = mapper.select(email);
		if (m == null) {

		}
		return "";
	}

	// 로그인 폼으로 이동
	@RequestMapping(value = "login")
	public String login() {
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
             return "Member/login";
          }
          return "redirect:/index";

       }
       return "redirect:Member/login";
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
          return "Member/login";
       } 
       else {
          return "redirect:/";
       }
    }
	
	//로그아웃 처리
	@RequestMapping(value = "logout")
	public String logout(HttpSession ss) {
		ss.invalidate();
		return "redirect:/";
	}
	
	//myPage로 이동
	@RequestMapping(value="myPage",method=RequestMethod.GET)
	public String mypage(){
		return "Member/myPage";
	}
	   
	//myStory로 이동
	@RequestMapping(value="myStory",method=RequestMethod.GET)
	public String myStory(Model model, HttpSession ss){
		BoardDao m = sqlsession.getMapper(BoardDao.class);
		String email = (String)ss.getAttribute("email");
		ArrayList<Mainboard> myList = m.myList(email);
		
		String[] aa; 
		String bb; 
		
		for(Mainboard board : myList){
			
			bb = board.getContent(); //글자수
			int bbb = bb.length();
			
			if(bbb < 30){
				aa = board.getContent().split("\r\n");	//다음줄
				String aaa = aa[0];
				board.setContent(aaa);
			}else{
				String ccc = bb.substring(0, 20);
				board.setContent(ccc);
			}
			
			String str = board.getContent().replaceAll("\r\n", "<br>");
			board.setContent(str);
		}
		
		
		model.addAttribute("myList", myList);
		
	      return "Member/myStory";
	}
	
	//myDonation로 이동
	/*@RequestMapping(value="myDonation",method=RequestMethod.GET)
	public String myDonation(){
	    return "Member/myDonation";
	}*/

}
