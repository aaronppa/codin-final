package kr.co.codin.repository.domain;

import java.sql.Time;

public class HosHours {
	private int hoursNo;
	private int hosCode;
	private int openDay;
	private Time openTime;
	private Time closeTime;
	private char dayoff;
	public int getHoursNo() {
		return hoursNo;
	}
	public void setHoursNo(int hoursNo) {
		this.hoursNo = hoursNo;
	}
	public int getHosCode() {
		return hosCode;
	}
	public void setHosCode(int hosCode) {
		this.hosCode = hosCode;
	}
	public int getOpenDay() {
		return openDay;
	}
	public void setOpenDay(int openDay) {
		this.openDay = openDay;
	}
	public Time getOpenTime() {
		return openTime;
	}
	public void setOpenTime(Time openTime) {
		this.openTime = openTime;
	}
	public Time getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(Time closeTime) {
		this.closeTime = closeTime;
	}
	public char getDayoff() {
		return dayoff;
	}
	public void setDayoff(char dayoff) {
		this.dayoff = dayoff;
	}
	
	
}
