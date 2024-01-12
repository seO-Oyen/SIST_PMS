package tryForge;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("index.do")
	public String indexPage() {

		return "index";
	}

	@GetMapping("userIndex.do")
	public String userIndexPage() {

		return "user/userIndex";
	}

}