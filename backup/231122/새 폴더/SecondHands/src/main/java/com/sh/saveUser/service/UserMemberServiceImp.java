package com.sh.saveUser.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.saveUser.domain.UserDTO;
import com.sh.saveUser.repository.UserMemberRepositoryI;

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