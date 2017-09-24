package sesoc.global.redocean;

import java.util.ArrayList;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sesoc.global.redocean.dao.BoardDao;
import sesoc.global.redocean.vo.Mainboard;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	SqlSession sqlsession;
	BoardDao mapper;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//index화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		mapper = sqlsession.getMapper(BoardDao.class);
		ArrayList<Mainboard> list = mapper.list();
		
		//내용 미리보기 만드는 중
		/*ArrayList<String> contentList = new ArrayList<>();
		for (Mainboard mainboard : list) {
			contentList.add(mainboard.getContent());
		}
		
		for (String string : contentList) {
			System.out.println(string);
		}*/
		
		model.addAttribute("list", list);
		return "index";
	}
	
	@RequestMapping(value = "index")
	public String index() {
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "check" 
	, produces = "application/json;charset=UTF-8")
	public String check( String prefer) {
		System.out.println(prefer);
		mapper = sqlsession.getMapper(BoardDao.class);
		Mainboard recent = mapper.selectlist();
		String present = recent.getTitle();
		if (present.equals(prefer)) {
			return prefer;
		}else {
			return present;
		}
		
	}
	
}
