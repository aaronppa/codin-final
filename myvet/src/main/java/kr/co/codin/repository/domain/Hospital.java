package kr.co.codin.repository.domain;

import java.sql.Time;

public class Hospital {
	int hosCode;
	String title;
	String roadAddress;
	String address;
	double mapx;
	double mapy;
	int hosSearchCnt;
	String telephone;
	char hosRegister;
	Time lunchStart;
	Time lunchEnd;
	String hosComment;
	int followCnt;
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
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getMapx() {
		return mapx;
	}
	public void setMapx(double mapx) {
		this.mapx = mapx;
	}
	public double getMapy() {
		return mapy;
	}
	public void setMapy(double mapy) {
		this.mapy = mapy;
	}
	public int getHosSearchCnt() {
		return hosSearchCnt;
	}
	public void setHosSearchCnt(int hosSearchCnt) {
		this.hosSearchCnt = hosSearchCnt;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public char getHosRegister() {
		return hosRegister;
	}
	public void setHosRegister(char hosRegister) {
		this.hosRegister = hosRegister;
	}
	public Time getLunchStart() {
		return lunchStart;
	}
	public void setLunchStart(Time lunchStart) {
		this.lunchStart = lunchStart;
	}
	public Time getLunchEnd() {
		return lunchEnd;
	}
	public void setLunchEnd(Time lunchEnd) {
		this.lunchEnd = lunchEnd;
	}
	public String getHosComment() {
		return hosComment;
	}
	public void setHosComment(String hosComment) {
		this.hosComment = hosComment;
	}
	public int getFollowCnt() {
		return followCnt;
	}
	public void setFollowCnt(int followCnt) {
		this.followCnt = followCnt;
	}
	@Override
	public String toString() {
		return "Hospital [hosCode=" + hosCode + ", title=" + title + ", roadAddress=" + roadAddress + ", address="
				+ address + ", mapx=" + mapx + ", mapy=" + mapy + ", hosSearchCnt=" + hosSearchCnt + ", telephone="
				+ telephone + ", hosRegister=" + hosRegister + ", lunchStart=" + lunchStart + ", lunchEnd=" + lunchEnd
				+ ", hosComment=" + hosComment + ", followCnt=" + followCnt + "]";
	}
	
}
