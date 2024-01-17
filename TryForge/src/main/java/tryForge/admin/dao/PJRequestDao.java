package tryForge.admin.dao;

import java.util.List;

import tryForge.vo.Member;
import tryForge.vo.Project;

public interface PJRequestDao {
	List<Project> ReqPJList();
	List<Member> PJMemList(String project_key);
}
