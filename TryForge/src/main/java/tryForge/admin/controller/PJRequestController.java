package tryForge.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import tryForge.admin.service.PJRequestService;



@Controller
public class PJRequestController {
	@Autowired(required = false)
	private PJRequestService service;
	
	
	
}