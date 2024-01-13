package tryForge.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tryForge.admin.dao.NoticeDao;
import tryForge.vo.Notice;
import tryForge.vo.NoticeSch;

@Service
public class NoticeService {
	@Autowired(required = false)
	private NoticeDao dao;
	
	public List<Notice> noticeList(NoticeSch sch){
		if(sch.getNotice_Title()==null) {
			sch.setNotice_Title("");
		}
		if(sch.getNotice_Writer()==null) {
			sch.setNotice_Writer("");
		}
		
		sch.setCount(dao.totNotice(sch));
		if(sch.getPageSize()==0) sch.setPageSize(5);
		int totPage = (int)Math.ceil(sch.getCount()/(double)sch.getPageSize());
		sch.setPageCount(totPage);
		if(sch.getCurPage()==0) sch.setCurPage(1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		if(sch.getEnd()>sch.getCount()) {
			sch.setEnd(sch.getCount());
		}
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setBlockSize(5);
		int blockNum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		sch.setEndBlock(blockNum*sch.getBlockSize());
		sch.setStartBlock((blockNum-1)*sch.getBlockSize()+1);
		if(sch.getEndBlock()>sch.getPageCount()) {
			sch.setEndBlock(sch.getPageCount());
		}
		return dao.noticeList(sch);
	}
	
	// 상세페이지 + 조회수 증가 service
	public Notice getNotice(int notice_Key) {
		dao.readCntUptNotice(notice_Key);
		return dao.getNotice(notice_Key);
	}
}
