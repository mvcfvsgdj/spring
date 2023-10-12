package db.test.sample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import db.test.sample.Member;

@Component
public class MemberDAO {

	@Autowired
	DataSource ds;

	public int insert(Member member) {
		int row = 0;

		String sql = "insert into member_acorn values( ?,?,?,?,?,?,?)";

		try {
			Connection con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setString(1, member.getId());
			pst.setString(2, member.getPwd());
			pst.setString(3, member.getName());
			pst.setString(4, member.getEmail());
			pst.setString(5, member.getBirth());
			pst.setString(6, member.getSns());
			pst.setTimestamp(7, new java.sql.Timestamp(member.getReg_date().getTime()));
			row = pst.executeUpdate();

			pst.close();
			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}

	public ArrayList<Member> findAll() {

		String sql = "select * from member_acorn";
		ArrayList<Member> list = new ArrayList<>();
		try {
			Connection con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				System.out.print(rs.getString(1));
				System.out.print(rs.getString(2));
				System.out.print(rs.getString(3));
				System.out.println(rs.getString(4));
				System.out.println(rs.getString(5));
				System.out.println(rs.getString(6));
				System.out.println(rs.getDate(7));
				list.add(new Member(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getDate(7)));

			}
			rs.close();
			pst.close();
			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public int updateUser(Member member) throws SQLException {
		System.out.println(member);
		int rowCnt = 0;
		String sql = " update member_acorn " + " set pwd = ?, name=?, email=?, birth =?, sns=?, reg_date=? "
				+ " where id = ? ";
		Connection con = null;
		PreparedStatement pst = null;
		System.out.println("sql =" + sql);

		try {
			con = ds.getConnection();
			System.out.println(con);
			pst = con.prepareStatement(sql);
			pst.setString(1, member.getPwd());
			pst.setString(2, member.getName());
			pst.setString(3, member.getEmail());
			pst.setString(4, member.getBirth());
			pst.setString(5, member.getSns());
			pst.setTimestamp(6, new java.sql.Timestamp(member.getReg_date().getTime()));
			pst.setString(7, member.getId());
			rowCnt = pst.executeUpdate();
			System.out.println(rowCnt);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			pst.close();
			con.close();
		}
		return rowCnt;
	}

	public int deleteOne(String id) throws SQLException {

		Connection con = ds.getConnection();
		int deletecount = 0 ; 
		String sql = "delete from member_acorn where id=?";
		PreparedStatement pst = null;

		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		pst.close();
		con.close();
		return deletecount;
		

	}

	public Member findOne(String id) {
		String sql = "SELECT * FROM member_acorn WHERE id =?";
		Member member = new Member();
		try {
			Connection con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, id);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				member = new Member(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getDate(7));
			}

			rs.close();
			pst.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return member;
	}

}
