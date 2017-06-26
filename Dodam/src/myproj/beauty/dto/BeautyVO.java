package myproj.beauty.dto;

// 미용 옵션을 다루는 VO (테이블 이름 : beauty_management)
public class BeautyVO {
	
	private String btm_type;	// 미용 옵션
	private int btm_price;		// 미용 옵션 별 가격
	
	
	// 위의 변수의 getter setter
	public String getBtm_type() {
		return btm_type;
	}
	public void setBtm_type(String btm_type) {
		this.btm_type = btm_type;
	}
	public int getBtm_price() {
		return btm_price;
	}
	public void setBtm_price(int btm_price) {
		this.btm_price = btm_price;
	}
	
	
	
	
	

}
