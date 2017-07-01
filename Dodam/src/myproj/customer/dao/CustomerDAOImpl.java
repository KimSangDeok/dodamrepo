package myproj.customer.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.animal.dto.AnimalVO;
import myproj.customer.dto.CustomerVO;
import myproj.customer.dto.SmsVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	SqlSessionTemplate customer;
	
	//테이블 검색
	@Override
	public List<CustomerVO> list() {
		
		return customer.selectList("customer.customerList");
	}
	


	@Override
	public List<AnimalVO> clicklist(AnimalVO animalVO) {
		List<AnimalVO> list = customer.selectList("customer.animalList", animalVO);
		return list;
	}


	//고객정보 db에 삽입
	public int cusInsert(CustomerVO customerVO) {
		return customer.insert("customer.infocusInsert",customerVO);
	}

	//고객 핸드폰 번호로 고객 정보 얻어오기
	public CustomerVO cusSelect(String phoneNum) {
		return customer.selectOne("customer.cusSelect", phoneNum);
	}

	
	
	// smsView.jsp에서 동물 전체 검색~~~~
	@Override
	public List<Map<String, String>> showAnimalList() {
		return customer.selectList("customer.animalSMSList");
	}

	// smsView.jsp에서 즐겨찾는 메세지 내용 등록
	public int registerFavoriteSMS(SmsVO smsVO) {
		return customer.insert("customer.registerSMS", smsVO);
	}

	// smsView.jsp에서 즐겨찾기 메세지 전체 검색~~~~
	@Override
	public List<Map<String, String>> showFavoriteList() {
		List<Map<String, String>> list = customer.selectList("customer.favoriteSMSList");
		return list;
	}

	//고객정보수정 DB에 업데이트
	@Override
	public int cuseditInsert(CustomerVO customerVO) {
		return customer.update("customer.cuseditInsert",customerVO);
	}
}
