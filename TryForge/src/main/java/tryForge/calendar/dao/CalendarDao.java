package tryForge.calendar.dao;

import java.util.List;

import tryForge.vo.Calendar;

public interface CalendarDao {
	List<Calendar> getCalendar(); // 조회
	
	int insertCalendar(Calendar ins); // 추가
	
	int updateCalendar(Calendar upt); // 수정
	
	int deleteCalendar(int calendar_key); // 삭제
}
