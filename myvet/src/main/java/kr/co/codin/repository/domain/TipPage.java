package kr.co.codin.repository.domain;

public class TipPage {
	protected int pageNo;
	protected int pageNum;
	
	public TipPage (int pageNo) {
		this(pageNo, 8);
	}

	public TipPage (int pageNo, int pageNum) {
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
