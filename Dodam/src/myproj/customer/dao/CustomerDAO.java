package myproj.customer.dao;

import java.util.List;

import myproj.animal.dto.AnimalVO;
import myproj.customer.dto.CustomerVO;

//mapper와 연결해주는 클래스
public interface CustomerDAO {
	/**
	 * 고객 목록 가져오기
	 */
	List<CustomerVO> list();
	
	
	/*클릭한 고객의 동물목록*/
	List<AnimalVO> clicklist(AnimalVO animalVO);
}
