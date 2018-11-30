package kr.co.codin.repository.domain;

public class HosBooking {
	private int bookingNo;
	private int block_code;
	private int bookingOwner;
	private int bookingPet;
	private char confirm;
	private char finish;
	private HosBlock hosBlock;
	private Member member;
//	private Pet pet;
	public int getBookingNo() {
		return bookingNo;
	}
	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}
	public int getBlock_code() {
		return block_code;
	}
	public void setBlock_code(int block_code) {
		this.block_code = block_code;
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
	
}
