package com.gana.dara.dto;

public class AgeDto {

	private int countAge10;
	private int countAge20;
	private int countAge30;
	private int countAge40;
	private int countAge50;
	private int countAge60;
	
	public AgeDto() {
		
	}
	private AgeDto(int countAge10, int countAge20, int countAge30, int countAge40, int countAge50, int countAge60) {
		this.countAge10 = countAge10;
		this.countAge20 = countAge20;
		this.countAge30 = countAge30;
		this.countAge40 = countAge40;
		this.countAge50 = countAge50;
		this.countAge60 = countAge60;
	}
	public int getCountAge10() {
		return countAge10;
	}
	public void setCountAge10(int countAge10) {
		this.countAge10 = countAge10;
	}
	public int getCountAge20() {
		return countAge20;
	}
	public void setCountAge20(int countAge20) {
		this.countAge20 = countAge20;
	}
	public int getCountAge30() {
		return countAge30;
	}
	public void setCountAge30(int countAge30) {
		this.countAge30 = countAge30;
	}
	public int getCountAge40() {
		return countAge40;
	}
	public void setCountAge40(int countAge40) {
		this.countAge40 = countAge40;
	}
	public int getCountAge50() {
		return countAge50;
	}
	public void setCountAge50(int countAge50) {
		this.countAge50 = countAge50;
	}
	public int getCountAge60() {
		return countAge60;
	}
	public void setCountAge60(int countAge60) {
		this.countAge60 = countAge60;
	}
	
	
	
}
