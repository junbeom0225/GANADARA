package com.gana.dara.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gana.dara.dto.CalDto;

@Repository
public class CalDaoImpl implements CalDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CalDto> CalList(int member_no) {
		List<CalDto> list = new ArrayList<CalDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectlist",member_no);
		} catch (Exception e) {
			System.out.println("[ERROR] CalList");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<CalDto> selectOne(int cal_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(CalDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert",dto);
		} catch (Exception e) {
			System.out.println("[ERROR] insert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(CalDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE +"update",dto);
		} catch (Exception e) {
			System.out.println("[ERROR] update");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int cal_no) {
		int res= 0;
		try {
			res = sqlSession.delete(NAMESPACE + "delete",cal_no);
		} catch (Exception e) {
			System.out.println("[ERROR] delete");
			e.printStackTrace();
		}
		return res;
	}

}
