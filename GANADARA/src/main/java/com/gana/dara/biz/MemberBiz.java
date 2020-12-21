package com.gana.dara.biz;

import com.gana.dara.dto.MemberDto;

public interface MemberBiz {
	
		//회원가입
		public int MemberJoinInsert(MemberDto dto);
		
		//아이디 중복체크
		public int IdCheck(String member_email);
		
		//닉네임 중복체크
		public int NicCheck(String member_nic);
		
		//로그인
		public MemberDto Login(MemberDto dto);
		
		//회원 정보 보기
		public MemberDto ReadMember(MemberDto dto);

		//개인 회원 정보 수정
		public int MemberUpdate(MemberDto dto);
		
		//SNS 로그인
		public int SnsLogin(MemberDto dto);

}
