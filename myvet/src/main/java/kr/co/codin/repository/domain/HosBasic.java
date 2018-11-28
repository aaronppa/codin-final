package kr.co.codin.repository.domain;

import java.util.List;

public class HosBasic {
	
	public String title;
	public String telephone;
	public String address;
	public String roadAddress;
	//List<items> items;
	//List<places> places;
	//List<Addresses2> addresses;
	public double mapy;
	public double mapx;
	public char hosRegister;
	
	public char getHosRegister() {
		return hosRegister;
	}
	public HosBasic setHosRegister(char hosRegister) {
		this.hosRegister = hosRegister;
		return null;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public double getMapy() {
		return mapy;
	}
	public void setMapy(double mapy) {
		this.mapy = mapy;
	}
	public double getMapx() {
		return mapx;
	}
	public void setMapx(double mapx) {
		this.mapx = mapx;
	}
	@Override
	public String toString() {
		return "HosBasic [title=" + title + ", telephone=" + telephone + ", address=" + address + ", roadAddress="
				+ roadAddress + ", mapy=" + mapy + ", mapx=" + mapx + ", hosRegister=" + hosRegister + "]";
	}
	
	
	
	
}
