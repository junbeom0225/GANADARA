package com.gana.dara.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gana.dara.dao.EduDao;
import com.gana.dara.dto.EduDto;

@Service
public class EduBizImpl implements EduBiz {
	
	@Autowired
	private EduDao dao;

	@Override
	public List<EduDto> selectList(String edu_grade) {
		return dao.selectList(edu_grade);
	}

}
