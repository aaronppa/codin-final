package kr.co.codin.repository.domain;

import java.util.Date;

public class TipComment {
	private int commentNo;
	private int tipNo;
	private int commenterNo;
	private String comment;
	private Date regDate;
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getTipNo() {
		return tipNo;
	}
	public void setTipNo(int tipNo) {
		this.tipNo = tipNo;
	}
	public int getCommenterNo() {
		return commenterNo;
	}
	public void setCommenterNo(int commenterNo) {
		this.commenterNo = commenterNo;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
