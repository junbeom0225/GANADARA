package com.gana.dara.biz;

import java.util.List;

import com.gana.dara.dto.ShortDto;

public interface ShortBiz {

	public List<ShortDto> ShortList();
	public List<ShortDto> selectTitle(String st_title);
	public int insert(ShortDto dto);
	public int update(ShortDto dto);
	public int delete(int stno);
}
