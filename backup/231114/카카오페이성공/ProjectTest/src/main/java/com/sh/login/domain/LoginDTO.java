package com.sh.login.domain;

import lombok.Data;

@Data
public class LoginDTO {
	private String user_code;
	private String user_kakao;
	private String user_id;
	private String user_pw;
	private String address;
	private String phone_num;
	private String member_post;
	private String member_addr;
	private String detailed_address;
	private String user_birth;
	private String user_nickname;
	private String user_image;
	private String user_heat;

	public LoginDTO(String user_id, String user_pw) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
	}

}
