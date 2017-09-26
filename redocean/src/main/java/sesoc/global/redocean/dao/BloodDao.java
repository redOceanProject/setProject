package sesoc.global.redocean.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import sesoc.global.redocean.vo.Bdcard;

public interface BloodDao {

	// 헌혈증 리스트
	public ArrayList<Bdcard> selectBdlist(String email);
	
	// 헌혈증 리스트2 (사용가능 헌혈증 리스트)
	public ArrayList<Bdcard> selectBdlist2(String email);

	// 헌혈증 선택
	public Bdcard select(String num);

	// 휴지기 확인
	// 성분헌혈 하고 휴지기 알아보기
	public String alamsung(String id);

	// 전혈 하고 휴지기 알아보기
	public String alamjeon(String id);
	
	//doanate
	public int donate(Map<String, String>bdlist);

	//받은 헌혈증 리스트
	public ArrayList<Bdcard> recivedlist(String toemail);
	
	//헌혈증에서 boardnum 가져오기(중복제거)
	   public ArrayList<String> selectBoardnum(String email);
	   
	 //헌혈증 등록하기
		public int register(Map<String, String>map );
}
