package sesoc.global.redocean.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import sesoc.global.redocean.vo.Mainboard;
import sesoc.global.redocean.vo.Reply;


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
	
	
	//전체 게시판
	public ArrayList<Mainboard> list();
	//사연 작성
	public int write(Mainboard mainboard);
	//댓글 작성
	public int reply(Reply reply);
	//전체댓글 출력
	public ArrayList<Reply> replylist(int boardnum);
	
}
