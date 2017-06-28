package myproj.animal.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.animal.dto.AnimalVO;


@Repository
public class AnimalDAOImpl implements AnimalDAO {


	@Autowired
	SqlSessionTemplate animalSstp;
	
	@Override
	public int animalInsert(AnimalVO animalVO) {
		return animalSstp.insert("animal.infoanimalInsert",animalVO) ;
		
	}

}
