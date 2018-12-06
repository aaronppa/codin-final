package kr.co.codin.repository.domain.helper;

import kr.co.codin.repository.domain.HosBlock;

public class HosBookingResult extends HosBlock {
	private String confirm;
	private String finish;
	private String hosTitle;
	
	public String getHosTitle() {
		return hosTitle;
	}
	public void setHosTitle(String hosTitle) {
		this.hosTitle = hosTitle;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getFinish() {
		return finish;
	}
	public void setFinish(String finish) {
		this.finish = finish;
	}
}
