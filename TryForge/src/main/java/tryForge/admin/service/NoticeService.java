package tryForge.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tryForge.admin.dao.NoticeDao;
import tryForge.vo.Notice;

@Service
public class NoticeService {
	@Autowired(required = false)
	private NoticeDao dao;
	
	public List<Notice> noticeList(Notice sch){
		if(sch.getNotice_Title()==null) {
			sch.setNotice_Title("");
		}
		if(sch.getNotice_Writer()==null) {
			sch.setNotice_Writer("");
		}
		return dao.noticeList(sch);
	}
}
