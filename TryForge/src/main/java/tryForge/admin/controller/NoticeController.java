package tryForge.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tryForge.admin.service.NoticeService;



@Controller
public class NoticeController {
	@Autowired(required = false)
	private NoticeService service;
	
	@RequestMapping("/index.do")
	public String boardList() {
		return "notice/noticeList";
	}
}
