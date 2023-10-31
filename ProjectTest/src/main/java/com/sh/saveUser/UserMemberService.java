package com.sh.saveUser;

import java.util.List;

public interface UserMemberService {

	public int registerMember(UserDTO userDTO);

	public boolean isUserIdExists(String user_id);
}
