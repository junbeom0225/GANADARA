package com.gana.dara.dto;

public class EduDto {
	
	private int edu_no;
	private String edu_grade;
	private int edu_level;
	private String edu_title;
	private String edu_detail;
	private String edu_url;
	
	public EduDto(int edu_no, String edu_grade, int edu_level, String edu_title, String edu_detail, String edu_url) {
		super();
		this.edu_no = edu_no;
		this.edu_grade = edu_grade;
		this.edu_level = edu_level;
		this.edu_title = edu_title;
		this.edu_detail = edu_detail;
		this.edu_url = edu_url;
	}
	public int getEdu_no() {
		return edu_no;
	}
	public void setEdu_no(int edu_no) {
		this.edu_no = edu_no;
	}
	public String getEdu_grade() {
		return edu_grade;
	}
	public void setEdu_grade(String edu_grade) {
		this.edu_grade = edu_grade;
	}
	public int getEdu_level() {
		return edu_level;
	}
	public void setEdu_level(int edu_level) {
		this.edu_level = edu_level;
	}
	public String getEdu_title() {
		return edu_title;
	}
	public void setEdu_title(String edu_title) {
		this.edu_title = edu_title;
	}
	public String getEdu_detail() {
		return edu_detail;
	}
	public void setEdu_detail(String edu_detail) {
		this.edu_detail = edu_detail;
	}
	public String getEdu_url() {
		return edu_url;
	}
	public void setEdu_url(String edu_url) {
		this.edu_url = edu_url;
	}
	
	

}
