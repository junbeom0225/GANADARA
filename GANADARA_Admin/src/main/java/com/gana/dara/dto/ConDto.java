package com.gana.dara.dto;

public class ConDto {

	private int countAsia;
	private int countEurope;
	private int countAfrica;
	private int countNorthAmerica;
	private int countAustralia;
	private int countAntarctica;
	
	public ConDto() {
		
	}
	public ConDto(int countAsia, int countEurope, int countAfrica, int countNorthAmerica, int countAustralia, int countAntarctica) {
		this.countAsia = countAsia;
		this.countEurope = countEurope;
		this.countAfrica = countAfrica;
		this.countNorthAmerica = countNorthAmerica;
		this.countAustralia = countAustralia;
		this.countAntarctica = countAntarctica;
	}
	public int getCountAsia() {
		return countAsia;
	}
	public void setCountAsia(int countAsia) {
		this.countAsia = countAsia;
	}
	public int getCountEurope() {
		return countEurope;
	}
	public void setCountEurope(int countEurope) {
		this.countEurope = countEurope;
	}
	public int getCountAfrica() {
		return countAfrica;
	}
	public void setCountAfrica(int countAfrica) {
		this.countAfrica = countAfrica;
	}
	public int getCountNorthAmerica() {
		return countNorthAmerica;
	}
	public void setCountNorthAmerica(int countNorthAmerica) {
		this.countNorthAmerica = countNorthAmerica;
	}
	public int getCountAustralia() {
		return countAustralia;
	}
	public void setCountAustralia(int countAustralia) {
		this.countAustralia = countAustralia;
	}
	public int getCountAntarctica() {
		return countAntarctica;
	}
	public void setCountAntarctica(int countAntarctica) {
		this.countAntarctica = countAntarctica;
	}
	
	
}
