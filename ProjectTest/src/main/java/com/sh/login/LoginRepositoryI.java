package com.sh.login;

import java.util.List;

public interface LoginRepositoryI {
    public boolean checklogin(LoginDTO loginDTO);
	LoginDTO selectAll(LoginDTO loginDTO);
	
	public int update(LoginDTO loginDTO);
}
