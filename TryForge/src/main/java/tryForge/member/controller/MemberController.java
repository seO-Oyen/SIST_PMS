package tryForge.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tryForge.member.service.MemberService;
import tryForge.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 로그인 창 띄우기
	@GetMapping("login.do")
	public String login(HttpSession session) {
		// 기존 session이 있다면 삭제
		if (session.getAttribute("loginMem") != null) {
			session.removeAttribute("loginMem");
			System.out.println("세션삭제");
		}

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
	
	// 회원가입 창 띄우기
	@GetMapping("register.do")
	public String registerPage() {
		
		return "user/register";
	}
	
	// 회원가입
	@PostMapping("register.do")
	public String register(Member member, Model d) {
		
		// 회원가입 성공 여부
		d.addAttribute("insertResult", memberService.registerMember(member));
		
		return "user/register";
	}
	
	@GetMapping("test.do")
	public String test01(
			@RequestParam("userId") String userId, Model d) {
		if (memberService.checkId(userId)) {
			System.out.println("중복");
		} else {
			System.out.println("안중복");
		}
		d.addAttribute("userIdChk", memberService.checkId(userId));
		return "pageJsonReport";
	}

}