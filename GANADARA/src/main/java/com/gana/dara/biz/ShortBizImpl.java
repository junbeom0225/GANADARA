package com.gana.dara.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gana.dara.dao.ShortDao;
import com.gana.dara.dto.ShortDto;
@Service
public class ShortBizImpl implements ShortBiz {
	
	@Autowired
	private ShortDao dao;
	
	@Override
	public List<ShortDto> ShortList() {
		return dao.ShortList();
	}

	@Override
	public List<ShortDto> selectTitle(String st_title) {
		return dao.selectTitle(st_title);
	}

	@Override
	public int insert(ShortDto dto) {
		return 0;
	}

	@Override
	public int update(ShortDto dto) {
		return 0;
	}

	@Override
	public int delete(int stno) {
		return 0;
	}

}
