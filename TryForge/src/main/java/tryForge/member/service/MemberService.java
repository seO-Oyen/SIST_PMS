package tryForge.member.service;

import javax.mail.MessagingException;

import java.util.List;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import tryForge.member.dao.MemberDao;
import tryForge.vo.InviteMember;
import tryForge.vo.MailSender;
import tryForge.vo.Member;

@Service
public class MemberService {

	@Autowired(required = false)
	private MemberDao memberDao;
	@Autowired(required = false)
	private JavaMailSender sender;

	// 로그인
	public Member loginMember(Member member) {
		return memberDao.loginMember(member);
	}
	
	// 회원가입
	public boolean registerMember(Member member) {
		int result = memberDao.registerMember(member);
		
		if (result > 0) {
			return true;
		} else {
			return false;
		}
		
	}
	
	// 아이디 중복 체크
	public boolean checkId(String id) {
		if (id != null && memberDao.checkId(id) > 0) {
			return false;
		} else {
			return true;
		}
	}
	
	// 초대 목록 
	public List<InviteMember> inviteMemberList() {
		
		return null;
	}
	
	// 메일 발송
	public String sendMail(MailSender email, Member sendMem) {
		String msg = "";
		
		MimeMessage mmsg = sender.createMimeMessage();
		
		try {
			mmsg.setSubject(email.getTitle());
			mmsg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));
			mmsg.setText(email.getContent());

			memberDao.inviteMember(new Member(sendMem.getMember_key(), email.getReceiver()));
			sender.send(mmsg);
			msg = "메일 발송 성공";
		} catch (MessagingException e) {
			System.out.println("메시지 전송에러 발송 : " + e.getMessage());
			msg = "메일 발송 에러 발생 : " + e.getMessage();
		} catch (Exception e) {
			System.out.println("기타 에러 : " + e.getMessage());
			msg = "기타 에러 발생 : " + e.getMessage();
		}
		
		return msg;
	}
}