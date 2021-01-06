package com.gana.dara.dao;

import java.util.List;

import com.gana.dara.dto.ShortDto;

public interface ShortDao {
	
	String NAMESPACE = "com.short.";
	
	public List<ShortDto> ShortList();
	public List<ShortDto> selectTitle(String st_title);
	public int insert(ShortDto dto);
	public int update(ShortDto dto);
	public int delete(int stno);
}
