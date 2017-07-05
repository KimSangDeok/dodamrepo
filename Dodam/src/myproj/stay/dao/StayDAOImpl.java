package myproj.stay.dao;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.stay.dto.RoomVO;
import myproj.stay.dto.StayVO;

@Repository
public class StayDAOImpl implements StayDAO {

	@Autowired
	SqlSessionTemplate stay;

	
	// 입원장 및 호텔방 추가
	@Override
	public int newAnimalRoom(RoomVO roomVO) {
		return stay.insert("stay.newAnimalRoom", roomVO);
	}

	// 비어있는 입원장 불러오기
	@Override
	public List<RoomVO> selectRoomList() {
		return stay.selectList("stay.emptyHospitalRoomList");
	}
	
	// 비어있는 호텔장 불러오기
	

	// 일단 update할 roomList를 통채로 가져가
	// 여기서 각 room으로 분류해서 size 만큼 update 때리자.
	@Override
	public void saveAnimalRooms(JSONArray roomList) {
		
		// 배열로 받은 room의 갯수만큼 update! for문을 돌린다.
		for(int i=0; i<roomList.size(); i++){
			//System.out.println("각 개별 룸의 정보를 get으로 꺼냄"+roomList.get(i));
			
			// 배열로 받은 room의 정보들을 하나씩 꺼내서 JSONObject형으로 변환.
			// WHY?? 각각의 ar num, left, top을 또 꺼내오려고~
			JSONObject roomObject = (JSONObject) roomList.get(i);
			
			
			System.out.println("++"+roomObject.get("ar_num"));
			System.out.println("++"+roomObject.get("ar_left"));
			System.out.println("++"+roomObject.get("ar_top"));			
			
			
			// 올 갖고왔움!! 자, 이걸 roomList의 갯수만큼! 즉 room 갯수만큼 update 해줘야 합니다.	
			RoomVO roomVO = new RoomVO();
			roomVO.setAr_num(String.valueOf(roomObject.get("ar_num")));
			roomVO.setAr_left(String.valueOf(roomObject.get("ar_left")));
			roomVO.setAr_top(String.valueOf(roomObject.get("ar_top")));
			
			stay.update("stay.updateAnimalRoom", roomVO);
		}
		
	}

	// 입원 서비스 통채로가져오기
	@Override
	public List<StayVO> selectStayList() {
		// animalRoom 테이블과 stay 테이블을 join하여 가져오자.
		// 일단, 모든 animalRoom을 다 가져오고, 만약 여기에 머무는 동물이 있다면 join해서 가져오므로
		// left join을 사용하자!!
		return stay.selectList("stay.selectRoomAndServiceAll");
	}

	
	
	// 1. animalroom에서 stay_num을 null 처리
	@Override
	public void animalRoomNull(String ar_num) {
		stay.update("stay.animalRoomNull", ar_num);
	}

	// 2. hospital_stay에서 stay_checkout을 sysdate로 처리!! (퇴원날짜 update!!!!)
	@Override
	public void hospitalStayCheckout(String stay_num) {
		stay.update("stay.outCheckout", stay_num);
		
	}

	// 3. 입원과 퇴원 사이 몇일인지 불러와라!!
	@Override
	public String calculatedays(String stay_num) {
		return stay.selectOne("stay.calculateDays", stay_num);
	}

	// 4. 퇴원하려는 방의 1일당 가격 가져와라.
	@Override
	public int getPrice(String ar_num) {
		return stay.selectOne("stay.getAnimalRoomPrice", ar_num);
	}

	// 5. 수납테이블에 가격 정보 입력.
	@Override
	public void goPay(HashMap<String, Object> payMap) {
		stay.insert("stay.goPay", payMap);
	}

	// ar_type에 따른 비어있는 룸을 가져오자.
	@Override
	public List<RoomVO> radioChangeRoom(String ar_type) {
		System.out.println("ar_type은??"+ar_type);
		return stay.selectList("stay.radioChangeRoom", ar_type);
	}

	// 입원이나 호텔에 등록하자.
	@Override
	public void inAnimalStay(StayVO stayVO) {
		stay.insert("stay.inAnimalStay", stayVO);
	}
	
	// animal_room에 지금 그 방에 동물이 있다고 update
	@Override
	public void inAnimalRoom(RoomVO roomVO) {
		stay.update("stay.inAnimalRoom", roomVO);
		
	}

	
	
	
}
