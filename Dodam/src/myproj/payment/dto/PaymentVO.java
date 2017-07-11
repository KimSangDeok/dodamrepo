package myproj.payment.dto;

public class PaymentVO {
	String pay_num;
	String animal_num;
	String jryo_num;
	String stay_num;
	String bty_code;
	int pay_price;
	String pay_ox;
	String pay_regdate;
	
	
	public String getPay_num() {
		return pay_num;
	}
	public void setPay_num(String pay_num) {
		this.pay_num = pay_num;
	}
	public String getAnimal_num() {
		return animal_num;
	}
	public void setAnimal_num(String animal_num) {
		this.animal_num = animal_num;
	}
	public String getJryo_num() {
		return jryo_num;
	}
	public void setJryo_num(String jryo_num) {
		this.jryo_num = jryo_num;
	}
	public String getStay_num() {
		return stay_num;
	}
	public void setStay_num(String stay_num) {
		this.stay_num = stay_num;
	}
	public String getBty_code() {
		return bty_code;
	}
	public void setBty_code(String bty_code) {
		this.bty_code = bty_code;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getPay_ox() {
		return pay_ox;
	}
	public void setPay_ox(String pay_ox) {
		this.pay_ox = pay_ox;
	}
	public String getPay_regdate() {
		return pay_regdate;
	}
	public void setPay_regdate(String pay_regdate) {
		this.pay_regdate = pay_regdate;
	}
}
