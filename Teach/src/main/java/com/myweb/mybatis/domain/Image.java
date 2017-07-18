package com.myweb.mybatis.domain;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class Image {
	
	public String getImage_id() {
		return image_id;
	}
	public void setImage_id(String image_id) {
		this.image_id = image_id;
	}
	public String getFsn() {
		return fsn;
	}
	public void setFsn(String fsn) {
		this.fsn = fsn;
	}
	public String getOfn() {
		return ofn;
	}
	public void setOfn(String ofn) {
		this.ofn = ofn;
	}

	public MultipartFile getFilef() {
		return filef;
	}
	public void setFilef(MultipartFile filef) {
		this.filef = filef;
	}
	
	
	
	MultipartFile filef;  // 파일
	String image_id; // index
	String fsn;	 // file system name  random
	String ofn; // original file name
	@Override
	public String toString() {
		return "Image [filef=" + filef + ", image_id=" + image_id + ", fsn=" + fsn + ", ofn=" + ofn + "]";
	}
	
	
	
}
