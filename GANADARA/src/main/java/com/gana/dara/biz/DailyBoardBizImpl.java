package com.gana.dara.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gana.dara.dao.DailyBoardDao;
import com.gana.dara.dto.DailyBoardDto;
import com.gana.dara.dto.MemberDto;

@Service
public class DailyBoardBizImpl implements DailyBoardBiz {

	@Autowired
	private DailyBoardDao dailydao;
	
	@Override
	public List<DailyBoardDto> selectList() {

		return dailydao.selectList();
	}

	@Override
	public DailyBoardDto selectOne(int db_no) {
		
		return dailydao.selectOne(db_no);
	}

	@Override
	public int insert(DailyBoardDto dto) {
		
		return dailydao.insert(dto);
	}

	@Override
	public int update(DailyBoardDto dto) {

		return dailydao.update(dto);
	}

	@Override
	public int delete(int db_no) {
		
		return dailydao.delete(db_no);
	}

	// 멘토 번호 
	@Override
	public MemberDto mento_no(int db_no) {
		
		return dailydao.mento_no(db_no);
	}

}
