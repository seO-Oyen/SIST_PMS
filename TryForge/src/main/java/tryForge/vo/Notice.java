package tryForge.vo;

public class Notice {
	private int notice_Key;
	private String notice_Writer;
	private String notice_Title;
	private String notice_Detail;
	private String notice_Regdte;
	private String member_Key;
	private String member_Role;
	private int notice_Readcnt;
	private String project_Key;
	public Notice() {
		// TODO Auto-generated constructor stub
	}
	public Notice(int notice_Key, String notice_Writer, String notice_Title, String notice_Detail, String notice_Regdte, String member_Key,
			String member_Role, int notice_Readcnt, String project_Key) {
		this.notice_Key = notice_Key;
		this.notice_Title = notice_Title;
		this.notice_Detail = notice_Detail;
		this.notice_Regdte = notice_Regdte;
		this.member_Key = member_Key;
		this.member_Role = member_Role;
		this.notice_Readcnt = notice_Readcnt;
		this.project_Key = project_Key;
		this.notice_Writer = notice_Writer;
	}
	public int getNotice_Key() {
		return notice_Key;
	}
	public void setNotice_Key(int notice_Key) {
		this.notice_Key = notice_Key;
	}
	public String getNotice_Title() {
		return notice_Title;
	}
	public void setNotice_Title(String notice_Title) {
		this.notice_Title = notice_Title;
	}
	public String getNotice_Detail() {
		return notice_Detail;
	}
	public void setNotice_Detail(String notice_Detail) {
		this.notice_Detail = notice_Detail;
	}
	public String getNotice_Regdte() {
		return notice_Regdte;
	}
	public void setNotice_Regdte(String notice_Regdte) {
		this.notice_Regdte = notice_Regdte;
	}
	public String getMember_Key() {
		return member_Key;
	}
	public void setMember_Key(String member_Key) {
		this.member_Key = member_Key;
	}
	public String getMember_Role() {
		return member_Role;
	}
	public void setMember_Role(String member_Role) {
		this.member_Role = member_Role;
	}
	public int getNotice_Readcnt() {
		return notice_Readcnt;
	}
	public void setNotice_Readcnt(int notice_Readcnt) {
		this.notice_Readcnt = notice_Readcnt;
	}
	public String getProject_Key() {
		return project_Key;
	}
	public void setProject_Key(String project_Key) {
		this.project_Key = project_Key;
	}
	public String getNotice_Writer() {
		return notice_Writer;
	}
	public void setNotice_Writer(String notice_Writer) {
		this.notice_Writer = notice_Writer;
	}
	
}