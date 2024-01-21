package tryForge.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tryForge.admin.service.AdProjectService;
import tryForge.vo.Member;
import tryForge.vo.Project;



@Controller
public class AdProjectController {
	@Autowired(required = false)
	private AdProjectService service;
	
	@RequestMapping("projList.do")
	public String projList(Project p , Model d) {
		d.addAttribute("plist",service.projList());
		 //List<Member> mlist = service.PJMemList(project_key);
		    //d.addAttribute("mlist", mlist);
		return "adProject\\projList";
	}
	
	@GetMapping("schMem.do")
	public String schMem(Member sch, Model d) {
		d.addAttribute("memList",service.schMem(sch));
		return "pageJsonReport";
	}
	
	// 
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