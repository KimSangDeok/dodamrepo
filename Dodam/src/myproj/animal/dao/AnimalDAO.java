package myproj.animal.dao;

import myproj.animal.dto.AnimalVO;

public interface AnimalDAO {

	//동물 정보 DB에 등록하기 
	int animalInsert(AnimalVO animalVO);
}
