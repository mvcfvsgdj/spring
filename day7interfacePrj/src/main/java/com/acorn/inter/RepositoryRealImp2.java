package com.acorn.inter;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

 

@Repository
public class RepositoryRealImp2  implements MemberRepositoryI {
	  @Autowired
	    private SqlSession session;
	    private static String namespace = "com.acorn.MemberMapper.";
	@Override
	public int insert(Member member) {
		 
		return session.insert(namespace+"insert", member);
	}

	@Override
	public List<Member> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String userId) {
		// TODO Auto-generated method stub
		return 0;
	} 
	

}
