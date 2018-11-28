package kr.co.codin.repository.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Notice {
	int noticeNo;
	String noticeTitle;
	int noticeWriter;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	Date noticeRegDate;
	int noticeViewCnt;
	String noticeContent;
	int tempSave;
	Member member;
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public int getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(int noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public Date getNoticeRegDate() {
		return noticeRegDate;
	}
	public void setNoticeRegDate(Date noticeRegDate) {
		this.noticeRegDate = noticeRegDate;
	}
	public int getNoticeViewCnt() {
		return noticeViewCnt;
	}
	public void setNoticeViewCnt(int noticeViewCnt) {
		this.noticeViewCnt = noticeViewCnt;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	
	public int getTempSave() {
		return tempSave;
	}
	public void setTempSave(int tempSave) {
		this.tempSave = tempSave;
	}
	
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeWriter=" + noticeWriter
				+ ", noticeRegDate=" + noticeRegDate + ", noticeViewCnt=" + noticeViewCnt + ", noticeContent="
				+ noticeContent + ", tempSave=" + tempSave + ", member=" + member + "]";
	}
	
	
}
