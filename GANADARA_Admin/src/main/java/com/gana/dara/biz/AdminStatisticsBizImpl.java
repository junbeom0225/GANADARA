package com.gana.dara.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gana.dara.mapper.AdminStatisticsDao;

@Service
public class AdminStatisticsBizImpl implements AdminStatisticsBiz {

	@Autowired
	AdminStatisticsDao asdao;
	
	@Override
	public int countAsia() {
		
		return asdao.countAsia();
	}

	@Override
	public int countEurope() {
		
		return asdao.countEurope();
	}

	@Override
	public int countAfrica() {
		
		return asdao.countAfrica();
	}

	@Override
	public int countNorthAmerica() {
		
		return asdao.countNorthAmerica();
	}

	@Override
	public int countAustralia() {
		
		return asdao.countAustralia();
	}

	@Override
	public int countAntarctica() {
		
		return asdao.countAntarctica();
	}

	@Override
	public int countDay1() {
		
		return asdao.countDay1();
	}

	@Override
	public int countDay2() {
		
		return asdao.countDay2();
	}

	@Override
	public int countDay3() {
		
		return asdao.countDay3();
	}

	@Override
	public int countDay4() {
		
		return asdao.countDay4();
	}

}
