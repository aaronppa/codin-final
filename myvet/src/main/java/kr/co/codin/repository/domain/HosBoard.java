package kr.co.codin.repository.domain;

public class HosBoard {
	int hosBoardId;
	int boardCode;
	int hosCode;
	int hosBoardNo;
	int hosBoardCategoryCode;
	String hosBoardTitle;
	String hosBoardContent;
	int hosBoardWriterNo;
	int hosBoardViewCnt;
	String hosBoardRegDate;
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
	@Override
	public String toString() {
		return "HosBoard [hosBoardId=" + hosBoardId + ", boardCode=" + boardCode + ", hosCode=" + hosCode
				+ ", hosBoardNo=" + hosBoardNo + ", hosBoardCategoryCode=" + hosBoardCategoryCode + ", hosBoardTitle="
				+ hosBoardTitle + ", hosBoardContent=" + hosBoardContent + ", hosBoardWriterNo=" + hosBoardWriterNo
				+ ", hosBoardViewCnt=" + hosBoardViewCnt + ", hosBoardRegDate=" + hosBoardRegDate + "]";
	}
	
	
}
