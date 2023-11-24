package com.sh.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.login.domain.LoginDTO;
import com.sh.login.repository.LoginRepositoryI;

@Service
public class LoginService implements LoginServiceI {

	@Autowired
	private LoginRepositoryI userRepository;

	@Override
	public boolean checkLogin(LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		return userRepository.checklogin(loginDTO);
	}

	@Override
	public List<Object> selectAll(LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		return userRepository.selectAll(loginDTO);
	}

	@Override
	public int updateUser(LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		return userRepository.update(loginDTO);
	}
}