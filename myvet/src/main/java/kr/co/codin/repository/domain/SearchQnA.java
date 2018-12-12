package kr.co.codin.repository.domain;

public class SearchQnA extends Page{
	int pageNo;
	public SearchQnA() {
		super(1);
		// TODO Auto-generated constructor stub
	}
	
	public SearchQnA(int pageNo) {
		super(pageNo);
		// TODO Auto-generated constructor stub
	}
	
	
	
	private int order;
	private int answered;
	private int categoryCode;
	private String sort;
	private String keyword;
	private int prev;
	private int next;
	
	
	
	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public int getAnswered() {
		return answered;
	}

	public void setAnswered(int answered) {
		this.answered = answered;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "SearchQnA [pageNo=" + pageNo + ", order=" + order + ", answered=" + answered + ", categoryCode="
				+ categoryCode + ", sort=" + sort + ", keyword=" + keyword + ", prev=" + prev + ", next=" + next + "]";
	}
	
	
	
}
