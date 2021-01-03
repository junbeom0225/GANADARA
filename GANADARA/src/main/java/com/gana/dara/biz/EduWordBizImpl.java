package com.gana.dara.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gana.dara.dao.EduWordDao;
import com.gana.dara.dto.EduWordDto;

@Service
public class EduWordBizImpl implements EduWordBiz {
	
	@Autowired
	private EduWordDao dao;

	@Override
	public List<EduWordDto> selectList(int edu_no) {
		return dao.selectList(edu_no);
	}

}
