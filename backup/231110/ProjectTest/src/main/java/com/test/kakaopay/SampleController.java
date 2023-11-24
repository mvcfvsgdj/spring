package com.test.kakaopay;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.login.domain.LoginDTO;
import com.sh.order.domain.OrderDTO;
import com.sh.order.service.OrderServiceI;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class SampleController {

    @Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;
	@Autowired
	OrderServiceI service;
    @GetMapping("/kakaoPay")
    public String kakaoPayGet() {
        return "kakaoPay"; // 경로에 맞게 설정 (kakaoPay.html 파일이 있어야 함)
    }

    @PostMapping("/kakaoPay")
    public String kakaoPay(HttpSession session,Model model) {
        log.info("kakaoPay post............................................");
    	LoginDTO loggedInUser = (LoginDTO) session.getAttribute("user");
		List<OrderDTO> orderList = service.getOrdersByUserCode(loggedInUser.getUser_id());
		model.addAttribute("user", loggedInUser);
		model.addAttribute("orderList", orderList);

        return "redirect:" + kakaopay.kakaoPayReady(null);
    }

 
    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        return "kakaoPaySuccess"; // 경로에 맞게 설정 (kakaoPaySuccess.html 파일이 있어야 함)
    }

}
