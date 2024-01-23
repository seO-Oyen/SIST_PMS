package tryForge.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tryForge.admin.service.AdProjectService;
import tryForge.vo.Project;
import tryForge.vo.Team;



@Controller
public class AdProjectController {
	@Autowired(required = false)
	private AdProjectService service;
	
	// 프로젝트 출력(진행중/완료 상태 view단에서 변경예정)
	@RequestMapping("projList.do")
	public String projList(Project p , Model d) {
		d.addAttribute("plist",service.projList());
		 //List<Member> mlist = service.PJMemList(project_key);
		    //d.addAttribute("mlist", mlist);
		return "adProject\\projList";
	}
	
	// ajax 전체 사원리스트 출력 및 검색
	@RequestMapping("schMem.do")
	public String schMem(@RequestParam(value="member_name", defaultValue = "")String member_name, Model d) {
	    d.addAttribute("memList", service.schMem(member_name));
	    return "pageJsonReport";
	}
	
	// 프로젝트 생성, 팀 생성, 팀원 등록, 팀 구성원수 변경 
	@RequestMapping("insertAll.do")
	public String insertAll(Project insProject, Team insTeam, @RequestParam("member_key") List<String> member_key, Model d) {
		d.addAttribute("insertAll",service.insertAll(insProject, insTeam, member_key));
		d.addAttribute("plist",service.projList());
		return "pageJsonReport";
	}
	
	
}