package tryForge.gantt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tryForge.gantt.dao.GanttDao;
import tryForge.vo.Task;
import tryForge.vo.Task_Dependency;

@Service
public class GanttService {
	@Autowired(required = false)
	private GanttDao dao;
	
	public List<Task> getTask(){
		return dao.getTask();
	}
	
	public List<Task_Dependency> getTaskDep(){
		return dao.getTaskDep();
	}
	
	
}
