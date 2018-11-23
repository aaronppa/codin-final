package kr.co.codin.repository.domain;

public class TestHospital {
	String name;
	String road_address;
	String jibun_address;
	String phone_number;
	double x;
	double y;
	double distance;
	String SessionId;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRoad_address() {
		return road_address;
	}
	public void setRoad_address(String road_address) {
		this.road_address = road_address;
	}
	public String getJibun_address() {
		return jibun_address;
	}
	public void setJibun_address(String jibun_address) {
		this.jibun_address = jibun_address;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	public String getSessionId() {
		return SessionId;
	}
	public void setSessionId(String sessionId) {
		SessionId = sessionId;
	}
}
