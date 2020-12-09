package com.gana.dara.dto;

import java.sql.Date;

public class MentoAnswerDto {

	private int ma_no;
	private int db_no;
	private int mento_no;
	private String ma_content;
	private Date ma_date;
	
	public MentoAnswerDto() {
		
	}
	public MentoAnswerDto(int ma_no, int db_no, int mento_no, String ma_content, Date ma_date) {
		this.ma_no = ma_no;
		this.db_no = db_no;
		this.mento_no = mento_no;
		this.ma_content = ma_content;
		this.ma_date = ma_date;
	}
	public int getMa_no() {
		return ma_no;
	}
	public void setMa_no(int ma_no) {
		this.ma_no = ma_no;
	}
	public int getDb_no() {
		return db_no;
	}
	public void setDb_no(int db_no) {
		this.db_no = db_no;
	}
	public int getMento_no() {
		return mento_no;
	}
	public void setMento_no(int mento_no) {
		this.mento_no = mento_no;
	}
	public String getMa_content() {
		return ma_content;
	}
	public void setMa_content(String ma_content) {
		this.ma_content = ma_content;
	}
	public Date getMa_date() {
		return ma_date;
	}
	public void setMa_date(Date ma_date) {
		this.ma_date = ma_date;
	}
	
	
	
}
