package tryForge.gantt.dao;

import java.util.List;

import tryForge.vo.Task;
import tryForge.vo.Task_Dependency;

public interface GanttDao {
	List<Task> getTask();
	
	List<Task_Dependency> getTaskDep();
}
