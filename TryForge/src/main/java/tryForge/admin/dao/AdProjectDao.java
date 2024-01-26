package tryForge.admin.dao;
// tryForge.admin.dao.AdProjectDao
import java.util.List;

import org.apache.ibatis.annotations.Param;

import tryForge.vo.Member;
import tryForge.vo.Project;
import tryForge.vo.Team;
import tryForge.vo.Team_Member;

public interface AdProjectDao {
	List<Project> projList();
	List<Member> PJMemList(String project_key);
	List<Member> schMem(@Param("member_name")String member_name);
	int insertPJ(Project insProject);
	int insertTeam(Team insTeam);
	int insertTm(int member_key);
	int uptCnt();
	Project projectInfo(String project_key);
	Team teamInfo(String project_key);
	List<Team_Member> tmInfo(int team_key);
	Member memberInfo(int member_key);
	int delProject(String project_key);
	int delTeam(String project_key);
	int uptFin(String project_key);
}
