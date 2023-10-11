package com.acorn.day4.download;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.charset.StandardCharsets;

import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriUtils;

@Controller
public class Download {

	String fileDir = "c:\\test\\upload\\";
	
	@GetMapping("/download")
public String form() {
	return "form-download";
}
	@PostMapping("/upload2")
	public String upload(String title, MultipartFile file, Model model) throws IllegalStateException, IOException {
	
		if(!file.isEmpty())	{
			String fileRealName= file.getOriginalFilename();
			String fullPath = fileDir + fileRealName;
			file.transferTo(new File(fullPath));
			model.addAttribute("fileName",fileRealName);
		}
		return "upload-ok-download";
	}
	
	@RequestMapping( value="/attach/{fileName:.*}" , method=RequestMethod.GET)
	public ResponseEntity<UrlResource> fileDownload(@PathVariable String  fileName) throws MalformedURLException {		
		System.out.println( "fileName" + fileName);
		
		UrlResource  resource=  new  UrlResource("file:c:\\test\\upload\\"+ fileName);
		String encodedUploadFileName  = UriUtils.encode( fileName, StandardCharsets.UTF_8);
		String contentDispositon = "attachment; filename=\""+ encodedUploadFileName + "\"";	 
		return   ResponseEntity.ok().header( HttpHeaders.CONTENT_DISPOSITION, contentDispositon).body(resource);
		//서버의 리소스(자원)을 제공할 때 사용
	}
}
