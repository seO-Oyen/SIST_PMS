package tryForge.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import tryForge.member.vo.Member;

@Controller
public class MemberController {
	
	// 로그인 창 띄우기
	@GetMapping("login.do")
	public String login() {
		
		return "user/login";
	}
	
	// 로그인 기능
	@PostMapping("login.do")
	public String memberLogin(Member member, HttpSession session) {
		
		
		return "";
	}

}
