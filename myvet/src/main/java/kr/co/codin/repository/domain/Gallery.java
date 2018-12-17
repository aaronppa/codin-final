package kr.co.codin.repository.domain;

import java.util.Date;
import java.util.List;

public class Gallery {
	private int galleryNo;
	private int boardCode;
	private int writerNo;
	private String content;
	private String title;
	private Date regDate;
	private int viewCnt;
	private int recomCnt;

	private String memberNickname;
	private List<FileInfo> fileInfoList;
	private int comCnt;
	private List<Pet> petList;
	
	
	
	
	public List<Pet> getPetList() {
		return petList;
	}
	public void setPetList(List<Pet> petList) {
		this.petList = petList;
	}
	public int getComCnt() {
		return comCnt;
	}
	public void setComCnt(int comCnt) {
		this.comCnt = comCnt;
	}
	public List<FileInfo> getFileInfoList() {
		return fileInfoList;
	}
	public void setFileInfoList(List<FileInfo> fileInfoList) {
		this.fileInfoList = fileInfoList;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public int getGalleryNo() {
		return galleryNo;
	}
	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public int getWriterNo() {
		return writerNo;
	}
	public void setWriterNo(int memberNo) {
		this.writerNo = memberNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getRecomCnt() {
		return recomCnt;
	}
	public void setRecomCnt(int recomCnt) {
		this.recomCnt = recomCnt;
	}
	@Override
	public String toString() {
		return "Gallery [galleryNo=" + galleryNo + ", boardCode=" + boardCode + ", writerNo=" + writerNo + ", content="
				+ content + ", title=" + title + ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", recomCnt="
				+ recomCnt + ", memberNickname=" + memberNickname + ", fileInfoList=" + fileInfoList + ", comCnt="
				+ comCnt + ", petList=" + petList + "]";
	}
	
	
	
}
