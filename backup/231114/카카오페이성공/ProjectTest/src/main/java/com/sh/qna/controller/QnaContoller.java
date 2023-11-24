package com.sh.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.login.domain.LoginDTO;
import com.sh.qna.domain.QnaDTO;
import com.sh.qna.domain.QnaHandler;
import com.sh.qna.repository.QnaRepositoryI;


@Controller
@RequestMapping(value="/qna")
public class QnaContoller {

	@Autowired
    QnaRepositoryI rep;

	
	@GetMapping() 
	public String board( HttpServletRequest request,@RequestParam(value = "p",required=false) String p ,Model model) {

		int currentPage;
		if(p != null) {
			currentPage = Integer.parseInt(p);
		}else {
			currentPage = 1;
		}
		
		int  totRecords = rep.getTotalCount();
		int pageSize = 4;
		int grpSize = 3;
		
		HttpSession session = request.getSession();
		QnaHandler handler = new QnaHandler(currentPage, totRecords, pageSize, grpSize);
		List<QnaDTO> list = rep.getListPage(currentPage, pageSize);
		LoginDTO user = (LoginDTO) session.getAttribute("user");

		if(user != null) {
			String userid = user.getUser_id();
			model.addAttribute("userid",userid);
		}else {
			String userid = null;
			model.addAttribute("userid",userid);
		}

		model.addAttribute("list",list);	
		model.addAttribute("handler", handler);

		
		
		return "/qna/qna";
	}

	@PostMapping()
	public String qnaView(@RequestParam("code") String code, HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    
	    QnaDTO userImp = rep.getListOne(code);
	    if (userImp != null) {
	        LoginDTO user = (LoginDTO) session.getAttribute("user");
	        if (user != null) {
	            model.addAttribute("userImp", userImp);
	            model.addAttribute("userid", user.getUser_id());
	            return "/qna/qnaview";
	        } else {
	        	int message = 1;
	        	model.addAttribute("message",message);
	            return "redirect:/qna";
	        }
	    } else {
	        return "redirect:/qna";
	    }
	}
	
	@GetMapping(value="/reg")
	public String qnaRegPage(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();

		List<Object> selectedUserList = (List<Object>) session.getAttribute("selectedUser");
		
		if (selectedUserList != null) {
	       
	        LoginDTO selectedUser  = (LoginDTO) selectedUserList.get(0);
	        String id = selectedUser.getUser_id();
	        String writer = selectedUser.getUser_nickname();

	        model.addAttribute("id", id);
	        model.addAttribute("writer", writer);

	        return "/qna/qnareg";
	    }else {
	    	int message = 1;
        	model.addAttribute("message",message);
	    	return "redirect:/qna";
	    }

		
	}
	@PostMapping(value="/reg")
	public String qnaReg(@RequestParam("id") String id,@RequestParam("title") String title,@RequestParam("contents") String contents,
			@RequestParam("check") String check ,@RequestParam("writer") String writer,Model model) {
		
		QnaDTO dto = new QnaDTO(id,title,contents,check,writer);
		rep.insertQna(dto);
		
		return "redirect:/qna";
	}
	@GetMapping(value="/qup")
	public String qnaupdatePage(@RequestParam("code") String code,Model model) {

		System.out.println("받은 코드값=" + code);
		
		QnaDTO userImp = (QnaDTO) rep.getListOne(code);
		model.addAttribute("user",userImp);

		
		return "/qna/qnaupdate";
	}
	@PostMapping(value="/qup")
	public String qnaupdate(@RequestParam("code") String code,@RequestParam("title") String title,@RequestParam("contents") String contents,
			@RequestParam("check") String check ,Model model) {
		
		System.out.println("받은 코드값=" + code);
		
		QnaDTO dto = new QnaDTO(code,title,contents,check);
		
		rep.updateQna(dto);
		
		return "redirect:/qna";
	}
	@PostMapping(value="/qdel")
	public String qnadelete(@RequestParam("code") String code ,Model model) {
		
		System.out.println("받은 코드값=" + code);
		
		rep.deleteQna(code);

		return "redirect:/qna";
	}

}
