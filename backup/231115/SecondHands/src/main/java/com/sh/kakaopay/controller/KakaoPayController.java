package com.sh.kakaopay.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.kakaopay.domain.KakaoPayApprovalVO;
import com.sh.kakaopay.service.KakaoPayService;
import com.sh.order.domain.OrderDTO;
import com.sh.order.service.OrderServiceI;
import com.sh.product.domain.ProductDTO;
import com.sh.product.service.ProductServiceI;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class KakaoPayController {

	@Setter(onMethod_ = @Autowired)
	private KakaoPayService kakaopay;

	@Autowired
	OrderServiceI service;

	@Autowired
	ProductServiceI productservice;

	OrderDTO order;

	@GetMapping("/kakaoPay")
	public void kakaoPayGet() {

	}
	/*
	 * @GetMapping("/kakaoPay") public String kakaoPayGet(@RequestParam String
	 * board_id, Model model, HttpSession session) { ProductDTO product =
	 * productservice.getProductById(board_id); System.out.println("아이잉"+board_id);
	 * List<ProductDTO> productList = new ArrayList<>(); // 새로운 리스트를 생성합니다.
	 * 
	 * // 원하는 상품만 추가합니다. productList.add(product); model.addAttribute("product",
	 * product); model.addAttribute("products", productList);
	 * 
	 * return "/kakaoPay"; }
	 */

	@PostMapping("/kakaoPay")
	public String kakaoPay(@RequestParam String board_id, @RequestParam String member_post,
			@RequestParam String member_addr, @RequestParam String detailed_address, @RequestParam String delivery_req,
			Model model, HttpSession session) {
		ProductDTO product = productservice.getProductById(board_id);
		System.out.println("아이잉" + board_id);
		List<ProductDTO> productList = new ArrayList<>(); // 새로운 리스트를 생성합니다.

		// 원하는 상품만 추가합니다.
		productList.add(product);
		model.addAttribute("member_post", member_post);
		model.addAttribute("member_addr", member_addr);
		model.addAttribute("detailed_address", detailed_address);
		model.addAttribute("delivery_req", delivery_req);
		model.addAttribute("product", product);
		model.addAttribute("products", productList);
		System.out.println("member_post: " + member_post);
		System.out.println("member_addr: " + member_addr);
		System.out.println("detailed_address: " + detailed_address);
		System.out.println("delivery_req: " + delivery_req);
		return "/kakaoPay";

	}

	@PostMapping("/kakaoPayGo")
	public String kakaoPayGo(@RequestParam String board_id, @RequestParam String board_title,
			@RequestParam String user_nickname, @RequestParam String board_price, @RequestParam String member_addr,
			@RequestParam String detailed_address, @RequestParam String member_post, @RequestParam String delivery_req,
			Model model, OrderDTO orderDTO) {
		ProductDTO product = productservice.getProductById(board_id);
		List<ProductDTO> productList = new ArrayList<>(); 
		model.addAttribute("board_id", board_id);
		model.addAttribute("board_title", board_title);
		model.addAttribute("user_nickname", user_nickname);
		model.addAttribute("board_price", board_price);
		model.addAttribute("member_addr", member_addr);
		model.addAttribute("member_post", member_post);
		model.addAttribute("detailed_address", detailed_address);
		model.addAttribute("delivery_req", delivery_req);
		model.addAttribute("product", product);
		model.addAttribute("products", productList);
		System.out.println("보드id" + board_id);
	//	service.registerOrder(orderDTO);
		System.out.println("오더41341243" + orderDTO);
		
		//
		this.order =orderDTO;
		
		return "redirect:" + kakaopay.kakaoPayReady(board_id, board_title, user_nickname, board_price);

	}

	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, String board_id, String board_title,
			String user_nickname, String board_price, Model model ) {
	
		log.info("kakaoPaySuccess pg_token : " + pg_token);
		
		service.registerOrder(order);
		
		KakaoPayApprovalVO kakaoPayApprovalVO =   kakaopay.kakaoPayInfo(pg_token, board_id, board_title, user_nickname, board_price); 
		
		//model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token, board_id, board_title, user_nickname, board_price));
		return "redirect:/showOrder";
		
	}

}