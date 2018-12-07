package kr.co.codin.repository.domain;

import java.util.Date;

public class Report {
	private int reportNo;
	private int boardCode;
	private int contentNo;
	private int commentNo;
	private int reportMemberNo;
	private int targetMemberNo;
	private int reportCode;
	private Date reportDate;
	private int processResult;
	private String reportContent;
	

	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public int getContentNo() {
		return contentNo;
	}
	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getReportMemberNo() {
		return reportMemberNo;
	}
	public void setReportMemberNo(int reportMemberNo) {
		this.reportMemberNo = reportMemberNo;
	}
	public int getTargetMemberNo() {
		return targetMemberNo;
	}
	public void setTargetMemberNo(int targetMemberNo) {
		this.targetMemberNo = targetMemberNo;
	}
	public int getReportCode() {
		return reportCode;
	}
	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public int getProcessResult() {
		return processResult;
	}
	public void setProcessResult(int processResult) {
		this.processResult = processResult;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", boardCode=" + boardCode + ", contentNo=" + contentNo + ", commentNo="
				+ commentNo + ", reportMemberNo=" + reportMemberNo + ", targetMemberNo=" + targetMemberNo
				+ ", reportCode=" + reportCode + ", reportDate=" + reportDate + ", processResult=" + processResult
				+ ", reportContent=" + reportContent + "]";
	}
	

}  
