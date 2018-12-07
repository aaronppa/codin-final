package kr.co.codin.repository.domain;

import java.util.Date;

public class Qna {
	private int qnaNo;
	private int boardCode;
	private String title;
	private int writerNo;
	private String content;
	private Date regDate;
	private int viewCnt;
	private int categoryCode;
	private char answered;
	private int recomCnt;
	
	private Member member;
	private QnaCategoryList category;
	
	
	
	
	public int getRecomCnt() {
		return recomCnt;
	}
	public void setRecomCnt(int recomCnt) {
		this.recomCnt = recomCnt;
	}
	public QnaCategoryList getCategory() {
		return category;
	}
	public void setCategory(QnaCategoryList category) {
		this.category = category;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
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
	public int getWriterNo() {
		return writerNo;
	}
	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
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
	public char getAnswered() {
		return answered;
	}
	public void setAnswered(char answered) {
		this.answered = answered;
	}
	
	

}
