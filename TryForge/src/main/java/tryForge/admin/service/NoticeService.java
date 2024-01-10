package tryForge.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tryForge.admin.dao.NoticeDao;
import tryForge.vo.Board;

@Service
public class NoticeService {
	@Autowired(required = false)
	private NoticeDao dao;
	
	public List<Board> boardList(){
		return dao.boardList();
	}
}
