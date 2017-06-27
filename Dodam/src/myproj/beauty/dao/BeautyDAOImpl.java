package myproj.beauty.dao;

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

}
