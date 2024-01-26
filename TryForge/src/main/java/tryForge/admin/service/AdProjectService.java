package tryForge.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tryForge.admin.dao.AdProjectDao;
import tryForge.vo.Member;
import tryForge.vo.Project;
import tryForge.vo.Team;
import tryForge.vo.Team_Member;

@Service
public class AdProjectService {
	@Autowired(required = false)
	private AdProjectDao dao;
	// 프로젝트 출력
	public List<Project> projList() {
		return dao.projList();
	}
	// 전체 맴버 검색 및 리스트 출력
	public List<Member> schMem(String member_name) {
		if (member_name == null)
			member_name = "";
		return dao.schMem(member_name);
	}
	// 프로젝트, 팀, 팀원 등록
	public String insertAll(Project insProject, Team insTeam, List<String> member_key) {
		String msg = "";
		int insertPJ = dao.insertPJ(insProject);
		int insertTeam = dao.insertTeam(insTeam);
		int insertTm = 0;
		// 배열로 받아온 맴버키 문자열 타입을 숫자형으로 변환
		// , 와 공백 제거 처리
		for (String memberKeys : member_key) {
			String[] keys = memberKeys.replace(" ", "").split(",");
			for (String key : keys) {
				try {
					int memkey = Integer.parseInt(key);
					insertTm = dao.insertTm(memkey);
				} catch (NumberFormatException e) {
					System.out.println("에러 1: " + e.getMessage());
				} catch (Exception e) {
					System.out.println("에러 2 : " + e.getMessage());
				}
			}
		}

		int uptCnt = dao.uptCnt();
		if (insertPJ > 0) {
			msg += "프로젝트 등록 완료 \\n";
			if (insertTeam > 0) {
				msg += "프로젝트 팀 등록 완료 \\n";
				if (insertTm > 0) {
					msg += "프로젝트 팀원 등록 완료 \\n";
					if (uptCnt > 0) {
						msg += "프로젝트 팀 인원수 등록완료 \\n";
					}
				}
			}
		}
		return msg;
	}
	// 해당 프로젝트의 상세 정보
	public Project projectInfo(String project_key) {
		return dao.projectInfo(project_key);
	}
	
	// 해당 프로젝트의 팀 정보
	public Team teamInfo(String project_key) {
		Project projectInfo = dao.projectInfo(project_key);
		return dao.teamInfo(projectInfo.getProject_key());
	}
	
	// 해당 프로젝트의 팀원 정보
	public List<Team_Member> tmInfo(String project_key,int team_key){
		Team t = dao.teamInfo(project_key);
		List<Team_Member> tmInfo = new ArrayList<>();
		team_key = t.getTeam_key();
		return dao.tmInfo(team_key);
	}
	
	// 팀원 키를 이용한 맴버 정보
	public List<Member> memberInfo(String project_key, int team_key) {
	    Team t = dao.teamInfo(project_key);
	    team_key = t.getTeam_key();
	    Member mem = new Member();
	    List<Member> mlist = new ArrayList<>();
	    List<Team_Member> tmInfo = dao.tmInfo(team_key);
	    
	    System.out.println(tmInfo.get(1)); 
	    
	    for (Team_Member tm : tmInfo) {	        
	    	System.out.println( tm.getMember_key1()); 
	    	mem = dao.memberInfo(tm.getMember_key1());
	    	mlist.add(mem);
	    }
	    return mlist;
	}
	
	// 프로젝트 키를 이용해 프로젝트, 팀, 팀원 삭제
	public String delAll(String project_key) {
		String delmsg = "";
		int delProject = dao.delProject(project_key);
		int delTeam = dao.delTeam(project_key);
		
		if(delProject>0) {
			delmsg+="프로젝트 삭제 완료";
			if(delTeam>0) {
				delmsg+="팀 삭제 완료";
			}
		}
		return delmsg;
	}
	
	// 프로젝트 완료
	public String uptFin(String project_key) {
		return dao.uptFin(project_key)>0?"완료 변경":"변경실패";
	}
}
