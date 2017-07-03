package myproj.stay.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.stay.dto.RoomVO;

@Repository
public class StayDAOImpl implements StayDAO {

	@Autowired
	SqlSessionTemplate stay;

	
	// 입원장 및 호텔방 추가
	@Override
	public int newAnimalRoom(RoomVO roomVO) {
		return stay.insert("stay.newAnimalRoom", roomVO);
	}

	
	
	
}
