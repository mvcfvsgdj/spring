package com.acorn.upload;

import java.util.List;


//DTO
public class Item {

    private Long id;
    private String itemName;  
    private List<UploadFile> imageFiles;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public List<UploadFile> getImageFiles() {
		return imageFiles;
	}
	public void setImageFiles(List<UploadFile> imageFiles) {
		this.imageFiles = imageFiles;
	}
    
    public Item() {
		// TODO Auto-generated constructor stub
	}
    
}
