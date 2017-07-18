package com.myweb.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.myweb.mybatis.domain.Board;
import com.myweb.mybatis.domain.Mylecture;
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
	public List<Board> selectBoardById(Board board) {
		List<Board> lsboard = sqlSession.selectList("selectBoardById", board);
		
	
		return lsboard;
	}

	@Override
	public boolean deleteBoard(Integer id) {
		int res = sqlSession.delete("deleteBoardById", id);
		if (res == 1)
			return true;
		return false;
	}

	@Override
	public boolean insertlecture(Mylecture mylecture) {

		int res = (Integer) sqlSession.selectOne("countlecture", mylecture.getCode()); // 해당
																						// 강의가
																						// 존재
																						// 하는지?
		if (res == 1) {// 존재한다
			int res3 = (Integer) sqlSession.selectOne("countmylecture", mylecture); // 해당강의를
																					// 이미
																					// 추가했는지
			if (res3 > 0 || res3 == -1) {
				return false;
			} else {
				int res2 = sqlSession.insert("insertlecture", mylecture);
				if (res2 == 1) {
					return true;
				} else {
					return false;
				}
			}

		} else {
			return false;
		}

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
			e.printStackTrace();
		}
		return false;

	}
}
