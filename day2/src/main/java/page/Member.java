package page;

public class Member {

	String m_id;
	String m_pw;
	String m_name;
	String m_tel;
	String m_birthday;
	int m_point;
	String m_grade;
	public Member(String m_id, String m_pw, String m_name, String m_tel, String m_birthday, int m_point,
			String m_grade) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_tel = m_tel;
		this.m_birthday = m_birthday;
		this.m_point = m_point;
		this.m_grade = m_grade;
	}
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_tel=" + m_tel + ", m_birthday="
				+ m_birthday + ", m_point=" + m_point + ", m_grade=" + m_grade + "]";
	}


	public String getM_id() {
		return m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public String getM_tel() {
		return m_tel;
	}
	public String getM_birthday() {
		return m_birthday;
	}
	public int getM_point() {
		return m_point;
	}
	public String getM_grade() {
		return m_grade;
	}
	
	
	
	
}
