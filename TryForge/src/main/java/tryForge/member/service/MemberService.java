package tryForge.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tryForge.member.dao.MemberDao;
import tryForge.vo.Member;

@Service
public class MemberService {

	@Autowired(required = false)
	private MemberDao memberDao;

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
		if (memberDao.checkId(id) > 0) {
			return false;
		} else {
			return true;
		}
	}
}