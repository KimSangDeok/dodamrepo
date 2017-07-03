package myproj.beauty.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import myproj.beauty.dto.BeautyServiceVO;
import myproj.beauty.dto.BeautyVO;

// Interface!!
// BeautyVO, BeautyRegister 이 두개와 controller를 연결하는 DAO 
public interface BeautyDAO {

	// 미용 옵션 목록 가져오기
	List<BeautyVO> searchBeautyOptionList();

	// 미용 옵션 추가하기
	int registerBeautyOption(BeautyVO beautyVO);

	// 오늘의 미용 내역 목록 가져오기
	List<Map<String, String>>  searchBeautyServiceList();

	// datepicker range를 바꾸었을 때, (hide) 이럴 시, 날짜에 해당하는 뷰티내역을 검색
	List<Map<String, String>> changeDateBeautyList(HashMap<String, String> dateMap);

	// 미용 일정을 등록한다. (초기등록)
	int registerBeauty(BeautyServiceVO beautyServiceVO);

	// 미용을 완료한다.
	void doneBeautyService(BeautyServiceVO beautyServiceVO);

	// 미용코드를 가지고 목록 하나를 가져온다.
	BeautyServiceVO searchBeautyOne(BeautyServiceVO beautyServiceVO);

	// 각 미용 코드의 가격 값을 가져온다.
	BeautyVO searchPrice(String option);

	
	
	
	
}
