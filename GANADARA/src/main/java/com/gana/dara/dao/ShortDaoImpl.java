package com.gana.dara.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gana.dara.dto.ShortDto;

@Repository
public class ShortDaoImpl implements ShortDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ShortDto> ShortList() {
		List<ShortDto> list = new ArrayList<ShortDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "ShortList");
		} catch (Exception e) {
			System.out.println("[ERROR] ShortList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ShortDto> selectTitle(String st_title) {
		List<ShortDto> list = new ArrayList<ShortDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectTitle",st_title);
		} catch (Exception e) {
			System.out.println("[ERROR] selectTitle");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insert(ShortDto dto) {
		return 0;
	}

	@Override
	public int update(ShortDto dto) {
		return 0;
	}

	@Override
	public int delete(int stno) {
		return 0;
	}

}
