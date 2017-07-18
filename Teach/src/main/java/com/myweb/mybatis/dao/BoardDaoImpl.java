package com.myweb.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.myweb.mybatis.domain.Board;
import com.myweb.mybatis.domain.DeleteBoard;
import com.myweb.mybatis.domain.EditBoard;
import com.myweb.mybatis.domain.Image;
import com.myweb.mybatis.domain.Lecture;
import com.myweb.mybatis.domain.Reading;
import com.myweb.mybatis.domain.SelMylectures;

public class BoardDaoImpl implements BoardDao {
	private SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Board> selectAllBoard() {
		List<Board> lsboard = sqlSession.selectList("selectallboard");
		return lsboard;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Board> selectBoardByName(String lecture) {
		List<Board> lsboard = sqlSession.selectList("selectBoardByName", lecture);
		return lsboard;
	}

	@Override
	public boolean insertBoard(Board board) {
		int res = sqlSession.insert("insertboard", board);
		if (res == 1)
			return true;
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Board> selectBoardById(Integer lectureid) {
		List<Board> lsboard = sqlSession.selectList("selectBoardById", lectureid);
		
		return lsboard;
	}

	@Override
	public boolean deleteBoard(Integer id,String sessionid) {
		DeleteBoard vo = new DeleteBoard();
		vo.setId(id);
		vo.setSessionid(sessionid);
		
		int res = sqlSession.delete("deleteBoardById", vo);
		if (res == 1)
			return true;
		return false;
	}

	@Override
	public boolean insertlecture(Lecture lecture) {
		System.out.println(lecture.toString());
		int res = sqlSession.insert("insertlecture", lecture);
		if(res ==1)
			return true;
		return false;
	}

	@Override
	public List<SelMylectures> selectMyLecture(String id) {
		@SuppressWarnings("unchecked")
		List<SelMylectures> lsList = sqlSession.selectList("selmylecture", id);
		return lsList;
	}

	@Override
	public Board selectContentById(Board board) {
		Board resboard = (Board) sqlSession.selectOne("selectContentById", board);
		return resboard;
	}

	@Override
	public boolean insertReading(Reading reading) {
		
		try {
			int res = sqlSession.insert("insertreading", reading);
			if (res == 1)
				return true;
			return false;
		} catch (Exception e) {
			return false;
		}
		

	}

	@Override
	public List<Lecture> selectLectureById(String id) {
		@SuppressWarnings("unchecked")
		List<Lecture> lslecture = sqlSession.selectList("selectlecturebyid",id);
		
		
		return lslecture;
	}

	@Override
	public boolean insertImage(Image image) {
		try {
			int res = sqlSession.insert("insertImage", image);
			if (res == 1)
				return true;
			return false;
		} catch (Exception e) {
			return false;
		}
	
	}

	@Override
	public boolean editBoardById(EditBoard editboard) {
		try{
			int res = sqlSession.update("editboard",editboard);
			if(res ==1)
				return true;
			return false;
		}catch(Exception e){
			return false;
		}
	}





}
