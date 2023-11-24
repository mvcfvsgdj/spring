package com.sh.kakaologin;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class KakaoRepositoryRealImp implements KakaoMemberRepositoryI {

	@Autowired
	private SqlSession session;
	private static String namespace = "com.sh.kakaologin.KakaoUserMapper.";

	@Override
	public int insert(KakaoUserDTO kakaoUserDTO) {

		return session.insert(namespace + "insertUser", kakaoUserDTO);
	}
	

	@Override
	public List<KakaoUserDTO> selectAll() {
		 return session.selectList(namespace + "selectAll");
	}


}
