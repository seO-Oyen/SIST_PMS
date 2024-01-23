package tryForge.vo;

import java.util.ArrayList;
import java.util.List;

public class Team_Member {
	private int team_Member_key;
	private String role; 
	private List<Member> member;
	private List<Integer> member_key;
	private Team team;
	public Team_Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Team_Member(int team_Member_key, String role) {
		this.team_Member_key = team_Member_key;
		this.role = role;
	}

	

	public Team_Member(int team_Member_key, String role, List<Member> member, List<Integer> member_key, Team team) {
		this.team_Member_key = team_Member_key;
		this.role = role;
		this.member = member;
		this.member_key = member_key;
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

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	public List<Member> getMember() {
		return member;
	}

	public void setMember(List<Member> member) {
		this.member = member;
	}

	public List<Integer> getMember_key() {
		return member_key;
	}

	public void setMember_key(List<Integer> member_key) {
		this.member_key = member_key;
	}
	
	
	
	
}
