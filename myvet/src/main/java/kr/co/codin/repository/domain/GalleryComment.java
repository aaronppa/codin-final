package kr.co.codin.repository.domain;

import java.util.Date;

public class GalleryComment {
	private int commentNo;
	private int galleryNo;
	private int commenterNo;
	private String comment;
	private Date regDate;
	private Member member;
	
	
	
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getGalleryNo() {
		return galleryNo;
	}
	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
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
