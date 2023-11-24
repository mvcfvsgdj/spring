package com.sh.login.service;

import java.util.List;

import com.sh.login.domain.LoginDTO;

public interface LoginServiceI {

	public boolean checkLogin(LoginDTO loginDTO);

	List<Object> selectAll(LoginDTO loginDTO);

	public int updateUser(LoginDTO loginDTO);
	
	public int updateUserImg(LoginDTO loginDTO);
	
	public int deleteUser(LoginDTO loginDTO);

	public String selectHeat(String sell_code);

	public String selectHeatU(String sell_code);

	int updateHeat(String user_heat, String user_code);

	void saveHeat(String user_code, String user_heat);
	
	 List<Object> getHeatByUserCode(String user_code);

}
