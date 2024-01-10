package tryForge.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tryForge.admin.service.NoticeService;
import tryForge.vo.Notice;



@Controller
public class NoticeController {
	@Autowired(required = false)
	private NoticeService service;
	
	@RequestMapping("noticeList.do")
	public String noticeList(Notice sch, Model d) {
		d.addAttribute("noticeList", service.noticeList(sch));
		return "notice/noticeList";
	}
}
