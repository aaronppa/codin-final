package kr.co.codin.repository.domain;

public class HosBoard {
	private int hosBoardId;
	private int boardCode;
	private int hosCode;
	private int hosBoardNo;
	private int hosBoardCategoryCode;
	private String hosBoardTitle;
	private String hosBoardContent;
	private int hosBoardWriterNo;
	private int hosBoardViewCnt;
	private String hosBoardRegDate;
	private Member writer;
	private String categoryName;
	
	public int getHosBoardId() {
		return hosBoardId;
	}
	public void setHosBoardId(int hosBoardId) {
		this.hosBoardId = hosBoardId;
	}
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public int getHosCode() {
		return hosCode;
	}
	public void setHosCode(int hosCode) {
		this.hosCode = hosCode;
	}
	public int getHosBoardNo() {
		return hosBoardNo;
	}
	public void setHosBoardNo(int hosBoardNo) {
		this.hosBoardNo = hosBoardNo;
	}
	public int getHosBoardCategoryCode() {
		return hosBoardCategoryCode;
	}
	public void setHosBoardCategoryCode(int hosBoardCategoryCode) {
		this.hosBoardCategoryCode = hosBoardCategoryCode;
	}
	public String getHosBoardTitle() {
		return hosBoardTitle;
	}
	public void setHosBoardTitle(String hosBoardTitle) {
		this.hosBoardTitle = hosBoardTitle;
	}
	public String getHosBoardContent() {
		return hosBoardContent;
	}
	public void setHosBoardContent(String hosBoardContent) {
		this.hosBoardContent = hosBoardContent;
	}
	public int getHosBoardWriterNo() {
		return hosBoardWriterNo;
	}
	public void setHosBoardWriterNo(int hosBoardWriterNo) {
		this.hosBoardWriterNo = hosBoardWriterNo;
	}
	public int getHosBoardViewCnt() {
		return hosBoardViewCnt;
	}
	public void setHosBoardViewCnt(int hosBoardViewCnt) {
		this.hosBoardViewCnt = hosBoardViewCnt;
	}
	public String getHosBoardRegDate() {
		return hosBoardRegDate;
	}
	public void setHosBoardRegDate(String hosBoardRegDate) {
		this.hosBoardRegDate = hosBoardRegDate;
	}
	public Member getWriter() {
		return writer;
	}
	public void setWriter(Member writer) {
		this.writer = writer;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
}
