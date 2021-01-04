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
		
		//System.out.println(dto.getMember_role() + "Daoimpl");
		try {
			res = sqlSession.selectOne(NAMESAPCE + "login", dto);
			//System.out.println(res.getMember_birth() + "!!!!");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
	
	@Override
	public int MemberUpdate(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESAPCE + "memberupdate", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] memberupdate");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int SnsLogin(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESAPCE + "naverlogin", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] naverlogin");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int GetKey(String member_email, String member_key) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESAPCE + "GetKey", member_key);
		} catch (Exception e) {
			System.out.println("[ERROR] GetKey");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int DailyService(String member_email) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESAPCE + "dailyservice", member_email);
		} catch (Exception e) {
			System.out.println("[ERROR] dailyservice");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public String MemberRole(String member_role) {
		String mm = null;
		
		try {
			mm = sqlSession.selectOne(NAMESAPCE + "memberrole", member_role);
		} catch (Exception e) {
			System.out.println("[ERROR] memberrole");
			e.printStackTrace();
		}
		
		return mm;
	}

	@Override
	public MemberDto get_searchId(MemberDto dto) {
	
		MemberDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESAPCE + "searchId", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] serachId");
			e.printStackTrace();
		}
		System.out.println(res.getMember_email() + "dao");
		return res;
	}

	

	
}
