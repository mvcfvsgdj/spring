package db.test.api;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class APIController {

	@Autowired
	ApiExplorer api;

	@ResponseBody
	@GetMapping(value = "/air", produces = "application/json;charset=UTF-8")
	public String airApi() throws IOException {
		String result = api.getApiTest();
		return result;
	}

	@ResponseBody
	@GetMapping(value = "/airList")
	public ArrayList<AirDTO> airAPI() throws IOException {
		String result = api.getApiTest();
		ArrayList<AirDTO> list = api.fromJSONItems(result);
		return list;
	}

	@RequestMapping(value = "/airCheck", method = RequestMethod.GET)
	public void SearchAll2(Model model) throws SQLException, IOException {
		String result = api.getApiTest();
		ArrayList<AirDTO> list = api.fromJSONItems(result);		
		model.addAttribute("list", list);

	}
}
