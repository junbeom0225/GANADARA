package com.gana.dara.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gana.dara.dto.MemberDto;

@Mapper
public interface MatchingMentoDao {

	public List<MemberDto> matchingMento();
	public MemberDto selectOne(int member_no);
}
