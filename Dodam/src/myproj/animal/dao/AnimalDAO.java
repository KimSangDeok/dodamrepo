package myproj.animal.dao;

import java.util.List;

import myproj.animal.dto.AnimalVO;

public interface AnimalDAO {

	//동물 정보 DB에 등록하기 
	int animalInsert(AnimalVO animalVO);
	
	//동물 정보 검색해오기 
	List<AnimalVO> animalSelect(String phoneNum);
}
