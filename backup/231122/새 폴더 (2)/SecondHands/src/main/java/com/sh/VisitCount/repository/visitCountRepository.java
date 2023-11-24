package com.sh.VisitCount.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class visitCountRepository {

	@Autowired
	private SqlSession session;
	private static String namespace ="com.sh.";
	
}