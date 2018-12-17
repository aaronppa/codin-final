package kr.co.codin.repository.domain;

import java.util.Date;

public class RecipientGroup {
	private int recipientGroupId;
	private int recipientNo;
	private int recipientHosNo;
	private int recipientType;
	private Date dateRead;
	private int trash;
	
	private String recipientNickname;
	private String hosTitle;
	private String recipientSysName;
	private String recipientFilePath;
	
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
	
	public String getHosTitle() {
		return hosTitle;
	}
	public void setHosTitle(String hosTitle) {
		this.hosTitle = hosTitle;
	}
	public int getRecipientHosNo() {
		return recipientHosNo;
	}
	public void setRecipientHosNo(int recipientHosNo) {
		this.recipientHosNo = recipientHosNo;
	}
	public String getRecipientNickname() {
		return recipientNickname;
	}
	public void setRecipientNickname(String recipientNickname) {
		this.recipientNickname = recipientNickname;
	}
	public String getRecipientSysName() {
		return recipientSysName;
	}
	public void setRecipientSysName(String recipientSysName) {
		this.recipientSysName = recipientSysName;
	}
	public String getRecipientFilePath() {
		return recipientFilePath;
	}
	public void setRecipientFilePath(String recipientFilePath) {
		this.recipientFilePath = recipientFilePath;
	}
	@Override
	public String toString() {
		return "RecipientGroup [recipientGroupId=" + recipientGroupId + ", recipientNo=" + recipientNo
				+ ", recipientHosNo=" + recipientHosNo + ", recipientType=" + recipientType + ", dateRead=" + dateRead
				+ ", trash=" + trash + ", recipientNickname=" + recipientNickname + ", hosTitle=" + hosTitle
				+ ", recipientSysName=" + recipientSysName + ", recipientFilePath=" + recipientFilePath + "]";
	}
	
	
	
	
}
