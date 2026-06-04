package com.kh.study.key;

public class Ahchas {
	private String ah;
	private String cha;
	
	public Ahchas() {
		super();
	}
	public Ahchas(String ah, String cha) {
		super();
		this.ah = ah;
		this.cha = cha;
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
	@Override
	public String toString() {
		return "Ahchas [ah=" + ah + ", cha=" + cha + "]";
	}
	

}
