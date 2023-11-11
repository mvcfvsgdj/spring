package com.sh.saveUser.repository;

import com.sh.saveUser.domain.UserDTO;

public interface UserMemberRepositoryI {

	public int insert(UserDTO userDTO);

	public boolean getUserById(String user_id);
}