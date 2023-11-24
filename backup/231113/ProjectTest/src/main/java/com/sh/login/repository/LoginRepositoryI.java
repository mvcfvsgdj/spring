package com.sh.login.repository;

import java.util.List;

import com.sh.login.domain.LoginDTO;

public interface LoginRepositoryI {
	public boolean checklogin(LoginDTO loginDTO);

	List<Object> selectAll(LoginDTO loginDTO);

	public int update(LoginDTO loginDTO);

	public int delete(LoginDTO loginDTO);
}
