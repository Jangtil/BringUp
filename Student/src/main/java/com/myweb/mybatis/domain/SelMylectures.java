package com.myweb.mybatis.domain;

public class SelMylectures {
	String stdid;
	String lecture;
	String teach;
	String lecturecode;
	Integer lectureid;
	String teachname;
	
	
	public String getTeachname() {
		return teachname;
	}
	public void setTeachname(String teachname) {
		this.teachname = teachname;
	}
	public Integer getLectureid() {
		return lectureid;
	}
	public void setLectureid(Integer lectureid) {
		this.lectureid = lectureid;
	}
	public String getStdid() {
		return stdid;
	}
	public void setStdid(String stdid) {
		this.stdid = stdid;
	}
	public String getLecture() {
		return lecture;
	}
	public void setLecture(String lecture) {
		this.lecture = lecture;
	}
	public String getTeach() {
		return teach;
	}
	public void setTeach(String teach) {
		this.teach = teach;
	}
	public String getLecturecode() {
		return lecturecode;
	}
	public void setLecturecode(String lecturecode) {
		this.lecturecode = lecturecode;
	}
	@Override
	public String toString() {
		return "SelMylectures [stdid=" + stdid + ", lecture=" + lecture + ", teach=" + teach + ", lecturecode="
				+ lecturecode + "]";
	}
	
	
	
}
