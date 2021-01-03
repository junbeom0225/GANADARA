package com.gana.dara.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gana.dara.dto.MemberDto;
import com.gana.dara.mapper.MatchingMentoDao;

@Service
public class MatchingMentoBizImpl implements MatchingMentoBiz {

	@Autowired
	private MatchingMentoDao mdao;
	
	@Override
	public List<MemberDto> matchingMento() {
		
		return mdao.matchingMento();
	}

	@Override
	public MemberDto selectOne(int member_no) {
		
		return mdao.selectOne(member_no);
	}

	@Override
	public int updateMento(MemberDto dto) {
	
		return mdao.updateMento(dto);
	}

}
