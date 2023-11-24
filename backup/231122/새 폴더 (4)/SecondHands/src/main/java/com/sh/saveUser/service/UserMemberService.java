package com.sh.saveUser.service;

import com.sh.saveUser.domain.UserDTO;

public interface UserMemberService {

	public int registerMember(UserDTO userDTO);

	public boolean isUserIdExists(String user_id);
}
