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
	public MemberDto ReadMember(MemberDto dto) {
		return null;
	}

	@Override
	public int MemberUpdate(MemberDto dto) {
		return 0;
	}

	@Override
	public int SnsLogin(MemberDto dto) {
		return 0;
	}

	

	
}
