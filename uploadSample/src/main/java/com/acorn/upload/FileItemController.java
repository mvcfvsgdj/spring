package com.acorn.upload;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FileItemController {

	@Autowired
	 ItemRepository dao;
	
	@Autowired
	FileStore store;
	
	@GetMapping("/uploadMulti")
	public String upload() {
		return  "item-form"; 
	}
		

	@PostMapping("/uploadMulti")
	public String upload2(ItemForm form, Model model)  throws IOException   {
		System.out.println( form );		
	        List<UploadFile> storeImageFiles = store.storeFiles(form.getImageFiles());	        
		    Item item = new Item();
		    item.setId( form.getItemId());
	        item.setItemName(form.getItemName());	     
	        item.setImageFiles(storeImageFiles);	       
	        dao.save(item); 	        
	        List<String> fileNames = getFileNames(storeImageFiles);	       
	        model.addAttribute("fileNames" ,fileNames); 	        
		return  "upload-ok";				
	}



	private List<String> getFileNames(List<UploadFile> storeImageFiles) {
		List<String> fileNames = new ArrayList<String>();
		for( UploadFile uploadFile : storeImageFiles) {
			 fileNames.add( uploadFile.getStoreFileName());
		}
		return fileNames;
	}
	
	
	
	@ResponseBody	
	@RequestMapping( value="/images/{fileName:.*}" , method=RequestMethod.GET)
	public Resource imageDownload(@PathVariable String  fileName) throws MalformedURLException {		
		System.out.println( "fileName" + fileName);
		return new  UrlResource("file:c:\\test\\upload\\"+ fileName);
		
	}
	
}
