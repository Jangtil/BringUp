package com.myweb.mybatis.dao;

import java.util.List;

import com.myweb.mybatis.domain.Board;
import com.myweb.mybatis.domain.Mylecture;
import com.myweb.mybatis.domain.Reading;
import com.myweb.mybatis.domain.SelMylectures;
import com.myweb.mybatis.domain.TeachName;

public interface BoardDao {
	List<Board>selectAllBoard();
	List<Board>selectBoardByName(String lecture);
	List<Board>selectBoardById(Board board);

	Board selectContentById(Board board);
	boolean insertBoard(Board board);
	boolean deleteBoard(Integer id);
	boolean insertlecture(Mylecture mylecture);
	List<SelMylectures> selectMyLecture(String id);
	boolean insertReading(Reading reading);	
}
