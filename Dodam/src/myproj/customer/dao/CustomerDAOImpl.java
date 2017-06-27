package myproj.customer.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.animal.dto.AnimalVO;
import myproj.customer.dto.CustomerVO;

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

}
