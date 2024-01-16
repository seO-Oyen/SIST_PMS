package tryForge.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tryForge.admin.service.PJRequestService;



@Controller
public class PJRequestController {
	@Autowired(required = false)
	private PJRequestService service;
	
	@RequestMapping("test.do")
	public String test() {
		return "pj_request\\requestList";
	}
	
	
}