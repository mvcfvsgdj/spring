package com.sh.kakaologin;

import java.util.List;

public interface KakaoMemberServiceI {

	public int registerMember(KakaoUserDTO kakaoUserDTO);

	public List<KakaoUserDTO> getMemberList();
}
