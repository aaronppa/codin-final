package kr.co.codin.repository.domain;

public class HosPage extends Page{

	private String keyWord;
	private int searchType;

	public HosPage (int pageNo) {
		this(pageNo, 10);
	}

	public HosPage (int pageNo, int pageNum) {
		super(pageNo, pageNum);
	}
	
	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public int getSearchType() {
		return searchType;
	}

	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}

	
	
}
