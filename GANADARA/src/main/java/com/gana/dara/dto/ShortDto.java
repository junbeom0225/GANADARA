package com.gana.dara.dto;

public class ShortDto {
	private int st_no;
	private String st_content;
	private String st_title;
	
	public ShortDto() {
	}
	
	public ShortDto(int st_no, String st_content, String st_title) {
		this.st_no = st_no;
		this.st_content = st_content;
		this.st_title = st_title;
	}

	public int getst_no() {
		return st_no;
	}
	public void setst_no(int st_no) {
		this.st_no = st_no;
	}
	public String getst_content() {
		return st_content;
	}
	public void setst_content(String st_content) {
		this.st_content = st_content;
	}
	public String getst_title() {
		return st_title;
	}
	public void setst_title(String st_title) {
		this.st_title = st_title;
	}
	
	
}
