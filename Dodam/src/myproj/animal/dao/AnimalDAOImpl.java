package myproj.animal.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.animal.dto.AnimalVO;
import myproj.customer.dto.CustomerVO;


@Repository
public class AnimalDAOImpl implements AnimalDAO {


	@Autowired
	SqlSessionTemplate animalSstp;
	
	@Override
	public int animalInsert(AnimalVO animalVO) {
		return animalSstp.insert("animal.infoanimalInsert",animalVO) ;
		
	}

	@Override
	public List<AnimalVO> animalSelect(String phoneNum) {
		return animalSstp.selectList("animal.animalSelect", phoneNum);
	}

	@Override
	//고객정보수정 DB에 업데이트
	public int animaleditInsert(AnimalVO animalVO) {
		return animalSstp.update("animal.animaleditInsert",animalVO);//보내려는 타입이 AnimalVO 
	}
	//고객 정보 삭제 
	@Override
	public int animalDelete(AnimalVO animalVO) {
		return animalSstp.delete("animal.animalDelete",animalVO );
	}

}
