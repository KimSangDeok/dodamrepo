package myproj.stay.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
	
	
	// stayView.jsp에서 입원장호텔장 추가 팝업에서 등록버튼! (입원장이나 호텔방을 생성해 준다.)
	@RequestMapping("/newAnimalRoom.dodam")
	@ResponseBody
	public RoomVO newAnimalRoom(RoomVO roomVO){
		stayDAO.newAnimalRoom(roomVO);
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
			System.out.println(rooms);
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
}
