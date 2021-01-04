package com.gana.dara.biz;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gana.dara.dao.MemberDao;
import com.gana.dara.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao dao;
	
	@Override
	public int MemberJoinInsert(MemberDto dto) {
		return dao.MemberJoinInsert(dto);
	}

	@Override
	public int IdCheck(String member_email) {
		return dao.IdCheck(member_email);
	}
	
	@Override
	public int NicCheck(String member_nic) {
		return dao.NicCheck(member_nic);
	}

	@Override
	public MemberDto Login(MemberDto dto) {
		return dao.Login(dto);
	}

	@Override
	public int MemberUpdate(MemberDto dto) {
		return dao.MemberUpdate(dto);
	}

	@Override
	public int SnsLogin(MemberDto dto) {
		return dao.SnsLogin(dto);
	}
	
	@Override
	public int GetKey(String member_email, String member_key) {
		return 0;
	}


	@Override
	public int DailyService(String member_email) {
		return dao.DailyService(member_email);
	}

	@Override
	public String MemberRole(String member_role) {
		return dao.MemberRole(member_role);
	}

	@Override
	public MemberDto get_searchId(MemberDto dto) {
		return dao.get_searchId(dto);
	}
	

	
}
