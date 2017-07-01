package myproj.customer.dao;

import java.util.List;
import java.util.Map;

import myproj.animal.dto.AnimalVO;
import myproj.customer.dto.CustomerVO;
import myproj.customer.dto.SmsVO;

//mapper와 연결해주는 클래스
public interface CustomerDAO {
	/**
	 * 고객 목록 가져오기
	 */
	List<CustomerVO> list();
	
	
	/*클릭한 고객의 동물목록*/
	List<AnimalVO> clicklist(AnimalVO animalVO);
	
	//고객 정보 DB에 등록하기 
	int cusInsert(CustomerVO customerVO);
	
	//고객 정보 수정 업데이트
	int cuseditInsert(CustomerVO customerVO);
		
	// smsView.jsp에서 동물 전체 검색~~~~
	List<Map<String, String>> showAnimalList();
	
	// smsView.jsp에서 즐겨찾는 메세지 내용 등록
	int registerFavoriteSMS(SmsVO smsVO);
	
	// smsView.jsp에서 즐겨찾기 메세지 전체 검색~~~~
	List<Map<String, String>> showFavoriteList();

	
}
