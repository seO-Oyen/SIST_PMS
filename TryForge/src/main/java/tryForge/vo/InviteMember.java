package tryForge.vo;

public class InviteMember {
	private int invate_key;
	private Member invited_member;
	private String invitee_email;
	private boolean joined;
	
	public InviteMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public InviteMember(int invate_key, Member invited_member, String invitee_email, boolean joined) {
		super();
		this.invate_key = invate_key;
		this.invited_member = invited_member;
		this.invitee_email = invitee_email;
		this.joined = joined;
	}
	
	public int getInvate_key() {
		return invate_key;
	}
	public void setInvate_key(int invate_key) {
		this.invate_key = invate_key;
	}
	public Member getInvited_member() {
		return invited_member;
	}
	public void setInvited_member(Member invited_member) {
		this.invited_member = invited_member;
	}
	public String getInvitee_email() {
		return invitee_email;
	}
	public void setInvitee_email(String invitee_email) {
		this.invitee_email = invitee_email;
	}
	public boolean isJoined() {
		return joined;
	}
	public void setJoined(boolean joined) {
		this.joined = joined;
	}
	

}
