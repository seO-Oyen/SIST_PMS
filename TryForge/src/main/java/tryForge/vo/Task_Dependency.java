package tryForge.vo;

public class Task_Dependency {
	private String dependency_key;
	private int source;
	private int target;
	private String type;
	public Task_Dependency() {
		// TODO Auto-generated constructor stub
	}
	public Task_Dependency(String dependency_key, int source, int target, String type) {
		this.dependency_key = dependency_key;
		this.source = source;
		this.target = target;
		this.type = type;
	}
	public String getDependency_key() {
		return dependency_key;
	}
	public void setDependency_key(String dependency_key) {
		this.dependency_key = dependency_key;
	}
	public int getSource() {
		return source;
	}
	public void setSource(int source) {
		this.source = source;
	}
	public int getTarget() {
		return target;
	}
	public void setTarget(int target) {
		this.target = target;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
