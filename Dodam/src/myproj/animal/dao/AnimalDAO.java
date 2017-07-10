package myproj.animal.dao;

import java.util.List;

import myproj.animal.dto.AnimalVO;
import myproj.customer.dto.CustomerVO;

public interface AnimalDAO {

	//동물 정보 DB에 등록하기 
	int animalInsert(AnimalVO animalVO);
	
	//동물 정보 검색해오기 
	List<AnimalVO> animalSelect(String phoneNum);

	//동물 정보 수정 업데이트
	int animaleditInsert(AnimalVO animalVO);

	//동물 정보 삭제 
	int animalDelete(AnimalVO animalVO);
}
