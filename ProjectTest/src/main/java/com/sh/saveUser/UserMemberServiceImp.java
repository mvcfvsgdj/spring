package com.sh.saveUser;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserMemberServiceImp implements UserMemberService {

	@Autowired
	UserMemberRepositoryI dao;

	@Override
	public int registerMember(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return dao.insert(userDTO);
	}

	@Override
	public boolean isUserIdExists(String user_id) {
		return dao.getUserById(user_id);
	}
}