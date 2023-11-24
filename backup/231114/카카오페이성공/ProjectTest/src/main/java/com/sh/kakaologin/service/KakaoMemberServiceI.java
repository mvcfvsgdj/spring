package com.sh.kakaologin.service;

import java.util.List;

import com.sh.kakaologin.domain.KakaoUserDTO;

public interface KakaoMemberServiceI {

	public int registerMember(KakaoUserDTO kakaoUserDTO);

	public List<KakaoUserDTO> getMemberList();
}
