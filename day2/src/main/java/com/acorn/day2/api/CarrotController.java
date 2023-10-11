package com.acorn.day2.api;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CarrotController {

	@Autowired
	CarrotDAO dao;

	@RequestMapping("/select")
	public String SearchAll(Model model) throws SQLException {
		ArrayList<CarrotDTO> carrotList = dao.selectAll();
		model.addAttribute("carrotList", carrotList);
		return "carrot";
	}

}
