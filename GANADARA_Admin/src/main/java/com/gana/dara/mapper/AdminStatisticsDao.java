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
	
	
}
