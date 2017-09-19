package sesoc.global.redocean;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	

	@RequestMapping(value = "loginform")
	public String login() {
		return "loginform";
	}

	@RequestMapping(value = "login")
	public String login(
			String email
			, String password
			, HttpSession ss) {
		mapper = sqlsession.getMapper(MemberDao.class);
		Member mem = mapper.select(email);
		System.out.println(mem);
		// 비번 검사
		if (mem != null && mem.getPassword().equals(password)) {

			ss.setAttribute("email", email);
			ss.setAttribute("name", mem.getName());
			//관리자 계정 확인
			if (mem.getType() == 2) {
				if (mem.getType() != 0) {
					// 탈퇴자
					return "";
				}
				ss.setAttribute("type", mem.getType());
				System.out.println(mem.getType());
			}
			return "redirect:/";

		}
		return "redirect:loginform";
	}

	@RequestMapping(value ="logout")
	public String logout(HttpSession ss) {
		ss.invalidate();
		return "redirect:/";
	}
	
	
	
	
}
