package kr.co.codin.repository.domain;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

public class FileInfo {

	private int fileId;
	private int boardCode;
	private int boardNo;
	private String oriName;
	private String sysName;
	private String filePath;
	private long fileSize;
	private String url;
	
	@Autowired
	private ServletContext servletContext;
	
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
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getUrl() {
		url = servletContext.getRealPath("/") + "/upload" + filePath + sysName;
		return url;
	}
	public ServletContext getServletContext() {
		return servletContext;
	}
	
}
