package com.sh.login.repository;

import java.util.List;

import com.sh.login.domain.LoginDTO;

public interface LoginRepositoryI {
	public boolean checklogin(LoginDTO loginDTO);

	List<Object> selectAll(LoginDTO loginDTO);

	public int update(LoginDTO loginDTO);

	public int delete(LoginDTO loginDTO);
	
	public int updateUserImg(LoginDTO loginDTO);
	
	public String selectHeat(String sell_code);

	public String selectHeatU(String sell_code);

	int updateHeat(String user_heat, String user_code);

	void saveHeat(String user_code, String user_heat);

	   List<Object> getHeatByUserCode(String user_code);
}
