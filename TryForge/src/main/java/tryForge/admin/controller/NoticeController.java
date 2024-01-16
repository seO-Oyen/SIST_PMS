package tryForge.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tryForge.admin.service.NoticeService;
import tryForge.vo.Notice;
import tryForge.vo.NoticeSch;



@Controller
public class NoticeController {
	@Autowired(required = false)
	private NoticeService service;
	
	// 공지사항 관리페이지 검색, 조회기능
	@RequestMapping("noticeList.do")
	public String noticeList(NoticeSch sch, Model d) {
		d.addAttribute("noticeList", service.noticeList(sch));
		return "notice/noticeList";
	}
	
	// 관리자 메인페이지 공지사항 출력
	@GetMapping("ad_main.do")
	public String ad_main(NoticeSch sch, Model d) {
		d.addAttribute("noticeList", service.noticeList(sch));
	    return "ad_main\\ad_main";
	}
	
	// 공지사항 상세페이지
	@RequestMapping("getNotice.do")
	public String getNotice(@RequestParam("notice_Key")int notice_Key, Model d) {
		d.addAttribute("notice",service.getNotice(notice_Key));
		return "notice/noticeDetail";
	}
	
	// 공지사항 등록
	@GetMapping("insertNotice.do")
	public String insertNoticeFrm(Notice ins, Model d) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        String formattedDate = sdf.format(new Date());
		d.addAttribute("formattedDate",formattedDate);
		return "notice/insertNotice";
	}
	@PostMapping("insertNotice.do")
	public String insertNotice(Notice ins,Model d) {
		
		d.addAttribute("msg",service.insertNotice(ins));
		return "notice/insertNotice";
	}
	
	// 공지사항 수정
	@GetMapping("updateNoticeFrm.do")
	public String updateNoticeFrm(@RequestParam("notice_Key")int notice_Key, Model d) {
		 d.addAttribute("notice", service.getNotice(notice_Key));
		return "notice/updateNotice";
	}
	
	@PostMapping("updateNotice.do")
	public String updateNotice(Notice upt, Model d) {
	    System.out.println("updateNotice 메서드 호출은 되나????");
	    String msg = "";
	        int uptNo = service.updateNotice(upt);
	        if (uptNo > 0) {
	            msg = "공지사항 수정이 완료되었습니다.";
	        } else {
	            msg = "공지사항 수정이 실패하였습니다.\n 다시 시도해주세요.";
	        }
	        d.addAttribute("msg", msg);
	        System.out.println("msg?" + msg);
	        d.addAttribute("proc", "upt");
	        System.out.println("proc?");
	        
	        int noticeKey = upt.getNotice_Key();
	        System.out.println("공지사항 키 값설정?? " + noticeKey);
	        d.addAttribute("notice", service.getNotice(upt.getNotice_Key()));
	   
	    
	    return "notice/updateNotice";
	}
	
	// 공지사항 삭제
	@RequestMapping("deleteNotice.do")
	public String deleteNotice(@RequestParam("notice_Key") int notice_Key, Model d) {
		d.addAttribute("proc","upt");
		d.addAttribute("msg",service.deleteNotice(notice_Key));
		return "notice/noticeDetail";
	}
	
}