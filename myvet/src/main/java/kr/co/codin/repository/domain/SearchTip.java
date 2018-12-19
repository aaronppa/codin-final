package kr.co.codin.repository.domain;

public class SearchTip extends Page{
	
	public SearchTip() {
		super(1);
	}
	public SearchTip(int pageNo) {
		super(pageNo);
	}

//	public SearchTip(int pageNo, String keyword) {
//		super(pageNo);
//		this.keyword = keyword;
//	}
	
	private int sort;
	private int category;
	private String keyword;
	
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
	
	
	
	