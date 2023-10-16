package com.acorn.inter;

import java.util.List;

public interface MemberServiceI {	
	
	public int  registerMember( Member member);
	public List<Member>  getMemberList();
	public int  modifyMember( Member member);
	public int  deleteMember(String userId); 
	
	
}
