package myproj.stay.dao;

import java.util.HashMap;
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

	// 1. animalroom에서 stay_num을 null 처리
	void animalRoomNull(String ar_num);

	// 2. hospital_stay에서 stay_checkout을 sysdate로 처리!! (퇴원날짜 update!!!!)
	void hospitalStayCheckout(String stay_num);

	// 3. 입원과 퇴원 사이 몇일인지 불러와라!!
	String calculatedays(String stay_num);

	// 4. 퇴원하려는 방의 1일당 가격 가져와라.
	int getPrice(String ar_num);

	// 5. 수납테이블에 가격 정보 입력.
	void goPay(HashMap<String, Object> payMap);

	// ar_type에 따른 비어있는 룸을 가져오자.
	List<RoomVO> radioChangeRoom(String ar_type);

	// 입원이나 호텔에 등록하자.
	void inAnimalStay(StayVO stayVO);
	void inAnimalRoom(RoomVO roomVO);


}
