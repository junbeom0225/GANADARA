package com.gana.dara.dto;

public class EduWordDto {
	
	private int edu_no;
	private String edu_grade;
	private int ew_level;
	private String ew_content;
	
	public EduWordDto(int edu_no, String edu_grade, int ew_level, String ew_content) {
		super();
		this.edu_no = edu_no;
		this.edu_grade = edu_grade;
		this.ew_level = ew_level;
		this.ew_content = ew_content;
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

	public int getEw_level() {
		return ew_level;
	}

	public void setEw_level(int ew_level) {
		this.ew_level = ew_level;
	}

	public String getEw_content() {
		return ew_content;
	}

	public void setEw_content(String ew_content) {
		this.ew_content = ew_content;
	}

}
