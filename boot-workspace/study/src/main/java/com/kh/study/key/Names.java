package com.kh.study.key;

public class Names {
	
	private String name;
	private String name2;
	
	public Names() {
		super();
	}
	public Names(String name, String name2) {
		super();
		this.name = name;
		this.name2 = name2;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	@Override
	public String toString() {
		return "Names [name=" + name + ", name2=" + name2 + "]";
	}
	
	

}
