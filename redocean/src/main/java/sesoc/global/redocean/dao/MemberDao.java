package sesoc.global.redocean.dao;


import sesoc.global.redocean.vo.Member;

public interface MemberDao {
	//유저 가입
	public int insert(Member m);
	//유저 선택
	public Member select(String email);
	//회원탈퇴
	public int delete(String email);
	
	
	
	
}
