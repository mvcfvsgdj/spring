package com.acorn.upload;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ItemForm {
	
    private Long itemId;
    private String itemName; 
    private List<MultipartFile> imageFiles; 
    
	public Long getItemId() {
		return itemId;
	}
	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public List<MultipartFile> getImageFiles() {
		return imageFiles;
	}
	public void setImageFiles(List<MultipartFile> imageFiles) {
		this.imageFiles = imageFiles;
	}
	public ItemForm(Long itemId, String itemName, List<MultipartFile> imageFiles) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.imageFiles = imageFiles;
	}
    
    @Override
	public String toString() {
		return "ItemForm [itemId=" + itemId + ", itemName=" + itemName + ", imageFiles=" + imageFiles + "]";
	}
	public ItemForm() {
		// TODO Auto-generated constructor stub
	}
}
