package com.gana.dara.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gana.dara.dto.EduDto;

@Repository
public class EduDaoImpl implements EduDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<EduDto> selectList(String edu_grade) {
		List<EduDto> list = null;
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList", edu_grade);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		for(EduDto dto:list) {
//			System.out.println(dto.getEdu_level());
//		}
		
		return list;
	}

}
