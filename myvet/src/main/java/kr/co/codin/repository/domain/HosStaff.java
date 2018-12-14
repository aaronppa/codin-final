package kr.co.codin.repository.domain;

import java.util.Date;

public class HosStaff {
	private int staffNo;
	private int hosCode;
	private int staffMemberNo;
	private Date staffRegDate;
	private String staffTitle;
	private char hosAdmin;
	private char confirm;
	private Member member;
	
	public int getStaffNo() {
		return staffNo;
	}
	public void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
	}
	public int getHosCode() {
		return hosCode;
	}
	public void setHosCode(int hosCode) {
		this.hosCode = hosCode;
	}
	public int getStaffMemberNo() {
		return staffMemberNo;
	}
	public void setStaffMemberNo(int staffMemberNo) {
		this.staffMemberNo = staffMemberNo;
	}
	public Date getStaffRegDate() {
		return staffRegDate;
	}
	public void setStaffRegDate(Date staffRegDate) {
		this.staffRegDate = staffRegDate;
	}
	public String getStaffTitle() {
		return staffTitle;
	}
	public void setStaffTitle(String staffTitle) {
		this.staffTitle = staffTitle;
	}
	public char getHosAdmin() {
		return hosAdmin;
	}
	public void setHosAdmin(char hosAdmin) {
		this.hosAdmin = hosAdmin;
	}
	public char getConfirm() {
		return confirm;
	}
	public void setConfirm(char confirm) {
		this.confirm = confirm;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	@Override
	public String toString() {
		return "HosStaff [staffNo=" + staffNo + ", hosCode=" + hosCode + ", staffMemberNo=" + staffMemberNo
				+ ", staffRegDate=" + staffRegDate + ", staffTitle=" + staffTitle + ", hosAdmin=" + hosAdmin
				+ ", confirm=" + confirm + ", member=" + member + "]";
	}
}
