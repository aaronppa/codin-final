package kr.co.codin.repository.domain;

public class FavHos {

	private int favHosNo;
	private int memberNo;
	private int hosCode;
	
	public int getFavHosNo() {
		return favHosNo;
	}
	public void setFavHosNo(int favHosNo) {
		this.favHosNo = favHosNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getHosCode() {
		return hosCode;
	}
	public void setHosCode(int hosCode) {
		this.hosCode = hosCode;
	}
	
	@Override
	public String toString() {
		return "FavHos [favHosNo=" + favHosNo + ", memberNo=" + memberNo + ", hosCode=" + hosCode + "]";
	}
	
}
