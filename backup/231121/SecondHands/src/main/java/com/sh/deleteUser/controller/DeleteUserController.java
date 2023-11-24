package com.sh.deleteUser.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.login.domain.LoginDTO;
import com.sh.login.service.LoginService;
import com.sh.order.service.OrderServiceI;
import com.sh.product.service.ProductService;

@Controller
public class DeleteUserController {

	@Autowired
	private LoginService loginService;

	@GetMapping("/deleteUser")
	public String myPage() {
		return "/myPage/deleteUser";
	}
	@Autowired
	private ProductService productService;
	
	
	@Autowired
	private OrderServiceI orderService;
	
	@PostMapping("/delete")
	public String processDelete(@ModelAttribute LoginDTO loginDTO, @RequestParam String user_id, @RequestParam String user_code ,HttpServletRequest request) {
	  
		System.out.println(loginDTO);
		productService.deleteProduct4(user_id);
		productService.deleteProduct3(user_code);
		orderService.deleteProduct5(user_id);
		
		if (loginService.deleteUser(loginDTO) > 0) {
	        // 삭제 성공
	        HttpSession session = request.getSession();
	        // 세션에서 사용자 정보 삭제
	        session.removeAttribute("selectedUser");
	        return "redirect:/homePage";
	    } else {
	        return "redirect:/homePage?error=deleteUser";
	    }
	}

}

