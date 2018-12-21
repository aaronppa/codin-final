package kr.co.codin.repository.domain;

public class HosChart {
	private int chartNo;
	private int boardCode;
	private int hosCode;
	private int vetNo;
	private int bookingNo;
	private String disease;
	private String diagnosis;
	private String warning;
	private int memberNo;
	private int petNo;
	private String nextBooking;
	private String chartRegDate;
	private String chartEditDate;
	private Member vet;
	private Member member;
	private Pet pet;
	public int getChartNo() {
		return chartNo;
	}
	public void setChartNo(int chartNo) {
		this.chartNo = chartNo;
	}
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public int getHosCode() {
		return hosCode;
	}
	public void setHosCode(int hosCode) {
		this.hosCode = hosCode;
	}
	public int getVetNo() {
		return vetNo;
	}
	public void setVetNo(int vetNo) {
		this.vetNo = vetNo;
	}
	public int getBookingNo() {
		return bookingNo;
	}
	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public String getDiagnosis() {
		return diagnosis;
	}
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
	public String getWarning() {
		return warning;
	}
	public void setWarning(String warning) {
		this.warning = warning;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getPetNo() {
		return petNo;
	}
	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}
	public String getNextBooking() {
		return nextBooking;
	}
	public void setNextBooking(String nextBooking) {
		this.nextBooking = nextBooking;
	}
	public String getChartRegDate() {
		return chartRegDate;
	}
	public void setChartRegDate(String chartRegDate) {
		this.chartRegDate = chartRegDate;
	}
	public Member getVet() {
		return vet;
	}
	public void setVet(Member vet) {
		this.vet = vet;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Pet getPet() {
		return pet;
	}
	public void setPet(Pet pet) {
		this.pet = pet;
	}
	@Override
	public String toString() {
		return "HosChart [chartNo=" + chartNo + ", boardCode=" + boardCode + ", hosCode=" + hosCode + ", vetNo=" + vetNo
				+ ", bookingNo=" + bookingNo + ", disease=" + disease + ", diagnosis=" + diagnosis + ", warning="
				+ warning + ", memberNo=" + memberNo + ", petNo=" + petNo + ", nextBooking=" + nextBooking
				+ ", chartRegDate=" + chartRegDate + ", chartEditDate=" + chartEditDate + ", vet=" + vet + ", member="
				+ member + ", pet=" + pet + "]";
	}
}
