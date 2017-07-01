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
		
		System.out.println("search가 ~~~~");
		return beauty.selectList("beauty.beautyServiceSelect");
		

	}
	
	// datepicker range를 바꾸었을 때, (hide) 이럴 시, 날짜에 해당하는 뷰티내역을 검색
	@Override
	public List<Map<String, String>> changeDateBeautyList(HashMap<String, String> dateMap) {
		
		System.out.println("////"+dateMap.get("from_date"));
		System.out.println("////"+dateMap.get("to_date"));
		
		System.out.println("datechange가 ~~~~");
		
		return beauty.selectList("beauty.changeDateList", dateMap);
	}

}
