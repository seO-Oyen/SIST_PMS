package tryForge.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tryForge.admin.service.AdProjectService;
import tryForge.vo.Member;
import tryForge.vo.Project;
import tryForge.vo.Team;
import tryForge.vo.Team_Member;



@Controller
public class AdProjectController {
	@Autowired(required = false)
	private AdProjectService service;
	
	// 프로젝트 출력(진행중/완료 상태 view단에서 변경예정)
	@RequestMapping("projList.do")
	public String projList(Project p , Model d) {
		d.addAttribute("plist",service.projList());
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
	
	// 등록 프로젝트 상세정보 출력
	@RequestMapping("detail.do")
	public String detail(Project p, Team t, Team_Member tm, Member m, @RequestParam("project_key")String project_key, Model d ) {
		d.addAttribute("projectInfo",service.projectInfo(project_key));
		d.addAttribute("teamInfo",service.teamInfo(p.getProject_key()));
		d.addAttribute("tmInfo",service.tmInfo(p.getProject_key(), t.getTeam_key()));
		d.addAttribute("memberInfo",service.memberInfo(p.getProject_key(),t.getTeam_key()));
		return "pageJsonReport";
	}
	
	// 프로젝트, 팀, 팀원 삭제
	@RequestMapping("delAll.do")
	public String delAll(@RequestParam("project_key")String project_key, Model d) {
		d.addAttribute("delmsg",service.delAll(project_key));
		return "pageJsonReport"; 
	}
	
	// 완료상태 변경
	@RequestMapping("uptFin.do")
	public String uptFin(@RequestParam("project_key")String project_key, Model d) {
		d.addAttribute("uptmsg",service.uptFin(project_key));
		return "pageJsonReport"; 
	}
	
	
}