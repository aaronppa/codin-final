package kr.co.codin.repository.domain;

public class HosFacility {
	private int facilityNo;
	private int hosCode;
	private int facilityCode;
	private char facilityBookable;
	private int staffNo;
	private int maxBooking;
	private String facilityName;
	public int getFacilityNo() {
		return facilityNo;
	}
	public void setFacilityNo(int facilityNo) {
		this.facilityNo = facilityNo;
	}
	public int getHosCode() {
		return hosCode;
	}
	public void setHosCode(int hosCode) {
		this.hosCode = hosCode;
	}
	public int getFacilityCode() {
		return facilityCode;
	}
	public void setFacilityCode(int facilityCode) {
		this.facilityCode = facilityCode;
	}
	public char getFacilityBookable() {
		return facilityBookable;
	}
	public void setFacilityBookable(char facilityBookable) {
		this.facilityBookable = facilityBookable;
	}
	public int getStaffNo() {
		return staffNo;
	}
	public void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
	}
	public int getMaxBooking() {
		return maxBooking;
	}
	public void setMaxBooking(int maxBooking) {
		this.maxBooking = maxBooking;
	}
	public String getFacilityName() {
		return facilityName;
	}
	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}
}
