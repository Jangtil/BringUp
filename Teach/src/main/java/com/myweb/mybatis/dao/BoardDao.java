package com.myweb.mybatis.dao;

import java.util.List;

import com.myweb.mybatis.domain.Board;
import com.myweb.mybatis.domain.EditBoard;
import com.myweb.mybatis.domain.Image;
import com.myweb.mybatis.domain.Lecture;
import com.myweb.mybatis.domain.Reading;
import com.myweb.mybatis.domain.SelMylectures;

public interface BoardDao {
	List<Board>selectAllBoard();
	List<Board>selectBoardByName(String lecture);
	List<Board>selectBoardById(Integer lectureid);
	
	Board selectContentById(Board board);
	boolean insertBoard(Board board);
	boolean deleteBoard(Integer id,String sessionid);
	boolean insertlecture(Lecture lecture);
	boolean editBoardById(EditBoard editboard);
	List<SelMylectures> selectMyLecture(String id);
	List<Lecture> selectLectureById(String id);
	boolean insertReading(Reading reading);	
	boolean insertImage(Image image);
}
