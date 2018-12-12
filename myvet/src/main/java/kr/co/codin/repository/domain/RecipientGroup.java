package kr.co.codin.repository.domain;

import java.util.Date;

public class RecipientGroup {
	private int recipientGroupId;
	private int recipientNo;
	private int recipientHosNo;
	private int recipientType;
	private Date dateRead;
	private int trash;
	
	private String memberNickname;
	private String hosTitle;
	private String memberSysName;
	private String memberFilePath;
	public int getRecipientGroupId() {
		return recipientGroupId;
	}
	public void setRecipientGroupId(int recipientGroupId) {
		this.recipientGroupId = recipientGroupId;
	}
	public int getRecipientNo() {
		return recipientNo;
	}
	public void setRecipientNo(int recipientNo) {
		this.recipientNo = recipientNo;
	}
	public int getRecipientType() {
		return recipientType;
	}
	public void setRecipientType(int recipientType) {
		this.recipientType = recipientType;
	}
	public Date getDateRead() {
		return dateRead;
	}
	public void setDateRead(Date dateRead) {
		this.dateRead = dateRead;
	}
	public int getTrash() {
		return trash;
	}
	public void setTrash(int trash) {
		this.trash = trash;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getHosTitle() {
		return hosTitle;
	}
	public void setHosTitle(String hosTitle) {
		this.hosTitle = hosTitle;
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
	public int getRecipientHosNo() {
		return recipientHosNo;
	}
	public void setRecipientHosNo(int recipientHosNo) {
		this.recipientHosNo = recipientHosNo;
	}
	@Override
	public String toString() {
		return "RecipientGroup [recipientGroupId=" + recipientGroupId + ", recipientNo=" + recipientNo
				+ ", recipientHosNo=" + recipientHosNo + ", recipientType=" + recipientType + ", dateRead=" + dateRead
				+ ", trash=" + trash + ", memberNickname=" + memberNickname + ", hosTitle=" + hosTitle
				+ ", memberSysName=" + memberSysName + ", memberFilePath=" + memberFilePath + "]";
	}
	
	
	
	
}
