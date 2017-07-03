package myproj.stay.dto;

// stay에서 호텔방 및 입원장의 VO (테이블 이름 : animalroom)
public class RoomVO {

	private String ar_num;		// 입원호텔장 sequence num
	private String ar_name;		// 입원호텔장 이름
	private int ar_price;		// 입원호텔장 가격
	private String ar_type;		// 입원호텔장 분류 (입원이냐 호텔이냐)
	private String ar_color;	// 입원호텔장 색상
	
	// 위 변수의 getter setter
	public String getAr_num() {
		return ar_num;
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
