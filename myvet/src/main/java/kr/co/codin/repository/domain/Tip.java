package kr.co.codin.repository.domain;

import java.util.Date;

public class Tip {
	private int tipNo;
	private int boardCode;
	private String title;
	private int memberNo;
	private String content;
	private Date regDate;
	private int viewCnt;
	private int categoryCode;
	private int recomCnt;
	
	private Member member;
	private String memberNickname;
	
	
	
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public int getTipNo() {
		return tipNo;
	}
	public void setTipNo(int tipNo) {
		this.tipNo = tipNo;
	}
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}
	public int getRecomCnt() {
		return recomCnt;
	}
	public void setRecomCnt(int recomCnt) {
		this.recomCnt = recomCnt;
	}
	
	@Override
	public String toString() {
		return "Tip [tipNo=" + tipNo + ", boardCode=" + boardCode + ", title=" + title + ", memberNo=" + memberNo
				+ ", content=" + content + ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", categoryCode="
				+ categoryCode + ", recomCnt=" + recomCnt + "]";
	}
}
