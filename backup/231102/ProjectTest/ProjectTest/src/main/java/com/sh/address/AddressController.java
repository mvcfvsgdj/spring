package com.sh.address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sh.kakaologin.KakaoMemberServiceI;
import com.sh.kakaologin.KakaoUserDTO;

@Controller
public class AddressController {

	@Autowired
	AddressServiceI service;

	@GetMapping("/address")
	public String addressF() {
		return "address";
	}

	@PostMapping("/addressForm")
	public String registerMember(AddressDTO addressDTO) {
		service.registerMember(addressDTO);
		return "address";
	}
}
