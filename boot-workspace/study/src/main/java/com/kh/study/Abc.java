package com.kh.study;

import java.sql.Date;

public class Abc {
	private String name;
	private String name2;
	private Date createDate;
	private int num;
	public Abc(String name, String name2, Date createDate, int num) {
		super();
		this.name = name;
		this.name2 = name2;
		this.createDate = createDate;
		this.num = num;
	}
	public Abc() {
		super();
	}
	public String getName() {
		return name;
	}
	public String getName2() {
		return name2;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public int getNum() {
		return num;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
}
