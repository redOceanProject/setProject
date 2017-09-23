package sesoc.global.redocean;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sesoc.global.redocean.dao.BoardDao;
import sesoc.global.redocean.dao.ReplyDao;
import sesoc.global.redocean.util.PageNavigator;
import sesoc.global.redocean.vo.Mainboard;
import sesoc.global.redocean.vo.Reply;
import sesoc.global.redocean.util.FileService;

@Controller
public class BoardController {
	@Autowired
	SqlSession sqlsession;
	BoardDao mapper;
	ReplyDao replyMapper;
	
	final String uploadPath = "/mainboard_file";
	
	//보드리스트
	@RequestMapping("boardList")
	public String boardlist(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "searchtype", defaultValue = "title") String searchtype,
			@RequestParam(value = "searchword", defaultValue = "") String searchword, Model model) {
		mapper = sqlsession.getMapper(BoardDao.class);
		Map<String, String> search = new HashMap<>();
		search.put("searchtype", searchtype);
		search.put("searchword", searchword);

		// 네비게이터 생성
		int totalRecordCount = mapper.getBoardCount(search);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);

		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		ArrayList<Mainboard> list = mapper.select(search, rb);

		model.addAttribute("boardList", list);
		model.addAttribute("navi", navi);

		model.addAttribute("searchword", searchword);
		model.addAttribute("searchtype", searchtype);

		return "Board/boardList";
	}

	@RequestMapping("/boardDetail")
	public String boardDetail(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "searchtype", defaultValue = "title") String searchtype,
			@RequestParam(value = "searchword", defaultValue = "") String searchword, int boardnum, Model model) {
		mapper = sqlsession.getMapper(BoardDao.class);
		String mime = null;
		// 글 읽어옴
		Mainboard board = mapper.selectOne(boardnum);
		// 히트수 증가
		mapper.hitCount(boardnum);

		// 글에 있는 세이브드 파일 판명

		if (board.getSavedfile() != null) {
			String fullPath = uploadPath + "/" + board.getSavedfile();
			try {
				// 저장된 파일의 MimeType을 확인함. 이미지일 경우 View단에서 바로 출력할 수 있도록!!
				mime = Files.probeContentType(Paths.get(fullPath));
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (mime.contains("image"))
				model.addAttribute("mimetype", mime);
		}

		// 글목록 불러옴
		Map<String, String> search = new HashMap<>();
		search.put("searchtype", searchtype);
		search.put("searchword", searchword);
		int totalRecordCount = mapper.getBoardCount(search);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);

		// 모델에 글과 네비 담기
		model.addAttribute("board", board);
		model.addAttribute("navi", navi);
		model.addAttribute("boardnum", boardnum);

		// 서치타입 및 워드 담기
		model.addAttribute("searchtype", searchtype);
		model.addAttribute("searchword", searchword);

		return "Board/boardDetail";
	}

	/**
	 * 게시글 수정 화면 요청 게시글의 수정화면에는 수정을 요청한 데이터가 필요하므로 데이터를 가져와야 한다.
	 * 
	 * @param boardnum
	 * @param model
	 * @return
	 */
	@RequestMapping("/boardUpdate")
	public String boardUpdate(int boardnum, Model model, Mainboard board) {
		// session에서 아이디 꺼내는 작업 필요
		
		mapper = sqlsession.getMapper(BoardDao.class);
		board = mapper.selectOne(boardnum);
		String str = board.getContent().replaceAll("<br>", "\r\n");
		board.setContent(str);
		model.addAttribute("board", board);

		return "Board/boardUpdate";
	}

	/**
	 * 게시글 수정 처리 요청 게시글의 수정화면에서 파일이 넘어올 수 있으므로 기존의 파일은 지우고 새로운 파일을 삭제하는 동작 필요
	 * 
	 * @param boardnum
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(Mainboard board, MultipartFile upload, HttpSession session, RedirectAttributes rttr) {
		// 수정할 글이 로그인한 본인 글인지 확인
		// (만약 글보기에서 자신의 글이 아니더라도 수정버튼이 있다면 아래의 코드 필요)
		String str = board.getContent().replaceAll("\r\n", "<br>");
		board.setContent(str);
		String email = (String) session.getAttribute("email");
		mapper = sqlsession.getMapper(BoardDao.class);
		Mainboard oldBoard = mapper.selectOne(board.getBoardnum());

		if (oldBoard == null || !oldBoard.getEmail().equals(email)) {
			return "redirect:boardList";
		}

		// 수정할 정보에 로그인 아이디 저장
		board.setEmail(email);

		String savedfile = "";

		if (upload.isEmpty()) {
			// 1) 기존 파일 유지하려면...
			board.setOriginalfile(oldBoard.getOriginalfile());
			board.setSavedfile(oldBoard.getSavedfile());

			// 2) 기존 파일 삭제하려면, DB도 삭제하고 HDD에 있는 파일도 삭제
			savedfile = oldBoard.getSavedfile();
			/*
			 * if (savedfile != null) {
			 * 
			 * boolean result = FileService.deleteFile(uploadPath + "/" +
			 * savedfile); board.setOriginalfile(null);
			 * board.setSsavedfileavedfile(null); }
			 */

			// 새로 첨부한 파일이 있으면 기존 파일을 삭제하고 새로 업로드
		} else if (!upload.isEmpty()) {
			savedfile = FileService.saveFile(upload, uploadPath);
			board.setOriginalfile(upload.getOriginalFilename());
			board.setSavedfile(savedfile);
		}

		mapper.update(board);
		rttr.addAttribute("boardnum", board.getBoardnum());

		return "redirect:boardDetail";
	}

	@RequestMapping("/boardDelete")
	public String boardDelete(int boardnum, Model model, HttpSession session) {
		// 삭제할 글이 로그인한 본인 글인지 확인
		String email = (String) session.getAttribute("email");
		System.out.println(email);
		mapper = sqlsession.getMapper(BoardDao.class);
		// 삭제할 글 찾아옴
		Mainboard oldBoard = mapper.selectOne(boardnum);
		System.out.println(oldBoard);
		if (oldBoard == null || !oldBoard.getEmail().equals(email)) {
			return "redirect:/";
		}

		String savedfile = oldBoard.getSavedfile();
		// 기존 파일이 있으면 삭제
		if (savedfile != null) {
			FileService.deleteFile(uploadPath + "/" + savedfile);
			System.out.println("삭제 완료");
		}
		mapper.delete(boardnum);

		return "redirect:/";
	}
	
	
	//헌혈증 수량 완성
	@RequestMapping("/change")
	public String change(
			int boardnum){
		//헌혈증 남은 갯수는 클라단에서 처리
		//여기 오는 순간 이미 헌혈증 개수는 꽉 찬걸로 확인됨
		mapper = sqlsession.getMapper(BoardDao.class);
		mapper.change(boardnum);
		
		return "change";
	}
	
	//다운로드
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String fileDownload(
			int boardnum
			, Model model
			, HttpServletResponse response
			) {
		BoardDao m = sqlsession.getMapper(BoardDao.class);
		Mainboard board = m.selectOne(boardnum);
			
		//원래의 파일명
		String originalfile = new String(board.getSavedfile());
		//저장된 파일 경로
		String fullPath = uploadPath + "/" + board.getSavedfile();

		try {
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile, "UTF-8"));			} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
			

		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
			
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
				
			//Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);
				
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	

	//사연 작성폼으로 이동
	@RequestMapping(value = "write")
	public String write() {
		return "Board/write";
	}
		
		
	//사연작성 DB처리
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(
			Mainboard mainboard
			, HttpSession session
			, MultipartFile upload
			) {
		String str = mainboard.getContent().replaceAll("\r\n", "<br>");
		mainboard.setContent(str);
		String email = (String)session.getAttribute("email");
		mainboard.setEmail(email);
		String name = (String) session.getAttribute("name");
		mainboard.setName(name);

		String savedFilename = FileService.saveFile(upload, uploadPath);
		mainboard.setOriginalfile(upload.getOriginalFilename());
		mainboard.setSavedfile(savedFilename);
		
		BoardDao m = sqlsession.getMapper(BoardDao.class);
		m.write(mainboard);

		return "redirect:/";
	}	
	
	//댁글 작성하기
	@ResponseBody
	@RequestMapping(value="enroll", produces="application/json;charset=utf-8")
	public void enroll(Reply reply){
		System.out.println(reply);
		replyMapper = sqlsession.getMapper(ReplyDao.class);
		int i = replyMapper.insert(reply);
		System.out.println(i);
	}
	
	//댓글 출력
	@RequestMapping(value="getreply")
	public @ResponseBody ArrayList<Reply> getreply(
			HttpSession ss
			,int boardnum
			){
		System.out.println(boardnum);
		replyMapper = sqlsession.getMapper(ReplyDao.class);
		ArrayList<Reply> reply = replyMapper.selectAll(boardnum);
		System.out.println(reply);
		return reply;
	}
	

		
}
