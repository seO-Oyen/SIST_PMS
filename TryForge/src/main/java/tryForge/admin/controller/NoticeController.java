package tryForge.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import tryForge.admin.service.NoticeService;
import tryForge.vo.Notice;



@Controller
public class NoticeController {
	@Autowired(required = false)
	private NoticeService service;
	
	// 공지사항 관리페이지 검색, 조회기능
	@RequestMapping("noticeList.do")
	public String noticeList(Notice sch, Model d) {
		d.addAttribute("noticeList", service.noticeList(sch));
		return "notice/noticeList";
	}
	
	// 관리자 메인페이지 공지사항 출력
	@GetMapping("ad_main.do")
	public String ad_main(Notice sch, Model d) {
		d.addAttribute("noticeList", service.noticeList(sch));
	    return "ad_main\\ad_main";
	}
	
}