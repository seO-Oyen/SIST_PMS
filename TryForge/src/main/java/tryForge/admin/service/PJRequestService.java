package tryForge.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tryForge.admin.dao.PJRequestDao;
import tryForge.vo.Member;
import tryForge.vo.Project;

@Service
public class PJRequestService {
	@Autowired(required = false)
	private PJRequestDao dao;
	
	public List<Project> ReqPJList(){
		return dao.ReqPJList();
	}
	
	public List<Member> PJMemList(String project_key){
		List<Member> mlist = dao.PJMemList(project_key);
		return mlist;
	}
	
	
}
