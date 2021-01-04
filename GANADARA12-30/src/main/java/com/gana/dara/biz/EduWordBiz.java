package com.gana.dara.biz;

import java.util.List;

import com.gana.dara.dto.EduWordDto;

public interface EduWordBiz {

	public List<EduWordDto> selectList(int edu_no);

}
