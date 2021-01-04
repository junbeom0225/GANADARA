package com.gana.dara.dto;

import java.sql.Date;

public class DailyBoardDto {

	private int db_no;
	private int member_no;
	private String db_title;
	private String db_content;
	private Date db_date;
	private String db_answer;
	
	public DailyBoardDto() {
		
	}
	
	public DailyBoardDto(int db_no, int member_no, String db_title, 
						String db_content, Date db_date, String db_answer) {
		this.db_no = db_no;
		this.member_no = member_no;
		this.db_title = db_title;
		this.db_content = db_content;
		this.db_date = db_date;
		this.db_answer = db_answer;
	}

	public int getDb_no() {
		return db_no;
	}

	public void setDb_no(int db_no) {
		this.db_no = db_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getDb_title() {
		return db_title;
	}

	public void setDb_title(String db_title) {
		this.db_title = db_title;
	}

	public String getDb_content() {
		return db_content;
	}

	public void setDb_content(String db_content) {
		this.db_content = db_content;
	}

	public Date getDb_date() {
		return db_date;
	}

	public void setDb_date(Date db_date) {
		this.db_date = db_date;
	}

	public String getDb_answer() {
		return db_answer;
	}

	public void setDb_answer(String db_answer) {
		this.db_answer = db_answer;
	}
	
	
	
}
