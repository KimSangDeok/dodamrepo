package myproj.mpay.dto;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MpayDAOImpl implements MpayDAO{

	@Autowired
	SqlSessionTemplate mpay;

	
	// mpayView.jsp 에서 날짜가 set 되었을 때 그 날의 시간대별 접수고객을 가져온다.
	@Override
	public List<Map<String, Object>> showMpayView1(String selectDay) {
		return mpay.selectList("mpay.howManyAnimalCustomer", selectDay);
	}


	
	
	// mpayView3.jsp 에서 날짜가 set 되었을 때 그 날의 시간대별 매출별 건수를 가져온다.
	// 진료
	@Override
	public List<Map<String, Object>> showMpayView3Jinryo(String selectYY) {
		
		List<Map<String, Object>> result3 = new ArrayList<Map<String, Object>>();
		result3 = mpay.selectList("mpay.mpayView3Jinryo", selectYY);
		
		return result3;
	}


	// mpayView3.jsp 에서 날짜가 set 되었을 때 그 날의 시간대별 매출별 건수를 가져온다.
	// 입원및호텔
	@Override
	public List<Map<String, Object>> showMpayView3Stay(String selectYY) {
		
		List<Map<String, Object>> result3 = new ArrayList<Map<String, Object>>();
		result3 = mpay.selectList("mpay.mpayView3Stay", selectYY);
		
		return result3;
	}

	// mpayView3.jsp 에서 날짜가 set 되었을 때 그 날의 시간대별 매출별 건수를 가져온다.
	// 미용
	@Override
	public List<Map<String, Object>> showMpayView3Beauty(String selectYY) {
		
		List<Map<String, Object>> result3 = new ArrayList<Map<String, Object>>();
		result3 = mpay.selectList("mpay.mpayView3Beauty", selectYY);
		
		return result3;
	}
	
	
}
