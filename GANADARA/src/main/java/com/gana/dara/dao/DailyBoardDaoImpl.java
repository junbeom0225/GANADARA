package com.gana.dara.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gana.dara.dto.DailyBoardDto;
import com.gana.dara.dto.MemberDto;

@Repository
public class DailyBoardDaoImpl implements DailyBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<DailyBoardDto> selectList() {
		List<DailyBoardDto> list = new ArrayList<DailyBoardDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[error] selectList: dao");
		}
		
		
		return list;
	}

	@Override
	public DailyBoardDto selectOne(int db_no) {
		DailyBoardDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", db_no);
		} catch (Exception e) {
			System.out.println("[error] selectOne:dao");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(DailyBoardDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			System.out.println("[error] insert:dao");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(DailyBoardDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			System.out.println("[error] update:dao");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int db_no) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE+"delete", db_no);
		} catch (Exception e) {
			System.out.println("[error] delete:dao");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public MemberDto mento_no(int db_no) {
		MemberDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "mento_no", db_no);
		} catch (Exception e) {
			System.out.println("[error] mento: dao");
			e.printStackTrace();
		}
		return res;
	}

	
}
