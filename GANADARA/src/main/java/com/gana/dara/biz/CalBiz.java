package com.gana.dara.biz;

import java.util.List;

import com.gana.dara.dto.CalDto;

public interface CalBiz {

	public List<CalDto> CalList(int member_no);
	public List<CalDto> selectOne(int cal_no);
	public int insert(CalDto dto);
	public int update(CalDto dto);
	public int delete(int cal_no);
	
}
