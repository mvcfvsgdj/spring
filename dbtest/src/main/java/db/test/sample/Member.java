package db.test.sample;

import java.util.Date;

public class Member {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String birth;
	private String sns;
	private Date reg_date;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Member(String id, String pwd, String name, String email, String birth, String sns, Date reg_date) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.sns = sns;
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", birth=" + birth
				+ ", sns=" + sns + ", reg_date=" + reg_date + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getSns() {
		return sns;
	}
	public void setSns(String sns) {
		this.sns = sns;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	

//setter, getter 작성
// toString 작성
}
