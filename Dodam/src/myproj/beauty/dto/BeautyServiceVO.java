package myproj.beauty.dto;

// 미용 서비스를 관리하는 VO (테이블 : beauty)
public class BeautyServiceVO {

	static String bty_code;		// 미용 서비스 고유 넘버 (sequence)
	static String per_id;		// 미용 담당자 아이디
	static String btm_type;		// 미용 옵션 (어떤 미용 받는지)
	static String bty_dt;		// 미용 날짜
	static String bty_ox;		// 미용 했는지 여부
	static String animal_num;	// 미용 받는 동물 번호
	
	// 위의 변수의 getter setter
	public static String getBty_code() {
		return bty_code;
	}
	public static void setBty_code(String bty_code) {
		BeautyServiceVO.bty_code = bty_code;
	}
	public static String getPer_id() {
		return per_id;
	}
	public static void setPer_id(String per_id) {
		BeautyServiceVO.per_id = per_id;
	}
	public static String getBtm_type() {
		return btm_type;
	}
	public static void setBtm_type(String btm_type) {
		BeautyServiceVO.btm_type = btm_type;
	}
	public static String getBty_dt() {
		return bty_dt;
	}
	public static void setBty_dt(String bty_dt) {
		BeautyServiceVO.bty_dt = bty_dt;
	}
	public static String getBty_ox() {
		return bty_ox;
	}
	public static void setBty_ox(String bty_ox) {
		BeautyServiceVO.bty_ox = bty_ox;
	}
	public static String getAnimal_num() {
		return animal_num;
	}
	public static void setAnimal_num(String animal_num) {
		BeautyServiceVO.animal_num = animal_num;
	}
	
	
	
	
	
	
	
	
	
}
