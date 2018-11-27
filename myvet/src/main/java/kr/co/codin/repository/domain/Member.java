package kr.co.codin.repository.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Member {
	private int memberNo;
	private String memberEmail;
	private String password;
	private String memberGrade;
	private String memberName;
	private String memberPhone;
	private String memberNickname;
	private int hosCode;
	private String memberCareer;
	private String mailingOpt;
	private String memberOriName;
	private String memberSysName;
	private String memberFilePath;
	private int memberFileSize;	
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date memberFileRegDate;
	
	List<VetAuth> vetAuth;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public int getHosCode() {
		return hosCode;
	}

	public void setHosCode(int hosCode) {
		this.hosCode = hosCode;
	}

	public String getMemberCareer() {
		return memberCareer;
	}

	public void setMemberCareer(String memberCareer) {
		this.memberCareer = memberCareer;
	}

	public String getMailingOpt() {
		return mailingOpt;
	}

	public void setMailingOpt(String mailingOpt) {
		this.mailingOpt = mailingOpt;
	}

	public String getMemberOriName() {
		return memberOriName;
	}

	public void setMemberOriName(String memberOriName) {
		this.memberOriName = memberOriName;
	}

	public String getMemberSysName() {
		return memberSysName;
	}

	public void setMemberSysName(String memberSysName) {
		this.memberSysName = memberSysName;
	}

	public String getMemberFilePath() {
		return memberFilePath;
	}

	public void setMemberFilePath(String memberFilePath) {
		this.memberFilePath = memberFilePath;
	}

	public int getMemberFileSize() {
		return memberFileSize;
	}

	public void setMemberFileSize(int memberFileSize) {
		this.memberFileSize = memberFileSize;
	}

	public Date getMemberFileRegDate() {
		return memberFileRegDate;
	}

	public void setMemberFileRegDate(Date memberFileRegDate) {
		this.memberFileRegDate = memberFileRegDate;
	}

	public List<VetAuth> getVetAuth() {
		return vetAuth;
	}

	public void setVetAuth(List<VetAuth> vetAuth) {
		this.vetAuth = vetAuth;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", password=" + password
				+ ", memberGrade=" + memberGrade + ", memberName=" + memberName + ", memberPhone=" + memberPhone
				+ ", memberNickname=" + memberNickname + ", hosCode=" + hosCode + ", memberCareer=" + memberCareer
				+ ", mailingOpt=" + mailingOpt + ", memberOriName=" + memberOriName + ", memberSysName=" + memberSysName
				+ ", memberFilePath=" + memberFilePath + ", memberFileSize=" + memberFileSize + ", memberFileRegDate="
				+ memberFileRegDate + ", vetAuth=" + vetAuth + "]";
	}
	
	
}
