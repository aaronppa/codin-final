package kr.co.codin.repository.domain;

public class TestMember {
	int memberNo;
	String memberEmail;
	String memberNickname;
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	@Override
	public String toString() {
		return "TestMember [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberNickname="
				+ memberNickname + "]";
	}
}
