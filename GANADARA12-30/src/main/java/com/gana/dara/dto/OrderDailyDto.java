package com.gana.dara.dto;

import java.util.Date;

public class OrderDailyDto {
	
	private int order_no;
	private int member_no;
	private int ds_no;
	private int order_count;
	private Date order_date;
	private Date order_edate;
	
	
	public OrderDailyDto() {
	}


	public OrderDailyDto(int order_no, int member_no, int ds_no, int order_count, Date order_date, Date order_edate) {
		super();
		this.order_no = order_no;
		this.member_no = member_no;
		this.ds_no = ds_no;
		this.order_count = order_count;
		this.order_date = order_date;
		this.order_edate = order_edate;
	}


	public int getOrder_no() {
		return order_no;
	}


	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}


	public int getMember_no() {
		return member_no;
	}


	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}


	public int getDs_no() {
		return ds_no;
	}


	public void setDs_no(int ds_no) {
		this.ds_no = ds_no;
	}


	public int getOrder_count() {
		return order_count;
	}


	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}


	public Date getOrder_date() {
		return order_date;
	}


	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}


	public Date getOrder_edate() {
		return order_edate;
	}


	public void setOrder_edate(Date order_edate) {
		this.order_edate = order_edate;
	}
	
	
	
	

}
