package com.gana.dara.biz;

import java.util.List;

import com.gana.dara.dto.EduDto;

public interface EduBiz {
	
	public List<EduDto> selectList(String edu_grade);

}
