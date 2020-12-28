package com.gana.dara.biz;

import java.util.List;

import com.gana.dara.dto.MemberDto;

public interface MatchingMentoBiz {

	public List<MemberDto> matchingMento();
	public MemberDto selectOne(int member_no);
}
