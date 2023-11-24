package com.sh.login.service;

import java.util.List;

import com.sh.login.domain.LoginDTO;

public interface LoginServiceI {

	public boolean checkLogin(LoginDTO loginDTO);

	List<Object> selectAll(LoginDTO loginDTO);

	public int updateUser(LoginDTO loginDTO);

	public int deleteUser(LoginDTO loginDTO);
}
