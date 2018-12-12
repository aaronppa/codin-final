package kr.co.codin.repository.domain;

import java.util.Date;
import java.util.List;

public class Message {
	private int msgId;
	private int chatId;
	private int senderNo;
	private String msgBody;
	private Date dateSent;
	private int msgType;
	
	List<RecipientGroup> RecipientGroup;

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

	public List<RecipientGroup> getRecipientGroup() {
		return RecipientGroup;
	}

	public void setRecipientGroup(List<RecipientGroup> recipientGroup) {
		RecipientGroup = recipientGroup;
	}

	@Override
	public String toString() {
		return "Message [msgId=" + msgId + ", chatId=" + chatId + ", senderNo=" + senderNo + ", msgBody=" + msgBody
				+ ", dateSent=" + dateSent + ", msgType=" + msgType + ", RecipientGroup=" + RecipientGroup + "]";
	}
	
	
}
