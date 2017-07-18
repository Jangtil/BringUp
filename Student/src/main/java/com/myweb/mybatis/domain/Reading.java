package com.myweb.mybatis.domain;

public class Reading {
	Integer id;
	Integer board_id;
	String member_id;
	Integer count;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getBoard_id() {
		return board_id;
	}
	public void setBoard_id(Integer board_id) {
		this.board_id = board_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Reading [id=" + id + ", board_id=" + board_id + ", member_id=" + member_id + ", count=" + count + "]";
	}
	
}
