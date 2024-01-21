package tryForge.gantt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GanttController {
	@GetMapping("gantt.do")
	public String Gantt() {
		return "project/gantt";
	}
}
