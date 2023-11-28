package com.sh.kakaologin.repository;

import java.util.List;

import com.sh.kakaologin.domain.KakaoUserDTO;

public interface KakaoMemberRepositoryI {

	public int insert(KakaoUserDTO kakaoUserDTO);

	public List<KakaoUserDTO> selectAll();
}