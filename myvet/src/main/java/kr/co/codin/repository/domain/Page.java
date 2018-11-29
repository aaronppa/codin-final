package kr.co.codin.repository.domain;

public class Page {
	// 페이지 번호
	protected int pageNo;
	protected int pageNum;
	
	public Page (int pageNo) {
		this(pageNo, 10);
	}

	public Page (int pageNo, int pageNum) {
		this.pageNo = pageNo;
		this.pageNum = pageNum;
	}
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getEnd() {
		return pageNo*pageNum;
	}

	public int getBegin() {
		return ((pageNo-1)*pageNum);
	}
	
}
