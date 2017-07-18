package com.myweb.mybatis.dao;

import java.util.List;

import com.myweb.mybatis.domain.Member;
import com.myweb.mybatis.domain.Reading;


public interface MemberDao {
	List<Member>selectAllMember();
	boolean insertmember(Member member);
	boolean login(Member member);
	Member selectMemeberById(String id);
	boolean idchk(String id);

}
