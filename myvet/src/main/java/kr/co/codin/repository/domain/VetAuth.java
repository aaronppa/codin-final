package kr.co.codin.repository.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class VetAuth {
	private int vetFileNo;
	private int memberNo;
	private String vetOriName;
	private String vetSysName;
	private String vetFilePath;
	private int vetFileSize;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date vetFileRegDate;

	public int getVetFileNo() {
		return vetFileNo;
	}

	public void setVetFileNo(int vetFileNo) {
		this.vetFileNo = vetFileNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getVetOriName() {
		return vetOriName;
	}

	public void setVetOriName(String vetOriName) {
		this.vetOriName = vetOriName;
	}

	public String getVetSysName() {
		return vetSysName;
	}

	public void setVetSysName(String vetSysName) {
		this.vetSysName = vetSysName;
	}

	public String getVetFilePath() {
		return vetFilePath;
	}

	public void setVetFilePath(String vetFilePath) {
		this.vetFilePath = vetFilePath;
	}

	public int getVetFileSize() {
		return vetFileSize;
	}

	public void setVetFileSize(int vetFileSize) {
		this.vetFileSize = vetFileSize;
	}

	public Date getVetFileRegDate() {
		return vetFileRegDate;
	}

	public void setVetFileRegDate(Date vetFileRegDate) {
		this.vetFileRegDate = vetFileRegDate;
	}

	@Override
	public String toString() {
		return "VetAuth [vetFileNo=" + vetFileNo + ", memberNo=" + memberNo + ", vetOriName=" + vetOriName
				+ ", vetSysName=" + vetSysName + ", vetFilePath=" + vetFilePath + ", vetFileSize=" + vetFileSize
				+ ", vetFileRegDate=" + vetFileRegDate + "]";
	}
	
	
}
