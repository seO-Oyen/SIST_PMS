package tryForge.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CalendarController {
	@GetMapping("calendar.do")
	public String calendar() {
		return "project/calendar";
	}
}
