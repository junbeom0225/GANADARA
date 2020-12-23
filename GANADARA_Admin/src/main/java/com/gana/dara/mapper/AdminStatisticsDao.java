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
	
	//일별 가입회원 수 (18, 19, 21, 22)
	public int countDay1();
	public int countDay2();
	public int countDay3();
	public int countDay4();
	
}
