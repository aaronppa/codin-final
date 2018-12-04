package kr.co.codin.repository.domain;

public class TempBooking {

	private String date;
	private String openTime;
	private String closeTime;
	private int bookInterval;
	private String breakStart;
	private String breakEnd;
	private int maxBook;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}
	public int getBookInterval() {
		return bookInterval;
	}
	public void setBookInterval(int bookInterval) {
		this.bookInterval = bookInterval;
	}
	public String getBreakStart() {
		return breakStart;
	}
	public void setBreakStart(String breakStart) {
		this.breakStart = breakStart;
	}
	public String getBreakEnd() {
		return breakEnd;
	}
	public void setBreakEnd(String breakEnd) {
		this.breakEnd = breakEnd;
	}
	public int getMaxBook() {
		return maxBook;
	}
	public void setMaxBook(int maxBook) {
		this.maxBook = maxBook;
	}
	
	@Override
	public String toString() {
		return "TempBooking [date=" + date + ", openTime=" + openTime + ", closeTime=" + closeTime + ", bookInterval="
				+ bookInterval + ", breakStart=" + breakStart + ", breakEnd=" + breakEnd + ", maxBook=" + maxBook + "]";
	}
}
