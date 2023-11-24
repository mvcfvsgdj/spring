package com.sh.kakaologin;

import java.util.List;

public interface KakaoMemberRepositoryI {

	public int insert(KakaoUserDTO kakaoUserDTO);

	public List<KakaoUserDTO> selectAll();
}