package tryForge.admin.service;

import java.util.Collections;
import java.util.List;

import org.apache.ibatis.annotations.Param;
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

	public List<Project> projList() {
		return dao.projList();
	}

	public List<Member> schMem(String member_name) {
		if (member_name == null)
			member_name = "";
		return dao.schMem(member_name);
	}

	public String insertAll(Project insProject, Team insTeam, List<String> member_key) {
		String msg = "";
		int insertPJ = dao.insertPJ(insProject);
		int insertTeam = dao.insertTeam(insTeam);
		int insertTm = 0;

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
}
