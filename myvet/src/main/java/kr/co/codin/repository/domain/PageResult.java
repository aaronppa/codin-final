package kr.co.codin.repository.domain;

public class PageResult {

//	private int tabSize = 10	// 목록 하단에 보여질 페이지 갯수
//	private int listSize = 10; // 목록 갯수
	
	private int count;
	private int lastPage;
	private int pageNo;
	private int beginPage;
	private int endPage;
	private boolean prev;	
	private boolean next;	
	
	public PageResult (int pageNo, int count) {
		this(pageNo, count, 10, 10);
	}
	
	public PageResult (int pageNo, int count, int listSize, int tabSize) {
		this.pageNo = pageNo;
		this.count = count;
		
		lastPage = (int) Math.ceil(count / (double) listSize);
		
		int currTab =(pageNo -1) / tabSize + 1;

		beginPage = (currTab - 1) * tabSize + 1;
	
		endPage = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;

		prev = beginPage != 1;
		next = endPage != lastPage;
	}

	public int getCount() 		{return count;}
	public int getLastPage() 	{return lastPage;}
	public int getPageNo() 		{return pageNo;}
	public int getBeginPage()	{return beginPage;}
	public int getEndPage() 	{return endPage;}
	public boolean isPrev()	{return prev;}
	public boolean isNext()	{return next;}

	@Override
	public String toString() {
		return "PageResult [count=" + count + ", lastPage=" + lastPage + ", pageNo=" + pageNo + ", beginPage="
				+ beginPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + "]";
	}
	
}
