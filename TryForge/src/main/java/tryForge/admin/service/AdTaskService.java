package tryForge.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tryForge.admin.dao.AdTaskDao;
import tryForge.vo.MemberSch;

@Service
public class AdTaskService {
	@Autowired(required = false)
	private AdTaskDao dao;
	// 구성원 검색(for 업무할당)
	public List<MemberSch> schTaskMem(MemberSch sch){
		if(sch.getTitle()==null) sch.setTitle("");
		if(sch.getMember_name()==null) sch.setMember_name("");
		return dao.schTaskMem(sch);
	}
	// 프로젝트 별로 select 로 구분
	public List<String> getTitle(){
		return dao.getTitle();
	}
}
