package com.sh.login;

import java.util.List;

public interface LoginServiceI {
	
    public boolean checkLogin(LoginDTO loginDTO);
	
    List<Object> selectAll(LoginDTO loginDTO);
    
    public int updateUser(LoginDTO loginDTO);
}
