package tryForge.member.dao;

import java.util.List;

import tryForge.vo.InviteMember;
import tryForge.vo.Member;
import tryForge.vo.Project;

public interface MemberDao {

	// 로그인
	Member loginMember(Member member);
	
	// 회원가입
	int registerMember(Member member);
	
	// 아이디 중복체크 - 회원가입
	int checkId(String member_id);
	
	List<Project> getUserProject(int member_key);
	
	// 초대 내역 저장
	int inviteMember(Member member);
	
	// 초내 내역 출력
	List<InviteMember> getInviteMemberList();
	
	// 유저 key로 유저 찾기
	Member getMeber(int memberKey);
}