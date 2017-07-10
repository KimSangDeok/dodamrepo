package myproj.stay.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;

import javax.xml.ws.RequestWrapper;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import myproj.stay.dao.StayDAO;
import myproj.stay.dto.RoomVO;
import myproj.stay.dto.StayVO;

@Controller
@RequestMapping("/stay")
public class StayController {

	@Autowired
	StayDAO stayDAO;
	
	@RequestMapping("/{url}.dodam")
	public String showList(@PathVariable String url){
		return "/stay/"+url;
	}
	
	
	// satyView.jsp가 켜질때, room의 정보, 입원및호텔에 있는 동물 정보를 모두모두 가져와야 해요~~
	@RequestMapping("/stayView.dodam")
	public ModelAndView showStayView(){
		
		// 1. 비어있는 room을 모두 가져와라. 입원 및 호텔 하기 팝업에서 보여주려고.
		List<RoomVO> roomList = stayDAO.selectRoomList();
		
		// 2. 입원해있거나 호텔에 있는 모든 동물의 정보를 가져와야한다. (1번은 안가져와도 될듯)
		List<StayVO> stayList = stayDAO.selectStayList();
				

		
		ModelAndView mv = new ModelAndView();
		mv.addObject("roomList", roomList);
		mv.addObject("stayList", stayList);
		mv.setViewName("/stay/stayView");

		return mv;
	}
	
	
	@RequestMapping("/radioChange.dodam")
	@ResponseBody
	public List<RoomVO> radioChange(String ar_type){
		
		// ar_type에 따른 비어있는 룸을 가져오자.
		List<RoomVO> roomList = stayDAO.radioChangeRoom(ar_type);
		
		return roomList;		
	}
	
	
	
	
	// stayView.jsp에서 입원장호텔장 추가 팝업에서 등록버튼! (입원장이나 호텔방을 생성해 준다.)
	@RequestMapping("/newAnimalRoom.dodam")
	@ResponseBody
	public RoomVO newAnimalRoom(RoomVO roomVO){
		
		System.out.println(roomVO.getAr_name());
		System.out.println(roomVO.getAr_type());
		System.out.println(roomVO.getAr_price());
		System.out.println(roomVO.getAr_color());
		
		
		stayDAO.newAnimalRoom(roomVO);
		return roomVO;
	}
	
	
	// 입원장호텔장 수정 하기 버튼
	@RequestMapping("/setAnimalRoom.dodam")
	@ResponseBody
	public RoomVO setAnimalRoom(RoomVO roomVO){
		
		System.out.println(roomVO.getAr_name());
		System.out.println(roomVO.getAr_type());
		System.out.println(roomVO.getAr_price());
		System.out.println(roomVO.getAr_color());
		
		
		stayDAO.setAnimalRoom(roomVO);
		return roomVO;
	}
	
	
	
	// stayView.jsp에서 '저장'버튼! (입원장 호텔방의 위치를 저장하게 해준다.)
	@RequestMapping(value="/save.dodam", method=RequestMethod.POST)
	@ResponseBody
	public String saveAnimalRoom(@RequestBody String roomDATA){
		
		// String roomDATA의 한글처리, "="를 제외 한 값을 저장.
		String rooms = null;
		
		try {
			// temp로 받았을 때, jason 뒤에 =가 붙음..ㅜㅜ 그래서 임시로 선언하여 replace함
			String temp = URLDecoder.decode(roomDATA, "UTF-8");
			rooms = temp.replace("=", "");

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		// 스트링으로 넘어온 데이터를 jsonObj에 json형식으로 넣는거.
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = null;
		try {
			jsonObj = (JSONObject)jsonParser.parse(rooms);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 각 room에 대한 정보가 배열로 되어있움
		JSONArray roomList = (JSONArray)jsonObj.get("room");
		// 각 room에 대한 정보들이 있는 배열을 통채로 넘겨버리자.
		stayDAO.saveAnimalRooms(roomList);

		return "/stay/stayView.dodam";
	}
	
	
	
	// begin : stay_num을 받아서 퇴원처리한다.
	@RequestMapping("/outStay.dodam")
	public String outStay(String infos){

		String []info = infos.split(" ");
		String ar_num = info[0];
		String stay_num = info[1];
		String animal_num = info[2];

		
		
		// 퇴원 절차는 3단계로 분류!!
		// 1. animalroom에서 stay_num을 null 처리 (방에서 나가라!!)
		stayDAO.animalRoomNull(ar_num);
		
		// 2. hospital_stay에서 stay_checkout을 sysdate로 처리!! (퇴원날짜 update!!!!)
		stayDAO.hospitalStayCheckout(stay_num);
		
		// 3. 입원과 퇴원 사이 몇일인지 불러와라!! days = 퇴원날짜-입원날짜
		String days = stayDAO.calculatedays(stay_num);
		
		// 4. 퇴원하려는 방의 1일당 가격 가져와라.
		int dayPrice = stayDAO.getPrice(ar_num);

		// 입원기간 곱하기 1일당 방의 가격 = totalPrice
		int totalPrice = Integer.parseInt(days)*dayPrice;
		
		// 5. 수납테이블에 가격 정보 입력. (animal_num, stay_num, totalPrice)을 가져가야 한다.
		HashMap<String, Object> payMap = new HashMap<String, Object>();
		payMap.put("animal_num", animal_num);
		payMap.put("stay_num", stay_num);
		payMap.put("total_price", totalPrice);
		stayDAO.goPay(payMap);
		
		return "redirect:stayView.dodam";
	}
	// end : stay_num을 받아서 퇴원처리한다.

	
	// 입원이나 호텔에 등록하자.
	@RequestMapping("/inAnimalStay.dodam")
	public String inAnimalHospitalORHotel(String ar_num, String animal_num, String indays, String stay_reason){
		
		String []days = indays.split("-");
		String stay_checkin = days[0];
		String stay_checkout = days[1];
		
		// 1. hospital_stay 테이블에 입원이나 호텔 서비스 저장.
		StayVO stayVO = new StayVO();
		stayVO.setAnimal_num(animal_num);
		stayVO.setStay_checkin(stay_checkin);
		stayVO.setStay_checkout(stay_checkout);
		stayVO.setStay_reason(stay_reason);
		stayVO.setAr_num(ar_num);
		stayDAO.inAnimalStay(stayVO);

		// 2. animal_room에 지금 그 방에 동물이 있다고 update
		RoomVO roomVO = new RoomVO();
		roomVO.setAr_num(ar_num);
		stayDAO.inAnimalRoom(roomVO);
		
		return "redirect:stayView.dodam";
	}
	
}
