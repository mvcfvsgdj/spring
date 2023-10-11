package com.acorn.day4.요청정보;

import java.io.InputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class requestInfo {
	@RequestMapping("/requestInfo")
	public void main(HttpServletRequest request) throws Exception {
		
		
		//#######################################################
		// 1. request line  (요청줄) 
		String requestLine = request.getMethod();       // GET 또는 POST
		requestLine += " " + request.getRequestURI();   // /day3/test1
		
		String queryString = request.getQueryString();  //  
		requestLine += queryString == null ? "" : "?"+queryString;  
		requestLine += " " + request.getProtocol();     // HTTP/1.1
		System.out.println(requestLine);		

		
		//########################################################
		// 2. request headers  (요청헤더) 
		Enumeration<String> e = request.getHeaderNames();

		while (e.hasMoreElements()) {
			String name = e.nextElement();
			System.out.println(name + ":" + request.getHeader(name));
		}
		
		
		//##########################################################
		// 3. request body - POST일 때만 해당, GET은 body가 없음(CONTENT_LENGTH=0)  (요청바디) 
		final int CONTENT_LENGTH = request.getContentLength();
//		System.out.println("content length="+CONTENT_LENGTH);
		
		if(CONTENT_LENGTH > 0) {
			byte[] content = new byte[CONTENT_LENGTH];

			InputStream in = request.getInputStream();
			in.read(content, 0, CONTENT_LENGTH);
		 
			 
			
			System.out.println( "==> 요청바디 내용 출력");  
			System.out.println(new String(content, "utf-8"));  
		}  // if
	} // main
}