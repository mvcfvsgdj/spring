package com.sh.homePage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class homePageController {

	@GetMapping("/homePage")
	public String homePage() {

		// return "/homePage/homePage";

		return "/homePage/homePage";
	}

	@PostMapping("/location-form")
	public String location(HttpSession session) {

		return "/homePage/homePage";
	}

}
