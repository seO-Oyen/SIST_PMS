package tryForge.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import tryForge.vo.Notice;

public interface NoticeDao {
	@Select("SELECT * FROM notice WHERE notice_title LIKE '%' || #{notice_Title} || '%' AND notice_writer LIKE '%' || #{notice_Writer} || '%'")
	List<Notice> noticeList(Notice sch);
}
