package com.kh.study;

import java.sql.Date;

public class Bcd {
	private String ah;
	private String cha;
	private Date createDate;
	private int num;
	
	public Bcd() {
		super();
	}
	public Bcd(String ah, String cha, Date createDate, int num) {
		super();
		this.ah = ah;
		this.cha = cha;
		this.createDate = createDate;
		this.num = num;
	}
	public String getAh() {
		return ah;
	}
	public void setAh(String ah) {
		this.ah = ah;
	}
	public String getCha() {
		return cha;
	}
	public void setCha(String cha) {
		this.cha = cha;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "Bcd [ah=" + ah + ", cha=" + cha + ", createDate=" + createDate + ", num=" + num + "]";
	}

}
