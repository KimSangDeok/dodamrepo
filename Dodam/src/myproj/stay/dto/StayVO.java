package myproj.stay.dto;

// 입원이나 호텔 서비스 관련 VO (테이블 이름 : hospital_stay)
public class StayVO {

	private String stay_num;			// 입원호텔 코드
	private String animal_num;			// 입원이나 호텔 서비스를 받는 동물번호
	private String stay_checkin;		// 입원이나 호텔의 chek in 날짜
	private String stay_checkout;		// 입원이나 호텔의 check out 날짜
	private String stay_reason;			// 입원이나 호텔의 사유
	private String camera_num;			// 카메라 번호
	private String camera_existence;	// 카메라 유무
	
	
	// 위 변수의 setter, getter
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
	public String getCamera_num() {
		return camera_num;
	}
	public void setCamera_num(String camera_num) {
		this.camera_num = camera_num;
	}
	public String getCamera_existence() {
		return camera_existence;
	}
	public void setCamera_existence(String camera_existence) {
		this.camera_existence = camera_existence;
	}

	
	
}
