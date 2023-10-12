package db.test.sample;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import db.test.sample.Member;
import db.test.sample.MemberDAO;

@Component
public class MemberService {

	@Autowired
	MemberDAO dao;

	public ArrayList<Member> getMembers() {
		return dao.findAll();
	}

	public Member getMember(String id) {
		return dao.findOne(id);
	}

	public int chageInfoMember(Member member) throws SQLException {
		return dao.updateUser(member);
	}

	public int registerMember(Member member) {
		return dao.insert(member);
	}

	public int deleteMember(String id) throws SQLException {

		return dao.deleteOne(id);
	}

}
