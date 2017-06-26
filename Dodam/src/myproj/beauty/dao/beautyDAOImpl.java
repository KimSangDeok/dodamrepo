package myproj.beauty.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.beauty.dto.beautyVO;


@Repository
public class beautyDAOImpl implements beautyDAO {

	@Autowired
	SqlSessionTemplate beauty;

	// 미용 옵션 목록 가져오기
	@Override
	public List<beautyVO> searchBeautyOptionList() {
		return beauty.selectList("beauty.beautyOptionSelect");
	}
	
	// 미용 옵션 추가하기
	@Override
	public int registerBeautyOption(beautyVO beautyVO) {
		return beauty.insert("beauty.beautyOptionInsert", beautyVO);
		
	}

}
