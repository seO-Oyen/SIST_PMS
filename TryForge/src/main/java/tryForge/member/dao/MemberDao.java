package tryForge.member.dao;

import tryForge.vo.Member;

public interface MemberDao {

	// 로그인
	Member loginMember(Member member);

}