package tryForge.vo;

public class Task {
	private int id;
	private int member_key;
	private String project_key;
	private String text;
	private String start_date;
	private String end_date;
	private int duration;
	private double progress;
	private int parent;
	private String type;
	private String status;
	private String rollup;
	private String hide_bar;
	public Task() {
		// TODO Auto-generated constructor stub
	}
	public Task(int id, int member_key, String project_key, String text, String start_date, String end_date,
			int duration, double progress, int parent, String type, String status, String rollup, String hide_bar) {
		this.id = id;
		this.member_key = member_key;
		this.project_key = project_key;
		this.text = text;
		this.start_date = start_date;
		this.end_date = end_date;
		this.duration = duration;
		this.progress = progress;
		this.parent = parent;
		this.type = type;
		this.status = status;
		this.rollup = rollup;
		this.hide_bar = hide_bar;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
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