package page;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class page {

	
	@GetMapping("/pagetest")
	public String pagetest(@RequestParam(defaultValue="1")int page, Model model){
		
		PageHandler PageHandler= new PageHandler (page, 15, 5 ,3);
		model.addAttribute("pageHandler",PageHandler);
		return "pagetest";
		
	}
}
