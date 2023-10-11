package com.acorn.day2.api;

import java.sql.Date;

import lombok.Data;

@Data
public class CarrotDTO {

	String id;
	int price;
	String info;
	Date newTime;

	public CarrotDTO(String id, int price, String info, Date newTime) {
		super();
		this.id = id;
		this.price = price;
		this.info = info;
		this.newTime = newTime;
	}

	public CarrotDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Date getNewTime() {
		return newTime;
	}

	public void setNewTime(Date newTime) {
		this.newTime = newTime;
	}

	@Override
	public String toString() {
		return "CarrotDTO [id=" + id + ", number=" + price + ", info=" + info + ", newTime=" + newTime + "]";
	}

}
