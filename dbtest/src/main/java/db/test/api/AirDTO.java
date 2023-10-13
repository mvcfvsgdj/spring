package db.test.api;




public class AirDTO {
	String informCause;
	String dataTime;
	String informGrade;
	String img;
	String img2;
	String img3;
	String img4;
	String img5;
	String img6;

	public AirDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getInformCause() {
		return informCause;
	}

	public void setInformCause(String informCause) {
		this.informCause = informCause;
	}

	public String getDataTime() {
		return dataTime;
	}

	public void setDataTime(String dataTime) {
		this.dataTime = dataTime;
	}

	public String getInformGrade() {
		return informGrade;
	}

	public void setInformGrade(String informGrade) {
		this.informGrade = informGrade;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getImg4() {
		return img4;
	}

	public void setImg4(String img4) {
		this.img4 = img4;
	}

	public String getImg5() {
		return img5;
	}

	public void setImg5(String img5) {
		this.img5 = img5;
	}

	public String getImg6() {
		return img6;
	}

	public void setImg6(String img6) {
		this.img6 = img6;
	}

	public AirDTO(String informCause, String dataTime, String informGrade, String img, String img2, String img3,
			String img4, String img5, String img6) {
		super();
		this.informCause = informCause;
		this.dataTime = dataTime;
		this.informGrade = informGrade;
		this.img = img;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
		this.img5 = img5;
		this.img6 = img6;
	}

	@Override
	public String toString() {
		return "AirDTO [informCause=" + informCause + ", dataTime=" + dataTime + ", informGrade=" + informGrade
				+ ", img=" + img + ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4 + ", img5=" + img5 + ", img6="
				+ img6 + "]";
	}
	
}


