package myproj.stay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import myproj.stay.dao.StayDAO;
import myproj.stay.dto.RoomVO;

@Controller
@RequestMapping("/stay")
public class StayController {

	@Autowired
	StayDAO stayDAO;
	   
	@RequestMapping("/{url}.dodam")
	public String showList(@PathVariable String url){
		return "/stay/"+url;
	}
	
	// stayView.jsp에서 입원장호텔장 추가 팝업에서 등록버튼! (입원장이나 호텔방을 생성해 준다.)
	@RequestMapping("/newAnimalRoom.dodam")
	@ResponseBody
	public RoomVO newAnimalRoom(RoomVO roomVO){
		stayDAO.newAnimalRoom(roomVO);
		
		
		return roomVO;
	}
	
}
