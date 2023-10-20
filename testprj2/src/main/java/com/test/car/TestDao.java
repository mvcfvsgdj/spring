package com.test.car;

 

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
 


@Repository
public class TestDao {
    private final SqlSession session;
    private static String namespace = "com.test.TestMapper.";

    @Autowired
    public TestDao(SqlSession session) {
        this.session = session;
    }
 
    public List<Test> getTestList() {
        return session.selectList(namespace + "selectAll");
    }
    
    public void insertTestData(Test test) {
        session.insert(namespace + "insertTestData", test);
    }

    public void updateTestDate(String test_id) {
        session.update(namespace + "updateTestDate", test_id);
    }
}