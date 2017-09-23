package sesoc.global.redocean.dao;

import java.util.ArrayList;

import sesoc.global.redocean.vo.Reply;

public interface ReplyDao {
	
	//리플 전체 선택
	public ArrayList<Reply> selectAll();
	
	//리플쓰기
	public int insert(Reply re);
}
