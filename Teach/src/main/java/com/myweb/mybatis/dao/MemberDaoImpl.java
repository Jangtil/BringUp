package com.myweb.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.myweb.mybatis.domain.Member;
import com.myweb.mybatis.domain.Reading;


public class MemberDaoImpl implements MemberDao {
	private SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Member> selectAllMember() {
//		List<Member> listmember = sqlSession.selectList("selectallmember");
//		for(Member member : listmember){
//			System.out.println(member.toString());
//		}
		return null;
	}

	@Override
	public boolean insertmember(Member member) {
		int res = sqlSession.insert("insertmember", member);
		if (res == 1)
			return true;
		return false;
	}

	@Override
	public boolean login(Member member) {
		int res = (Integer) sqlSession.selectOne("loginmember", member);
		if (res == 1)
			return true;
		return false;
	}

	@Override
	public Member selectMemeberById(String id) {
		return (Member) sqlSession.selectOne("selectById", id);
	}

	@Override
	public boolean idchk(String id) {
		int res = (Integer) sqlSession.selectOne("idchk",id);
		if(res ==1)
			return true;
		return false;
	}

}
