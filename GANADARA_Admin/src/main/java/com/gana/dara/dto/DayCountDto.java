package com.gana.dara.dto;

public class DayCountDto {

	private int countDay1;
	private int countDay2;
	private int countDay3;
	private int countDay4;
	
	public DayCountDto() {
		
	}
	
	public DayCountDto(int countDay1, int countDay2, int countDay3, int countDay4) {
		this.countDay1 = countDay1;
		this.countDay2 = countDay2;
		this.countDay3 = countDay3;
		this.countDay4 = countDay4;
		
	}

	public int getCountDay1() {
		return countDay1;
	}

	public void setCountDay1(int countDay1) {
		this.countDay1 = countDay1;
	}

	public int getCountDay2() {
		return countDay2;
	}

	public void setCountDay2(int countDay2) {
		this.countDay2 = countDay2;
	}

	public int getCountDay3() {
		return countDay3;
	}

	public void setCountDay3(int countDay3) {
		this.countDay3 = countDay3;
	}

	public int getCountDay4() {
		return countDay4;
	}

	public void setCountDay4(int countDay4) {
		this.countDay4 = countDay4;
	}
	
	
}
