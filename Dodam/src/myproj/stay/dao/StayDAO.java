package myproj.stay.dao;

import myproj.stay.dto.RoomVO;

//Interface!!
//RoomVO와 controller를 연결하는 DAO 
public interface StayDAO {
	
	// 입원장 및 호텔방 추가
	int newAnimalRoom(RoomVO roomVO);

}
