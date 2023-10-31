package com.sh.saveUser;

public interface UserMemberRepositoryI {

	public int insert(UserDTO userDTO);

	public boolean getUserById(String user_id);
}