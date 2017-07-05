package myproj.stay.dto;

// 입원이나 호텔 서비스 관련 VO (테이블 이름 : hospital_stay)
public class StayVO {

	private String stay_num;			// 입원호텔 코드
	private String animal_num;			// 입원이나 호텔 서비스를 받는 동물번호
	private String stay_checkin;		// 입원이나 호텔의 chek in 날짜
	private String stay_checkout;		// 입원이나 호텔의 check out 날짜
	private String stay_reason;			// 입원이나 호텔의 사유
	private String ar_num;				// 입원장이나 호텔장 번호
	private String stay_ox;				// 입원이나 호텔 서비스가 종료되었는지 여부
	
	
	
	// 위 변수의 setter, getter
	public String getStay_ox() {
		return stay_ox;
	}
	public void setStay_ox(String stay_ox) {
		this.stay_ox = stay_ox;
	}
	public String getStay_num() {
		return stay_num;
	}
	public void setStay_num(String stay_num) {
		this.stay_num = stay_num;
	}
	public String getAnimal_num() {
		return animal_num;
	}
	public void setAnimal_num(String animal_num) {
		this.animal_num = animal_num;
	}
	public String getStay_checkin() {
		return stay_checkin;
	}
	public void setStay_checkin(String stay_checkin) {
		this.stay_checkin = stay_checkin;
	}
	public String getStay_checkout() {
		return stay_checkout;
	}
	public void setStay_checkout(String stay_checkout) {
		this.stay_checkout = stay_checkout;
	}
	public String getStay_reason() {
		return stay_reason;
	}
	public void setStay_reason(String stay_reason) {
		this.stay_reason = stay_reason;
	}
	public String getAr_num() {
		return ar_num;
	}
	public void setAr_num(String ar_num) {
		this.ar_num = ar_num;
	}


	
	
}
