package com.acorn.inter;

public class Member {
	
	String id;
	String name;
    double latitude ;   //위도 
    double longitude;   //경도
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}
	public Member(String id, String name, double latitude, double longitude) {
		super();
		this.id = id;
		this.name = name;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
 
    public Member() {
		// TODO Auto-generated constructor stub
	}

}
