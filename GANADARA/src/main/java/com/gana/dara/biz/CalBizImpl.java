package com.gana.dara.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gana.dara.dao.CalDao;
import com.gana.dara.dto.CalDto;

@Service
public class CalBizImpl implements CalBiz {
	@Autowired
	private CalDao dao;
	
	@Override
	public List<CalDto> CalList(int member_no) {
		// TODO Auto-generated method stub
		return dao.CalList(member_no);
	}

	@Override
	public List<CalDto> selectOne(int cal_no) {
		// TODO Auto-generated method stub
		return dao.selectOne(cal_no);
	}

	@Override
	public int insert(CalDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public int update(CalDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public int delete(int cal_no) {
		// TODO Auto-generated method stub
		return dao.delete(cal_no);
	}

}
