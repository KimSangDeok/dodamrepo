package myproj.beauty.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.beauty.dto.BeautyServiceVO;
import myproj.beauty.dto.BeautyVO;


@Repository
public class BeautyDAOImpl implements BeautyDAO {

	@Autowired
	SqlSessionTemplate beauty;

	// 미용 옵션 목록 가져오기
	@Override
	public List<BeautyVO> searchBeautyOptionList() {
		return beauty.selectList("beauty.beautyOptionSelect");
	}
	
	// 미용 옵션 추가하기
	@Override
	public int registerBeautyOption(BeautyVO beautyVO) {
		return beauty.insert("beauty.beautyOptionInsert", beautyVO);
		
	}

	// 오늘의 미용 내역 목록 가져오기
	@Override
	public List<Map<String, String>>  searchBeautyServiceList() {
		return beauty.selectList("beauty.beautyServiceSelect");
		

	}
	
	// datepicker range를 바꾸었을 때, (hide) 이럴 시, 날짜에 해당하는 뷰티내역을 검색
	@Override
	public List<Map<String, String>> changeDateBeautyList(HashMap<String, String> dateMap) {
		return beauty.selectList("beauty.changeDateList", dateMap);
	}

	// 미용 일정을 등록한다. (초기등록)
	@Override
	public int registerBeauty(BeautyServiceVO beautyServiceVO) {
		return beauty.insert("beauty.registerBeauty", beautyServiceVO);
	}

	// 미용을 완료한다.
	@Override
	public void doneBeautyService(BeautyServiceVO beautyServiceVO) {
		// 1. 수납테이블에 미용 완료했으니 가격이랑 등록되게!
		beauty.insert("beauty.registerPay", beautyServiceVO);
		// 2. beautyService에서 완료로 수정
		beauty.update("beauty.doneBeautyService", beautyServiceVO);	
	}

	// 미용코드를 가지고 목록 하나를 가져온다.
	@Override
	public BeautyServiceVO searchBeautyOne(BeautyServiceVO beautyServiceVO) {
		return beauty.selectOne("beauty.beautyOne", beautyServiceVO);
	}

	@Override
	public BeautyVO searchPrice(String option) {
		return beauty.selectOne("beauty.beautyOptionPrice", option);
	}



}
