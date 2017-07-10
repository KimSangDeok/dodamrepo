package myproj.mpay.dto;

import java.util.Collection;
import java.util.List;
import java.util.Map;

// 관리자 화면의 : 매출관리와 관련된 서비스 인터페이스 입니다.
public interface MpayDAO {
	
	// mpayView.jsp 에서 날짜가 set 되었을 때 그 날의 시간대별 접수고객을 가져온다.
	List<Map<String, Object>> showMpayView1(String selectDay);

	
	// mpayView3.jsp 에서 날짜가 set 되었을 때 그 날의 시간대별 매출별 건수를 가져온다.
	// 진료와 입원및호텔과 뷰티로 구분됨.
	List<Map<String, Object>> showMpayView3Jinryo(String selectDay);
	List<Map<String, Object>> showMpayView3Stay(String selectDay);
	List<Map<String, Object>> showMpayView3Beauty(String selectDay);

}
