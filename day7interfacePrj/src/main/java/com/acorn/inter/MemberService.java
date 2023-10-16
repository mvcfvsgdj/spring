package com.acorn.inter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	GoogleApi api;

	public void MemberRegister() {
		
		api.위도경도구하기();
		
	}
}
