package kr.co.codin.repository.domain;

public class HosBooking {
	private int bookingNo;
	private int blockCode;
	private int bookingOwner;
	private int bookingPet;
	private int hosCode;
	private char confirm;
	private char finish;
	private HosBlock hosBlock;
	private Member member;
	private Pet pet;

	public int getBookingNo() {
		return bookingNo;
	}
	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}
	public int getBlockCode() {
		return blockCode;
	}
	public void setBlockCode(int blockCode) {
		this.blockCode = blockCode;
	}
	public int getBookingOwner() {
		return bookingOwner;
	}
	public void setBookingOwner(int bookingOwner) {
		this.bookingOwner = bookingOwner;
	}
	public int getBookingPet() {
		return bookingPet;
	}
	public void setBookingPet(int bookingPet) {
		this.bookingPet = bookingPet;
	}
	public int getHosCode() {
		return hosCode;
	}
	public void setHosCode(int hosCode) {
		this.hosCode = hosCode;
	}
	public char getConfirm() {
		return confirm;
	}
	public void setConfirm(char confirm) {
		this.confirm = confirm;
	}
	public char getFinish() {
		return finish;
	}
	public void setFinish(char finish) {
		this.finish = finish;
	}
	public HosBlock getHosBlock() {
		return hosBlock;
	}
	public void setHosBlock(HosBlock hosBlock) {
		this.hosBlock = hosBlock;
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
		return "HosBooking [bookingNo=" + bookingNo + ", blockCode=" + blockCode + ", bookingOwner=" + bookingOwner
				+ ", bookingPet=" + bookingPet + ", hosCode=" + hosCode + ", confirm=" + confirm + ", finish=" + finish
				+ ", hosBlock=" + hosBlock + ", member=" + member + ", pet=" + pet + "]";
	}
	
}
