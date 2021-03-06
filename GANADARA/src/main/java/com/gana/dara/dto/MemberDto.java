package com.gana.dara.dto;

import java.util.Date;

public class MemberDto {

	private int member_no;
	private String member_name;
	private String member_nic;
	private String member_email;
	private String member_pw;
	private String member_tel;
	private String member_birth;
	private String member_con;
	private Date member_regdate;
	private String member_del;
	private String member_role;
	private String member_daily;
	private int mento_no;
	private String member_key;
	
	private int db_no;
	private String db_title;
	private String db_content;
	private Date db_date;
	private String db_answer;
	
	public MemberDto() {
	}

	public MemberDto(int member_no, String member_name, String member_nic, String member_email, String member_pw,
			String member_tel, String member_birth, String member_con, Date member_regdate, String member_del,
			String member_role, String member_daily, int mento_no, String member_key) {
		this.member_no = member_no;
		this.member_name = member_name;
		this.member_nic = member_nic;
		this.member_email = member_email;
		this.member_pw = member_pw;
		this.member_tel = member_tel;
		this.member_birth = member_birth;
		this.member_con = member_con;
		this.member_regdate = member_regdate;
		this.member_del = member_del;
		this.member_role = member_role;
		this.member_daily = member_daily;
		this.mento_no = mento_no;
		this.member_key = member_key;
	}
	
	public MemberDto(int member_no, String member_name, String member_nic, String member_email, String member_pw,
			String member_tel, String member_birth, String member_con, Date member_regdate, String member_del,
			String member_role, String member_daily, int mento_no, String member_key, int db_no,
			String db_title, String db_content, Date db_date, String db_answer) {
		this.member_no = member_no;
		this.member_name = member_name;
		this.member_nic = member_nic;
		this.member_email = member_email;
		this.member_pw = member_pw;
		this.member_tel = member_tel;
		this.member_birth = member_birth;
		this.member_con = member_con;
		this.member_regdate = member_regdate;
		this.member_del = member_del;
		this.member_role = member_role;
		this.member_daily = member_daily;
		this.mento_no = mento_no;
		this.member_key = member_key;
		this.db_no = db_no;
		this.db_title = db_title;
		this.db_content = db_content;
		this.db_date = db_date;
		this.db_answer = db_answer;
	}
	
	
	// 유저 인증키 생성
	public MemberDto(String member_email, String member_key) {
		this.member_email = member_email;
	}
	
	/*
	 * 	
	//유저 인증키 Y로 바꾸기
	public MemberDto(String member_email, String member_nic) {
		this.member_email = member_email;
		this.member_nic = member_nic;
	}
	 * 
	 */
	
	// 개인정보수정
	public MemberDto(String member_name, String member_nic, String member_email, String member_pw, String member_tel, String member_birth, String member_con, String member_role, String member_daily) {
		this.member_name = member_name;
		this.member_nic = member_nic;
		this.member_email = member_email;
		this.member_pw = member_pw;
		this.member_tel = member_tel;
		this.member_birth = member_birth;
		this.member_con = member_con;
		this.member_role = member_role;
		this.member_daily = member_daily;
	}
	
	

	
	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_nic() {
		return member_nic;
	}

	public void setMember_nic(String member_nic) {
		this.member_nic = member_nic;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_con() {
		return member_con;
	}

	public void setMember_con(String member_con) {
		this.member_con = member_con;
	}

	public Date getMember_regdate() {
		return member_regdate;
	}

	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}

	public String getMember_del() {
		return member_del;
	}

	public void setMember_del(String member_del) {
		this.member_del = member_del;
	}

	public String getMember_role() {
		return member_role;
	}

	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}

	public String getMember_daily() {
		return member_daily;
	}

	public void setMember_daily(String member_daily) {
		this.member_daily = member_daily;
	}
	
	public int getMento_no() {
		return mento_no;
	}
	
	public void setMento_no(int mento_no) {
		this.mento_no = mento_no;
	}
	
	public String getMember_key() {
		return member_key;
	}

	public void setMember_key(String member_key) {
		this.member_key = member_key;
	}

	public int getDb_no() {
		return db_no;
	}

	public void setDb_no(int db_no) {
		this.db_no = db_no;
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
