package myproj.payment.dao;

import java.util.List;
import java.util.Map;

// Interface!!
public interface PaymentDAO {

	// 수납대기 리스트
	List<Map<String, String>> waitinglist();
	
	// 수납목록 리스트
	List<Map<String, String>> btpaylist(int animal_num); // 미용
	List<Map<String, String>> stpaylist(int animal_num); // 입원/호텔
	List<Map<String, String>> trpaylist(int animal_num); // 진료
	
	// 수납대기 삭제
	int listDelete(int animal_num);
	
	// 결제하기
	int paymentOk(int animal_num);

}
