package tryForge.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import tryForge.vo.Board;

public interface NoticeDao {
	@Select("select * from board")
	List<Board> boardList();
}
