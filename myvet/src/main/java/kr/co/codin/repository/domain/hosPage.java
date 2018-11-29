package kr.co.codin.repository.domain;

public class hosPage extends Page{

	private String keyWord;

	public hosPage (int pageNo) {
		this(pageNo, 10);
	}

	public hosPage (int pageNo, int pageNum) {
		super(pageNo, pageNum);
	}
	
	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	
}
