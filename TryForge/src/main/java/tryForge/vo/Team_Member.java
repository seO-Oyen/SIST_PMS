package tryForge.vo;

public class Team_Member {
	private int team_Member_key;
	private String role; 
	private Member member;
	private Team team;
	public Team_Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Team_Member(int team_Member_key, String role) {
		this.team_Member_key = team_Member_key;
		this.role = role;
	}

	public Team_Member(int team_Member_key, String role, Member member, Team team) {
		this.team_Member_key = team_Member_key;
		this.role = role;
		this.member = member;
		this.team = team;
	}
	public int getTeam_Member_key() {
		return team_Member_key;
	}
	public void setTeam_Member_key(int team_Member_key) {
		this.team_Member_key = team_Member_key;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Team getTeam() {
		return team;
	}
	public void setTeam(Team team) {
		this.team = team;
	}
	
}
