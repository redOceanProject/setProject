package sesoc.global.redocean;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sesoc.global.redocean.dao.ReplyDao;
import sesoc.global.redocean.vo.Reply;

@Controller
public class ReplyController {
	@Autowired
	SqlSession sqlsession;
	ReplyDao mapper;
	
	@RequestMapping(value ="getreply"
			)
	public @ResponseBody ArrayList<Reply> getreply(HttpSession ss){
		mapper = sqlsession.getMapper(ReplyDao.class);
		ArrayList<Reply> reply= mapper.selectAll();
		System.out.println(reply);
		return reply;
	}
	
	@RequestMapping(value ="reply"
			)
	public String reply(HttpSession ss
			,Model m){
		mapper = sqlsession.getMapper(ReplyDao.class);
		ArrayList<Reply> reply= mapper.selectAll();
		System.out.println(reply);
		String email = (String) ss.getAttribute("email");
		m.addAttribute("email", email);
		return "reply";
	}
	
	@ResponseBody
	@RequestMapping(value ="enroll"
			, produces="application/json;charset=UTF-8")
	public void enroll(
			Reply re) {
		System.out.println(re);
		mapper = sqlsession.getMapper(ReplyDao.class);
		int i = mapper.insert(re);
		System.out.println(i);
	}
	
	
}
