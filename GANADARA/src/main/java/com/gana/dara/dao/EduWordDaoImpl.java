package com.gana.dara.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gana.dara.dto.EduWordDto;

@Repository
public class EduWordDaoImpl implements EduWordDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<EduWordDto> selectList(int edu_no) {
		List<EduWordDto> list = null;
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList", edu_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		for(EduWordDto dto : list) {
//			System.out.println("edu_no: " + dto.getEdu_no() 
//			               + "edu_grade: " + dto.getEdu_grade()
//			               + "edu_level: " + dto.getEw_level());
//		}
		
		return list;
	}
}
