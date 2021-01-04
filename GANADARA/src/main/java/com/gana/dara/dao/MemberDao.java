package com.gana.dara.dao;


import java.util.List;

import com.gana.dara.dto.MemberDto;

public interface MemberDao {
	
	String NAMESAPCE = "member.";
	
	//회원가입
	public int MemberJoinInsert(MemberDto dto);
	
	//아이디 중복체크
	public int IdCheck(String member_email);
	
	//닉네임 중복체크
	public int NicCheck(String member_nic);
	
	
	//유저 인증키 생성
	public int GetKey(String member_email, String member_key);
	
	//로그인
	public MemberDto Login(MemberDto dto);
	
	//개인 회원 정보 수정
	public int MemberUpdate(MemberDto dto);
	
	//SNS 로그인
	public int SnsLogin(MemberDto dto);
	
	// 구매 후 멤버쉽(member_daily) 컬럼 변경
	public int DailyService(String member_email);
	
	// member_role 데려오기
	public String MemberRole(String member_role);
	
	// 아이디 찾기 이름, 전화번호
	public MemberDto get_searchId(MemberDto dto);

	// 멘토 - 첨삭회원 가져오기 
	public List<MemberDto> studentList(int member_no);

	
}
