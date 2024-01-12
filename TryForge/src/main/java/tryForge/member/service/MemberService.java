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
}