package tryForge.vo;

public class Task {
	private int task_key;
	private int member_key;
	private String project_key;
	private String title;
	private String start;
	private String end;
	private int duration;
	private double progress;
	private int parent;
	private String type;
	private String status;
	private String rollup;
	private String hide_bar;
	public Task(int task_key, int member_key, String project_key, String title, String start, String end, int duration,
			double progress, int parent, String type, String status, String rollup, String hide_bar) {
		this.task_key = task_key;
		this.member_key = member_key;
		this.project_key = project_key;
		this.title = title;
		this.start = start;
		this.end = end;
		this.duration = duration;
		this.progress = progress;
		this.parent = parent;
		this.type = type;
		this.status = status;
		this.rollup = rollup;
		this.hide_bar = hide_bar;
	}
	public Task() {
		// TODO Auto-generated constructor stub
	}
	public int getTask_key() {
		return task_key;
	}
	public void setTask_key(int task_key) {
		this.task_key = task_key;
	}
	public int getMember_key() {
		return member_key;
	}
	public void setMember_key(int member_key) {
		this.member_key = member_key;
	}
	public String getProject_key() {
		return project_key;
	}
	public void setProject_key(String project_key) {
		this.project_key = project_key;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public double getProgress() {
		return progress;
	}
	public void setProgress(double progress) {
		this.progress = progress;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRollup() {
		return rollup;
	}
	public void setRollup(String rollup) {
		this.rollup = rollup;
	}
	public String getHide_bar() {
		return hide_bar;
	}
	public void setHide_bar(String hide_bar) {
		this.hide_bar = hide_bar;
	}
}
