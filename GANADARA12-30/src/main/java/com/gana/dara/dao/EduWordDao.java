package com.gana.dara.dao;

import java.util.List;

import com.gana.dara.dto.EduWordDto;

public interface EduWordDao {
	
	String NAMESPACE = "eduword.";
	
	public List<EduWordDto> selectList(int edu_no);
	

}
