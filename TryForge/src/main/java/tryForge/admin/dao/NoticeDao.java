package tryForge.admin.dao;

import java.util.List;

import tryForge.vo.Notice;
import tryForge.vo.NoticeSch;

// 공지사항 등록, 수정/삭제(로그인 섹션값), 조회/검색
public interface NoticeDao {
	// 공지사항 출력/검색
	List<Notice> noticeList(NoticeSch sch);
	
	// 총 데이터 건수
	public int totNotice(NoticeSch sch);
}
