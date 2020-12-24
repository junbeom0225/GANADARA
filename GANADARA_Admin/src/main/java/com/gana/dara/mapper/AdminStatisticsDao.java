package com.gana.dara.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminStatisticsDao {
	
	
	
	// 국가별 통계
	public int countAsia();
	public int countEurope();
	public int countAfrica();
	public int countNorthAmerica();
	public int countAustralia();
	public int countAntarctica();
	
	//일별 가입회원 수 (18, 19, 21, 22) 다시 하기!
	public int countDay1();
	public int countDay2();
	public int countDay3();
	public int countDay4();
	
	// 연령대별 회원수 (10대, 20대, 30대, 40대, 50대, 60대 이상)
	public int countAge10();
	public int countAge20();
	public int countAge30();
	public int countAge40();
	public int countAge50();
	public int countAge60();
	
}
