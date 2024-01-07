package tryForge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tryForge.vo.Board;

@Service
public class TestService {
	@Autowired(required = false)
	private TestDao dao;
	
	public List<Board> boardList(){
		return dao.boardList();
	}
}
