package com.myweb.mybatis.domain;

public class Board {
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Integer getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(Integer lecture_id) {
		this.lecture_id = lecture_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLecture() {
		return lecture;
	}
	public void setLecture(String lecture) {
		this.lecture = lecture;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}


	String lecture;
	Integer id;
	String member_id;
	Integer lecture_id;
	String title;
	String content;
	String date;
	String flag;
	Integer count;
	
	@Override
	public String toString() {
		return "Board [lecture=" + lecture + ", id=" + id + ", member_id=" + member_id + ", lecture_id=" + lecture_id
				+ ", title=" + title + ", content=" + content + ", date=" + date + ", flag=" + flag + "]";
	}

	

	
	
	
	
}
