package com.gana.dara.dao;

import java.util.List;

import com.gana.dara.dto.DailyBoardDto;
import com.gana.dara.dto.MemberDto;

public interface DailyBoardDao {

	String NAMESPACE = "dailyboard.";
	
	public List<DailyBoardDto> selectList();
	public DailyBoardDto selectOne(int db_no);
	public int insert(DailyBoardDto dto);
	public int update(DailyBoardDto dto);
	public int delete(int db_no);
	
	// 멘토 번호
	public MemberDto mento_no(int db_no);
	
	// 멘토 - 첨삭회원 가져오기 
	public List<MemberDto> studentList(int member_no);
}
