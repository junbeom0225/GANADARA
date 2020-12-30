package com.gana.dara.dao;

import java.util.List;

import com.gana.dara.dto.DailyBoardDto;

public interface DailyBoardDao {

	String NAMESPACE = "dailyboard.";
	
	public List<DailyBoardDto> selectList();
	public DailyBoardDto selectOne(int db_no);
	public int insert(DailyBoardDto dto);
	public int update(DailyBoardDto dto);
	public int delete(int db_no);
}
