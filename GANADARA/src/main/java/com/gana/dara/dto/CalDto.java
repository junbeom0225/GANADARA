package com.gana.dara.dto;


public class CalDto {
private int cal_no;
private int member_no;
private String cal_title;
private String cal_content;
private String cal_mdate;
private String cal_regdate;
public CalDto() {
	super();
}
public CalDto(int cal_no, int member_no, String cal_title, String cal_content, String cal_mdate, String cal_regdate) {
	this.cal_no = cal_no;
	this.member_no = member_no;
	this.cal_title = cal_title;
	this.cal_content = cal_content;
	this.cal_mdate = cal_mdate;
	this.cal_regdate = cal_regdate;
}
public int getCal_no() {
	return cal_no;
}
public void setCal_no(int cal_no) {
	this.cal_no = cal_no;
}
public int getMember_no() {
	return member_no;
}
public void setMember_no(int member_no) {
	this.member_no = member_no;
}
public String getCal_title() {
	return cal_title;
}
public void setCal_title(String cal_title) {
	this.cal_title = cal_title;
}
public String getCal_content() {
	return cal_content;
}
public void setCal_content(String cal_content) {
	this.cal_content = cal_content;
}
public String getCal_mdate() {
	return cal_mdate;
}
public void setCal_mdate(String cal_mdate) {
	this.cal_mdate = cal_mdate;
}
public String getCal_regdate() {
	return cal_regdate;
}
public void setCal_regString(String cal_regdate) {
	this.cal_regdate = cal_regdate;
}



}
