package com.gana.dara.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gana.dara.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int MemberJoinInsert(MemberDto dto) {

		int res = 0;
		try {
			res = sqlSession.insert(NAMESAPCE + "memberjoininsert", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] memberjoininsert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int IdCheck(String member_email) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESAPCE + "memberidcheck", member_email);
		} catch (Exception e) {
			System.out.println("[ERROR] memberidcheck");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int NicCheck(String member_nic) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESAPCE + "memberniccheck", member_nic);
		} catch (Exception e) {
			System.out.println("[ERROR] memberniccheck");
			e.printStackTrace();
		}
		
		return res;
	}


	@Override
	public MemberDto Login(MemberDto dto) {

		MemberDto res = null;

		try {
			res = sqlSession.selectOne(NAMESAPCE + "login", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
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
