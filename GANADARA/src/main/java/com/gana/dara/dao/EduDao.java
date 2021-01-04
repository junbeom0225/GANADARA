package com.gana.dara.dao;

import java.util.List;

import com.gana.dara.dto.EduDto;

public interface EduDao {
	
	String NAMESPACE = "edu.";
	
	public List<EduDto> selectList(String edu_grade);
	

}
