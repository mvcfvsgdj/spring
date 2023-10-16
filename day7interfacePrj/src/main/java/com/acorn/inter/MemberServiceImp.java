package com.acorn.inter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImp  implements MemberServiceI{
	
	@Autowired
	MemberRepositoryI dao;

	@Override
	public int registerMember(Member member) {
		// TODO Auto-generated method stub
		return dao.insert(member);
	}

	@Override
	public List<Member> getMemberList() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public int modifyMember(Member member) {
		// TODO Auto-generated method stub
		return  dao.update(member);
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return dao.delete(userId);
	}

}
