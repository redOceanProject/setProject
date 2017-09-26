package sesoc.global.redocean.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import sesoc.global.redocean.vo.Mainboard;


public interface BoardDao {
	//게시판 글읽기
	public int getBoardCount(Map<String, String> search);
	//게시판 글 읽어오기
	public ArrayList<Mainboard> select(Map<String, String> search, RowBounds rb) ;

	//게시판 글 하나 읽기
	public Mainboard selectOne(int boardnum);
	
	//조회수 늘리기
	public int hitCount(int boardnum);
	
	//게시글 업데이트
	public int update(Mainboard board);
	//게시글 삭제
	public int delete(int boardnum);
	
	//게시글 리스트
	public Mainboard selectlist();
	
	//게시글 목표달성
	public int change(int boardnum);
	
	//사연보낸거 리스트 읽어오기
	   public ArrayList<Mainboard> selectboardlist(String boardnum);
	//전체 게시판, 첫 홈 화면에 최신사연 보여줄 때 사용
	public ArrayList<Mainboard> list();
	//내가 보낸 사연들
	public ArrayList<Mainboard> myList(String email);
	//사연 작성
	public int write(Mainboard mainboard);
	
}
