package kr.co.codin.repository.domain;

import java.util.Date;

public class QnaComment {
	private int commentNo;
	private int qnaNo;
	private int commenterNo;
	private String content;
	private Date regDate;
	private char pick;
	private int recommendCnt;
	private String memberNickname;
	
	private char memberGrade;
	
	
	public char getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(char memberGrade) {
		this.memberGrade = memberGrade;
	}
	
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public int getRecommendCnt() {
		return recommendCnt;
	}
	public void setRecommendCnt(int recommendCnt) {
		this.recommendCnt = recommendCnt;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public int getCommenterNo() {
		return commenterNo;
	}
	public void setCommenterNo(int commenterNo) {
		this.commenterNo = commenterNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public char getPick() {
		return pick;
	}
	public void setPick(char pick) {
		this.pick = pick;
	}
	
	
}
