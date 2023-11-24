package com.sh.myPage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sh.login.service.LoginService;

@Controller
public class MyPageController {
   @Autowired
   LoginService loginService;

//   @GetMapping("/myPage")
//   public String myPage() {
//      
//      return "/myPage/myPage";
//   }

   @PostMapping("/myPage")
   public String myPage(@RequestParam String user_code, HttpServletRequest request) {

      System.out.println("테스트" + user_code);

      HttpSession session = request.getSession();

      List<Object> updatedUser = loginService.getHeatByUserCode(user_code);

      // json객체로
      Gson gson = new GsonBuilder().create();
      String jsonResult = gson.toJson(updatedUser);
      //return jsonResult;
      
      System.out.println(jsonResult);

      session.setAttribute("updatedUserData", jsonResult);

      return "/myPage/myPage";
   }

}