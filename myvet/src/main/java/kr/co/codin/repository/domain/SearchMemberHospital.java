package kr.co.codin.repository.domain;

public class SearchMemberHospital {
	private int memberNo;
	private String memberGrade;
	private String memberNickname;
	private int hosCode;
	private String title;
	private String memberOriName;
	private String memberSysName;
	private String memberFilePath;
	private int fileId;
	private int boardCode;
	private String oriName;
	private String sysName;
	private String filePath;
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public int getHosCode() {
		return hosCode;
	}
	public void setHosCode(int hosCode) {
		this.hosCode = hosCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMemberOriName() {
		return memberOriName;
	}
	public void setMemberOriName(String memberOriName) {
		this.memberOriName = memberOriName;
	}
	public String getMemberSysName() {
		return memberSysName;
	}
	public void setMemberSysName(String memberSysName) {
		this.memberSysName = memberSysName;
	}
	public String getMemberFilePath() {
		return memberFilePath;
	}
	public void setMemberFilePath(String memberFilePath) {
		this.memberFilePath = memberFilePath;
	}
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "SearchMemberHospital [memberNo=" + memberNo + ", memberGrade=" + memberGrade + ", memberNickname="
				+ memberNickname + ", hosCode=" + hosCode + ", title=" + title + ", memberOriName=" + memberOriName
				+ ", memberSysName=" + memberSysName + ", memberFilePath=" + memberFilePath + ", fileId=" + fileId
				+ ", boardCode=" + boardCode + ", oriName=" + oriName + ", sysName=" + sysName
				+ ", filePath=" + filePath + "]";
	}
	
	
}
