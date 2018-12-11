package kr.co.codin.repository.domain;

public class HosBoardCategoryList {
	private int hosBoardCategoryCode;
	private String hosBoardCategoryName;
	
	public int getHosBoardCategoryCode() {
		return hosBoardCategoryCode;
	}
	public void setHosBoardCategoryCode(int hosBoardCategoryCode) {
		this.hosBoardCategoryCode = hosBoardCategoryCode;
	}
	public String getHosBoardCategoryName() {
		return hosBoardCategoryName;
	}
	public void setHosBoardCategoryName(String hosBoardCategoryName) {
		this.hosBoardCategoryName = hosBoardCategoryName;
	}
	@Override
	public String toString() {
		return "HosBoardCategoryList [hosBoardCategoryCode=" + hosBoardCategoryCode + ", hosBoardCategoryName="
				+ hosBoardCategoryName + "]";
	}
}
