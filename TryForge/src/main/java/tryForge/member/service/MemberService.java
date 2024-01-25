package tryForge.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tryForge.member.dao.MemberDao;
import tryForge.vo.Member;
import tryForge.vo.Project;

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
		if (id != null && memberDao.checkId(id) > 0) {
			return false;
		} else {
			return true;
		}
	}
	
	// 본인이 소속되어있는 프로젝트 출력
	public List<Project> getUserProject(Member member) {
		
		return memberDao.getUserProject(member.getMember_key());
	}
}