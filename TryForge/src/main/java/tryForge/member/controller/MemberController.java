package tryForge.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tryForge.member.service.MemberService;
import tryForge.vo.InviteMember;
import tryForge.vo.MailSender;
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
	
	// 아이디 중복체크
	@GetMapping("idCheck.do")
	public String idCheck(
			@RequestParam("userId") String userId, Model d) {
		if (memberService.checkId(userId)) {
			System.out.println("중복");
		} else {
			System.out.println("안중복");
		}
		d.addAttribute("userIdChk", memberService.checkId(userId));
		
		return "pageJsonReport";
	}
	
	// 유저 초대 창
	@GetMapping("insertUser.do")
	public String insertUser(Model d) {
		List<InviteMember> inviteList = memberService.inviteMemberList();
		List<Member> memberList = new ArrayList<Member>();
		
		for(InviteMember invite : inviteList) {
			memberList.add(memberService.getMember(invite.getInvited_member()));
		}
		
		d.addAttribute("list", inviteList);
		d.addAttribute("mem", memberList);
		
		return "user/insertUser";
	}
	
	@PostMapping("insertUser.do")
	public String mailSend(@RequestParam("receiver") String receiver, Model d, HttpSession session) {
		MailSender mailVo = new MailSender();
		Member sendMem = (Member)session.getAttribute("loginMem");
		mailVo.setReceiver(receiver);
		mailVo.setTitle("TryForge에 초대합니다.");
		// 링크만 나중에 수정하면 될듯
		mailVo.setContent(sendMem.getMember_name() + "님이 초대하셨습니다."
				+ "\n아래링크를 눌러 가입해주세요.\n\nhttp://211.63.89.67:1111/tryForge/register.do");
		// d.addAttribute("msg", memberService.sendMail(mailVo, sendMem));
		memberService.sendMail(mailVo, sendMem);
		
		return "redirect:/insertUser.do";
	}

}