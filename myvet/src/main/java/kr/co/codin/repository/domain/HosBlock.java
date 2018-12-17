package kr.co.codin.repository.domain;

import java.sql.Time;
import java.util.Date;

public class HosBlock {
	private int blockCode;
	private int hosCode;
	private String blockDay;
	private int blockNo;
	private Time blockStart;
	private Time blockEnd;
	private int facilityNo;
	private int maxBooking;
	private int countBooking;
	
	public int getBlockCode() {
		return blockCode;
	}
	public void setBlockCode(int blockCode) {
		this.blockCode = blockCode;
	}
	public int getHosCode() {
		return hosCode;
	}
	public void setHosCode(int hosCode) {
		this.hosCode = hosCode;
	}
	public String getBlockDay() {
		return blockDay;
	}
	public void setBlockDay(String blockDay) {
		this.blockDay = blockDay;
	}
	public int getBlockNo() {
		return blockNo;
	}
	public void setBlockNo(int blockNo) {
		this.blockNo = blockNo;
	}
	public Time getBlockStart() {
		return blockStart;
	}
	public void setBlockStart(Time blockStart) {
		this.blockStart = blockStart;
	}
	public Time getBlockEnd() {
		return blockEnd;
	}
	public void setBlockEnd(Time blockEnd) {
		this.blockEnd = blockEnd;
	}
	public int getFacilityNo() {
		return facilityNo;
	}
	public void setFacilityNo(int facilityNo) {
		this.facilityNo = facilityNo;
	}
	public int getMaxBooking() {
		return maxBooking;
	}
	public void setMaxBooking(int maxBooking) {
		this.maxBooking = maxBooking;
	}
	public int getCountBooking() {
		return countBooking;
	}
	public void setCountBooking(int countBooking) {
		this.countBooking = countBooking;
	}
	@Override
	public String toString() {
		return "HosBlock [blockCode=" + blockCode + ", hosCode=" + hosCode + ", blockDay=" + blockDay + ", blockNo="
				+ blockNo + ", blockStart=" + blockStart + ", blockEnd=" + blockEnd + ", facilityNo=" + facilityNo
				+ ", maxBooking=" + maxBooking + ", countBooking=" + countBooking + "]";
	}	

}
