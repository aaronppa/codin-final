package kr.co.codin.repository.domain;

public class QnaRecommend {
	private int no;
	private int memberNo;
	private int qndNo;
	private int recommend;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getQndNo() {
		return qndNo;
	}
	public void setQndNo(int qndNo) {
		this.qndNo = qndNo;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

}
