 package com.sh.scroll.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.login.domain.LoginDTO;
import com.sh.product.domain.ProductDTO;
import com.sh.product.service.ProductService;
import com.sh.scroll.domain.ScrollDTO;
import com.sh.scroll.service.scrollServiceI;

@Controller
public class LocationController {

	@Autowired
	scrollServiceI service;

	@Autowired
	private ProductService productservice;

	@PostMapping("/location_form")
	public String location(@RequestParam(name = "newLocation", required = false) String newLocation, Model model,
			HttpSession session) {

		session.setAttribute("detail_loc", newLocation);

		// System.out.println(newLocation);

		return "/homePage/homePage";
	}

	@PostMapping("/localproductList")
	public String localProductList(@RequestParam(name = "newLocation", required = false) String newLocation,
			Model model, HttpSession session) {

		// *** 로그인 정보 받아오기 ***
		LoginDTO login = (LoginDTO) session.getAttribute("user");
		String userId = login.getUser_id();
		//System.out.println(userId + "asdfafdasfafas");

		// 사용자 정보를 기반으로 필요한 데이터를 얻어온다.
		List<ProductDTO> products = productservice.getLocalProducts(newLocation); // Use getLocalProducts

		// 세션에서 detail_loc 값을 가져오기
		String detailLoc = (String) session.getAttribute("detail_loc");

		// 세션에 데이터 추가
		session.setAttribute("detail_loc", detailLoc);
		session.setAttribute("products", products);

		return "/products/localproductList";
	}

}
