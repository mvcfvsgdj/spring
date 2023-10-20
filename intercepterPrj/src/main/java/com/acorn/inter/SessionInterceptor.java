package com.acorn.inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginID");
		
		//로그인 x
		if(id ==null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
		}
		
		return true;
	}
}
