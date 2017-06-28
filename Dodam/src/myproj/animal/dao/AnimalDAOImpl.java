package myproj.animal.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.animal.dto.AnimalVO;


@Repository
public class AnimalDAOImpl implements AnimalDAO {


	@Autowired
	SqlSessionTemplate animal;
	
	@Override
	public int animalInsert(AnimalVO animalVO) {
		return animal.insert("animal.infoanimalInsert",animalVO) ;
		
	}

}
