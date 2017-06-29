package myproj.customer.dto;

public class SmsVO {
	
	// 즐겨찾기로 저장 할 메세지내역 (테이블 : SMS)
	
	static String message_name;			// 즐겨찾기 명
	static String message_content;		// 즐겨찾기 해당 내용
	

	// 위 변수의 getter, setter
	public static String getMessage_name() {
		return message_name;
	}
	public static void setMessage_name(String message_name) {
		SmsVO.message_name = message_name;
	}
	public static String getMessage_content() {
		return message_content;
	}
	public static void setMessage_content(String message_content) {
		SmsVO.message_content = message_content;
	}
	
	
	
	
	
	
	
}
