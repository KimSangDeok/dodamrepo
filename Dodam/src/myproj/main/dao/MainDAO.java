package myproj.main.dao;

import java.util.List;

import myproj.main.dto.MainVO;

// Interface!!
public interface MainDAO {

	// 로그인 확인 기능 구현
	MainVO memberLogin(MainVO vo);
	
	// id 중복체트 기능 구현
	MainVO idCheck( MainVO vo );
	
	// 회원가입기능 구현
	int memberInsert(MainVO vo);
	
	//의사 이름 검색 기능 구현
	public List<MainVO> doctorSelect();
}
