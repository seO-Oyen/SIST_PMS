package tryForge;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import tryForge.admin.service.NoticeService;
import tryForge.member.service.MemberService;
import tryForge.admin.service.AdProjectService;
import tryForge.vo.Member;
import tryForge.vo.NoticeSch;
import tryForge.vo.Project;

@Controller
public class MainController {
	@Autowired(required = false)
	private NoticeService noticeService; 
	@Autowired(required = false)
	private AdProjectService PJRequestService;
	@Autowired(required = false)
	private MemberService memberService;

	@GetMapping("index.do")
	public String indexPage() {

		return "index";
	}

	@GetMapping("userIndex.do")
	public String userIndexPage(HttpSession session, Model d) {
		if (session.getAttribute("loginMem") != null ) {
			Member member = (Member)session.getAttribute("loginMem");
			List<Project> projectList = memberService.getUserProject(member);
			
			d.addAttribute("plist", projectList);
		}
		

		return "user/userIndex";
	}
	
	//메인페이지 출력
	@GetMapping("adMain.do")
	public String ad_main(NoticeSch sch, Model d) {
		d.addAttribute("noticeList", noticeService.noticeList(sch));
		d.addAttribute("plist", PJRequestService.ReqPJList());
		
	    return "ad_main\\ad_main";
	}
	
	//마이페이지 출력
	@GetMapping("myPage.do")
	public String myPage(Model d) {
		
	    return "user/myPage";
	}

}