package sesoc.global.redocean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sesoc.global.redocean.dao.BloodDao;
import sesoc.global.redocean.vo.Bdcard;

@Controller
public class BloodController {
	@Autowired
	SqlSession sqlsession;
	BloodDao mapper;

	// 바코드 폼가기
	@RequestMapping(value = "barcode")
	public String barcode() {
		return "Blood/barcode";
	}

	// 바코드 찍고 확인하기
	@RequestMapping(value = "findinfo", method = RequestMethod.POST)
	public String register(String num, Model m) {
		num = num.substring(0, 12);
		System.out.println(num);
		mapper = sqlsession.getMapper(BloodDao.class);
		Bdcard bd = mapper.select(num);
		// System.out.println(bd);
		m.addAttribute("list", bd);
		return "bar_result";
	}

	// 내 헌혈증 모아보기
	@RequestMapping(value = "showMYbdlist")
	public String showMYbdlist(HttpSession ss, Model m) {
		mapper = sqlsession.getMapper(BloodDao.class);
		String email = (String) ss.getAttribute("email");
		ArrayList<Bdcard> bdlist = mapper.selectBdlist(email);
		m.addAttribute("list", bdlist);
		return "bdcard";
	}

	// 헌혈 후 일정 시간 지난 후 알람
	@RequestMapping(value = "alarm")
	public String alarm(HttpSession ss, Model m) {
		String email = (String) ss.getAttribute("email");
		int n = alam(email);

		System.out.println("++++" + n);

		m.addAttribute("number", n);
		return "alarm";

	}

	// 알람 메서드(12시마다 체크)
	@Scheduled(cron = "0 0 0 * * ? ")
	public int alam(String email) {
		String n, m;
		mapper = sqlsession.getMapper(BloodDao.class);
		int num, mum, dday;

		// 성분헌혈 한 날짜
		n = mapper.alamsung(email);
		// 전혈한 날짜
		m = mapper.alamjeon(email);

		System.out.println("성분 헌혈: " + n + ", 전혈: " + m);

		// n값 판정
		if (n == null) {
			System.out.println("널이당");
			num = 0;
		} else {
			num = Integer.parseInt(n);
		}
		System.out.println(num);
		// m값 판정
		if (m == null) {
			mum = 0;
		} else {
			mum = Integer.parseInt(m);
		}
		System.out.println(mum);

		// n과 m의 비교
		if (mum > num) {
			dday = mum;
		} else {
			dday = num;
		}

		return dday;
	}

	// 헌혈증 목록
	@RequestMapping("/bdDonateform")
	public String bdDonateform(HttpSession ss, Model m) {
		// 헌혈증 리스트 만들어 뿌려주기
		String email = (String) ss.getAttribute("email");
		mapper = sqlsession.getMapper(BloodDao.class);
		ArrayList<Bdcard> bd = mapper.selectBdlist(email);
		m.addAttribute("bdlist", bd);
		return "/bdDonateform";
	}

	// 헌혈증 보내기
	@ResponseBody
	@RequestMapping(value = "send")
	public String send(
			@RequestParam(value = "valueArrTest[]") ArrayList<String> bdcardnum
			, String toEmail) {
		mapper = sqlsession.getMapper(BloodDao.class);
		
		for (int i = 0; i < bdcardnum.size(); i++) {
			// map에 담아 가져오기
			Map<String, String> bdlist = new HashMap<>();
			bdlist.put("bdnum", bdcardnum.get(i));
			bdlist.put("toemail", toEmail);
			//투이메일 집어넣기
			//집어넣으면서 헌혈증 상태 바꿔줘야함(쿼리에 박아넣을것)
			mapper.donate(bdlist);
		}
		
		return "redirect:donation";
	}
	
	
	//받은 헌혈증 보기
	@RequestMapping("/recived")
	public String recived(
			HttpSession ss
			, Model m) {
		String toemail = (String) ss.getAttribute("email");
		mapper = sqlsession.getMapper(BloodDao.class);
		//toemail이 현재 로그인한 사람의 것과 같은것들 전부 담기
		ArrayList<Bdcard> list = mapper.recivedlist(toemail);
		m.addAttribute("list", list);
		
		return "recivedlist";
	}

}
