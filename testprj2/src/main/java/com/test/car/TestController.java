package com.test.car;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class TestController {

	
	@Autowired
	TestDao dao;	
	
   
    public  TestController( TestDao dao) {
       this.dao  = dao;
    }
    

    @GetMapping("/test")
    public String getTestList(Model model) {
        model.addAttribute("testList", dao.getTestList());
        
        System.out.println(  dao.getTestList() );
        
        
        return "test";
    }

   /* @PostMapping("/test/insert")
    public String insertTestData(Test test) {
        dao.insertTestData(test);
        return "redirect:/test";
    } */

    @PostMapping("/test/updateDate")
    public String updateTestDate(String test_id) {
        dao.updateTestDate(test_id);
        return "redirect:/test";
    }
}