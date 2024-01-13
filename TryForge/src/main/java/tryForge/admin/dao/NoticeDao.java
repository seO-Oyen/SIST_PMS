package tryForge.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import tryForge.vo.Notice;
import tryForge.vo.NoticeSch;

// 공지사항 등록, 수정/삭제(로그인 섹션값), 조회/검색
public interface NoticeDao {
	// 공지사항 출력/검색
	List<Notice> noticeList(NoticeSch sch);
	
	// 총 데이터 건수
	public int totNotice(NoticeSch sch);
	
	// 상세페이지
	Notice getNotice(@Param("notice_Key") int notice_Key);
	
	// 조회수++
	@Update("update notice set notice_readcnt = notice_readcnt+1 where notice_key=#{notice_Key}")
	void readCntUptNotice(@Param("notice_Key") int notice_Key);
	
	// 공지사항 등록
	int insertNotice(Notice ins);
}
