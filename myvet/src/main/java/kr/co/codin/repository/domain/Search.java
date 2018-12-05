package kr.co.codin.repository.domain;

public class Search extends Page{
	
	public Search() {
		super(1);
	}
	public Search(int pageNo) {
		super(pageNo);
	}
	
	public Search(int pageNo, String memberType) {
		super(pageNo);
		this.memberType=memberType;
		System.out.println("memberType incoming:"+memberType);
	}
	
	private String memberId;
	private String keyword;
	private String board;
	private String contentType;
	private String memberType;
	private String reportType;
	private String status;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getBoard() {
		return board;
	}
	public void setBoard(String board) {
		this.board = board;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Search [memberId=" + memberId + ", keyword=" + keyword + ", board=" + board + ", contentType="
				+ contentType + ", memberType=" + memberType + ", reportType=" + reportType + ", status=" + status
				+ ", pageNo=" + pageNo + ", pageNum=" + pageNum + "]";
	}
	
	
	
	
	
	
}
