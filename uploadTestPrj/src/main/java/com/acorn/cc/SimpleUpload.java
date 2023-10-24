package com.acorn.cc;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;

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
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SimpleUpload {	
	 private String fileDir ="c:\\test\\upload\\";  // 미리 폴더를 만들어야함	
	 
	 
	 
	 @GetMapping("/upload")
	 public String uploadForm() {
		 return "form";
	 } 
	@PostMapping("/upload")
//	public String upload( String  goodsCode   , MultipartFile file , Model model) throws IllegalStateException, IOException {
 	public String upload( Goods  goods    , MultipartFile file , Model model) throws IllegalStateException, IOException {
	    	System.out.println( goods);		 
	        if (!file.isEmpty()) {  //파일이 비어있지 않으면..
	        	String fileRealName  = file.getOriginalFilename(); 	  //원본파일이름       
	        	String fullPath = fileDir + fileRealName;
	        	file.transferTo(new File(fullPath));                     //upload 
	            model.addAttribute("fileName" ,fileRealName);          
	        }
		return "upload-ok";		
	}		
	@ResponseBody	
	@RequestMapping( value="/images/{fileName:.*}" , method=RequestMethod.GET)
	public Resource imageDownload(@PathVariable String  fileName) throws MalformedURLException {		
		System.out.println( "fileName" + fileName);
		return new  UrlResource("file:c:\\test\\upload\\"+ fileName);
		
	}

}