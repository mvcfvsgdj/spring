package com.sh.saveUser.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.saveUser.service.UserMemberService;

@Controller
public class UserController {

	@Autowired
	UserMemberService service;

	@Autowired
	private JavaMailSender mailSender;

	@GetMapping("/shSaveUser")
	public String goTosave() {
		return "/saveUser/saveUser";
	}

	@RequestMapping(value = "/testing/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) throws Exception {
		if (!isValidEmailAddress(email)) {
			throw new Exception("이메일 주소 형식이 올바르지 않습니다. 다시 입력해주세요.");
		}

		System.out.println("이메일 데이터 전송 확인");
		System.out.println("인증 이메일 : " + email);

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 :" + checkNum);

		String setFrom = "dhdl2369@gmail.com";
		String toMail = email;
		String title = "SecondHands 회원가입 인증 이메일 입니다.";
		String content = "인증 번호는 : " + checkNum + "입니다.\n" + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("이메일 전송에 실패했습니다. 다시 시도해주세요.");
		}

		String num = Integer.toString(checkNum);
		return num;
	}

	@ResponseBody
	@PostMapping("/isUserIdExists")
	public boolean isUserIdExists(@RequestParam String user_id) {
		return service.isUserIdExists(user_id);
	}

	private boolean isValidEmailAddress(String email) {
		String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
		return email.matches(emailRegex);
	}
}