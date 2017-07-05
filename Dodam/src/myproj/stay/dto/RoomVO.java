package myproj.stay.dto;

// stay에서 호텔방 및 입원장의 VO (테이블 이름 : animalroom)
public class RoomVO {

	private String ar_num;				// 입원호텔장 sequence num
	private String ar_name;				// 입원호텔장 이름
	private int ar_price;				// 입원호텔장 가격
	private String ar_type;				// 입원호텔장 분류 (입원이냐 호텔이냐)
	private String ar_color;			// 입원호텔장 색상
	private String ar_top;				// 입원호텔장 위치 top값
	private String ar_left;				// 입원호텔장 위치 left값
	private String camera_num;			// 카메라 번호
	private String camera_existence;	// 카메라 유무
	private String animal_existence;	// 동물이 있는지 없는지
	
	
	// 위 변수의 setter, getter
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
	public String getAnimal_existence() {
		return animal_existence;
	}
	public void setAnimal_existence(String animal_existence) {
		this.animal_existence = animal_existence;
	}
	
	
	
	
	

}
