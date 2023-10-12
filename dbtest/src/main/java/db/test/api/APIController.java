package db.test.api;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
}
//"informCause"
//"dataTime"
//"informGrade"