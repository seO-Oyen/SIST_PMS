package tryForge;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import tryForge.vo.Board;

public interface TestDao {
	@Select("select * from board")
	List<Board> boardList();
}
