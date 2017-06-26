package myproj.beauty.dao;

import java.util.List;

import myproj.beauty.dto.BeautyVO;

// Interface!!
// BeautyVO, BeautyRegister 이 두개와 controller를 연결하는 DAO 
public interface BeautyDAO {

	// 미용 옵션 목록 가져오기
	List<BeautyVO> searchBeautyOptionList();

	// 미용 옵션 추가하기
	int registerBeautyOption(BeautyVO beautyVO);

	
	
	
	
}
