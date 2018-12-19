package kr.co.codin.repository.domain;

import java.util.Date;

public class RecipientGroup {
	private int msgId;
	private int recipientGroupId;
	private int recipientNo;
	private int recipientHosNo;
	private int recipientType;
	private Date dateRead;
	private int trash;
	
	private String recipientNickname;
	private String hosTitle;
	private String memberSysName;
	private String memberFilePath;
	private String hosSysName;
	private String hosFilePath;
	
	public int getMsgId() {
		return msgId;
	}
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
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
	public int getRecipientHosNo() {
		return recipientHosNo;
	}
	public void setRecipientHosNo(int recipientHosNo) {
		this.recipientHosNo = recipientHosNo;
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
	public String getRecipientNickname() {
		return recipientNickname;
	}
	public void setRecipientNickname(String recipientNickname) {
		this.recipientNickname = recipientNickname;
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
	public String getHosSysName() {
		return hosSysName;
	}
	public void setHosSysName(String hosSysName) {
		this.hosSysName = hosSysName;
	}
	public String getHosFilePath() {
		return hosFilePath;
	}
	public void setHosFilePath(String hosFilePath) {
		this.hosFilePath = hosFilePath;
	}
	@Override
	public String toString() {
		return "RecipientGroup [msgId=" + msgId + ", recipientGroupId=" + recipientGroupId + ", recipientNo="
				+ recipientNo + ", recipientHosNo=" + recipientHosNo + ", recipientType=" + recipientType
				+ ", dateRead=" + dateRead + ", trash=" + trash + ", recipientNickname=" + recipientNickname
				+ ", hosTitle=" + hosTitle + ", memberSysName=" + memberSysName + ", memberFilePath=" + memberFilePath
				+ ", hosSysName=" + hosSysName + ", hosFilePath=" + hosFilePath + "]";
	}

	
}
