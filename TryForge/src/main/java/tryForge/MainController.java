package tryForge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import tryForge.admin.service.NoticeService;
import tryForge.admin.service.PJRequestService;
import tryForge.vo.NoticeSch;

@Controller
public class MainController {
	@Autowired(required = false)
	private NoticeService noticeService; 
	@Autowired(required = false)
	private PJRequestService PJRequestService;

	@GetMapping("index.do")
	public String indexPage() {

		return "index";
	}

	@GetMapping("userIndex.do")
	public String userIndexPage() {

		return "user/userIndex";
	}
	
	//메인페이지 출력
	@GetMapping("adMain.do")
	public String ad_main(NoticeSch sch, Model d) {
		d.addAttribute("noticeList", noticeService.noticeList(sch));
		d.addAttribute("plist", PJRequestService.ReqPJList());
		
	    return "ad_main\\ad_main";
	}

}