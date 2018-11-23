package kr.co.codin.repository.domain;

public class HosFacilitylist {
	private int facilityCode;
	private String facilityName;
	
	public int getFacilityCode() {
		return facilityCode;
	}
	public void setFacilityCode(int facilityCode) {
		this.facilityCode = facilityCode;
	}
	public String getFacilityName() {
		return facilityName;
	}
	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}
	
	@Override
	public String toString() {
		return "HosFacilitylist [facilityCode=" + facilityCode + ", facilityName=" + facilityName + "]";
	}
	
}
