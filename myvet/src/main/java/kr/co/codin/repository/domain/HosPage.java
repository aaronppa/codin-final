package kr.co.codin.repository.domain;

public class HosPage extends Page{

	private String keyWord;

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

	
}
