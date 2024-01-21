package tryForge.member.dao;

import tryForge.vo.Member;

public interface MemberDao {

	// 로그인
	Member loginMember(Member member);
	
	// 회원가입
	int registerMember(Member member);
	
	// 아이디 중복체크 - 회원가입
	int checkId(String member_id);
	

}