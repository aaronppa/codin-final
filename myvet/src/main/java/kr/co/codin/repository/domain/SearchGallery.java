package kr.co.codin.repository.domain;

public class SearchGallery extends GalleryPage{
	
	public SearchGallery() {
		super(1);
	}
	public SearchGallery(int pageNo) {
		super(pageNo);
	}

	private int sort;
	private String keyword;
	
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}

	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
	
	
	
	