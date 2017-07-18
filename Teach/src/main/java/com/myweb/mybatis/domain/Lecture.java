package com.myweb.mybatis.domain;

public class Lecture {
	Integer id;
	String name;
	String teach;
	String code;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeach() {
		return teach;
	}
	public void setTeach(String teach) {
		this.teach = teach;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "Lecture [id=" + id + ", name=" + name + ", teach=" + teach + ", code=" + code + "]";
	}
	
}
