package myproj.stay.dto;

// stay에서 호텔방 및 입원장의 VO (테이블 이름 : animalroom)
public class RoomVO {

	private String ar_num;		// 입원호텔장 sequence num
	private String ar_name;		// 입원호텔장 이름
	private int ar_price;		// 입원호텔장 가격
	private String ar_type;		// 입원호텔장 분류 (입원이냐 호텔이냐)
	private String ar_color;	// 입원호텔장 색상
	private String ar_top;		// 입원호텔장 위치 top값
	private String ar_left;		// 입원호텔장 위치 left값
	private String stay_num;		// 입원 및 호텔 서비스 번호 (stay 테이블의 stay_num 참조)
	
	
	public String getStay_num() {
		return stay_num;
	}
	public void setStay_num(String stay_num) {
		this.stay_num = stay_num;
	}
	// 위 변수의 getter setter
	public String getAr_num() {
		return ar_num;
	}
	public String getAr_top() {
		return ar_top;
	}
	public void setAr_top(String ar_top) {
		this.ar_top = ar_top;
	}
	public String getAr_left() {
		return ar_left;
	}
	public void setAr_left(String ar_left) {
		this.ar_left = ar_left;
	}
	public void setAr_num(String ar_num) {
		this.ar_num = ar_num;
	}
	public String getAr_name() {
		return ar_name;
	}
	public void setAr_name(String ar_name) {
		this.ar_name = ar_name;
	}
	public int getAr_price() {
		return ar_price;
	}
	public void setAr_price(int ar_price) {
		this.ar_price = ar_price;
	}
	public String getAr_type() {
		return ar_type;
	}
	public void setAr_type(String ar_type) {
		this.ar_type = ar_type;
	}
	public String getAr_color() {
		return ar_color;
	}
	public void setAr_color(String ar_color) {
		this.ar_color = ar_color;
	}
	

	
}
