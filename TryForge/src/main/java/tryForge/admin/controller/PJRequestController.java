package tryForge.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tryForge.admin.service.PJRequestService;
import tryForge.vo.Member;
import tryForge.vo.Project;



@Controller
public class PJRequestController {
	@Autowired(required = false)
	private PJRequestService service;
	
	@RequestMapping("reqPJList.do")
	public String reqPJList(Project p , Model d) {
		d.addAttribute("plist",service.ReqPJList());
		 //List<Member> mlist = service.PJMemList(project_key);
		    //d.addAttribute("mlist", mlist);
		return "pj_request\\requestList";
	}
	
//	@GetMapping("reqPJ.do")
//	public String reqPJFrm() {
//		return"pj_request\\requestList";
//	}
//	
//	@PostMapping("reqPJ.do")
//	public String reqPJ(){
//		return "";
//	}
	
}