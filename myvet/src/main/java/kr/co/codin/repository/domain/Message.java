package kr.co.codin.repository.domain;

import java.util.Date;
import java.util.List;

public class Message {
	private int recipientNo;
	private int msgId;
	private int chatId;
	private int senderNo;
	private String senderNickname;
	private String msgBody;
	private Date dateSent;
	private int msgType;
	
	List<RecipientGroup> recipients;

	public int getRecipientNo() {
		return recipientNo;
	}

	public void setMemberNo(int recipientNo) {
		this.recipientNo = recipientNo;
	}

	public List<RecipientGroup> getRecipients() {
		return recipients;
	}

	public void setRecipients(List<RecipientGroup> recipients) {
		this.recipients = recipients;
	}

	public String getSenderNickname() {
		return senderNickname;
	}
	
	public void setSenderNickname(String senderNickname) {
		this.senderNickname = senderNickname;
	}

	public int getMsgId() {
		return msgId;
	}

	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public int getSenderNo() {
		return senderNo;
	}

	public void setSenderNo(int senderNo) {
		this.senderNo = senderNo;
	}

	public String getMsgBody() {
		return msgBody;
	}

	public void setMsgBody(String msgBody) {
		this.msgBody = msgBody;
	}

	public Date getDateSent() {
		return dateSent;
	}

	public void setDateSent(Date dateSent) {
		this.dateSent = dateSent;
	}

	public int getMsgType() {
		return msgType;
	}

	public void setMsgType(int msgType) {
		this.msgType = msgType;
	}

	@Override
	public String toString() {
		return "Message [recipientNo=" + recipientNo + ", msgId=" + msgId + ", chatId=" + chatId + ", senderNo=" + senderNo
				+ ", senderNickname=" + senderNickname + ", msgBody=" + msgBody + ", dateSent=" + dateSent
				+ ", msgType=" + msgType + ", recipients=" + recipients + "]";
	}

	
}
