package tryForge.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import tryForge.member.service.MemberService;
import tryForge.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 창 띄우기
	@GetMapping("login.do")
	public String login() {
		
		return "user/login";
	}
	
	// 로그인 기능
	@PostMapping("login.do")
	public String memberLogin(Member member, HttpSession session) {
		Member loginMember = memberService.loginMember(member);
		
		// 로그인 여부
		if (loginMember != null) {
			session.setAttribute("loginMem", loginMember);
		}
		
		return "user/login";
		
	}

}
