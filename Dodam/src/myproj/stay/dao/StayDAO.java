package myproj.stay.dao;

import java.util.List;

import org.json.simple.JSONArray;

import myproj.stay.dto.RoomVO;
import myproj.stay.dto.StayVO;

//Interface!!
//RoomVO와 controller를 연결하는 DAO 
public interface StayDAO {
	
	// 비어있는 입원장 및 호텔방 불러오기
	List<RoomVO> selectRoomList();

	// 입원장 및 호텔방 추가
	int newAnimalRoom(RoomVO roomVO);

	// 일단 update할 roomList를 통채로 가져가;
	void saveAnimalRooms(JSONArray roomList);

	// 입원 서비스 통채로가져오기
	List<StayVO> selectStayList();


}
