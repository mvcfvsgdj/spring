package com.sh.homePage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class homePageController {

	@GetMapping("/homePage")
	public String homePage() {

		return "/homePage/homePage";
	}

}
