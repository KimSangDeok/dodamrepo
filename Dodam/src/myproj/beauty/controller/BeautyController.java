package myproj.beauty.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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

import myproj.beauty.dao.BeautyDAO;
import myproj.beauty.dto.BeautyServiceVO;
import myproj.beauty.dto.BeautyVO;

@Controller
@RequestMapping("/beauty")
public class BeautyController {

	@Autowired
	BeautyDAO beautyDAO;
	
	
	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/beauty/"+url;
	}
	
	
	// 미용 화면을 보자
	@RequestMapping("/beautyView.dodam")
	public ModelAndView showBeautyView(){

		List<BeautyVO> beautyOptionList;
		List<Map<String, String>> beautyServiceList;		// 얘는 resultType을 hashmap으로 받아서 다음과 같이 mapping을 해준다.
		
		// 1. 미용 옵션을 가져온다.
		beautyOptionList = beautyDAO.searchBeautyOptionList();
		
		// 2. 오늘의 미용 내역을 가져온다.
		//beautyServiceList = beautyDAO.searchBeautyServiceList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("beautyOption", beautyOptionList);
		//mv.addObject("beautyService", beautyServiceList);
		mv.setViewName("/beauty/beautyView");
		
		return mv;
	}
	

	// ajax로 미용 옵션을 추가하는 method
	// **** produces는 ajax에서 view로 넘기는 값을 한글 처리 하기 위해! 추가함~~~~
	@RequestMapping(value="/registerBeautyOption.dodam", produces = "application/text; charset=utf8")
	@ResponseBody
	public String registerBeautyOption(BeautyVO beautyVO){
		beautyDAO.registerBeautyOption(beautyVO);
		return beautyVO.getBtm_type();

	}

	
	// datepicker 값이 변경 되었을 때, 자동으로 검색해서 테이블에 뿌려
	@RequestMapping("/changeDate.dodam")
	@ResponseBody
	public List<Map<String, String>> changeDateList(String from_to_date){		// 검색할 날짜 값을 받아옵니다.
		List<Map<String, String>> beautyServiceList;							// 얘는 resultType을 hashmap으로 받아서 다음과 같이 mapping을 해준다.
	
		String []date = from_to_date.split("-");
		
		HashMap<String, String> dateMap = new HashMap<String, String>();
		dateMap.put("from_date", date[0]);
		dateMap.put("to_date", date[1]);

		beautyServiceList = beautyDAO.changeDateBeautyList(dateMap);


		return beautyServiceList;
	}
	
	
	
	@RequestMapping(value="/registerBeauty.dodam", method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, String>> registerBeauty(@RequestBody String registerDATA) {

	
		List<Map<String, String>> beautyRegister= null;

		
		System.out.println("register등록 controll");
		
		String registers = null;
		
		try {
			
			String temp = URLDecoder.decode(registerDATA, "UTF-8");
			System.out.println("temp    "+temp);
			registers = temp.replace("=", "");
			System.out.println("registers      "+registers);
			
			System.out.println();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("1");
		JSONParser jsonParser = new JSONParser();
		//스트링으로 넘어온 데이터를 jsonObj에 json 형식으로 넣는거.
		System.out.println("2");

		JSONObject jsonObj = null;
		try {
			jsonObj = (JSONObject) jsonParser.parse(registers);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		System.out.println("3");
		
		JSONArray typeList = (JSONArray)jsonObj.get("btm_type_list");
		
		System.out.println("4");
		String registerDate = (String)jsonObj.get("bty_dt");
		System.out.println("5");

		String animalNum= (String)jsonObj.get("animal_num");

		String btm_type = "";
		int totalPrice=0;
		for(int i=0; i<typeList.size(); i++){
			btm_type += typeList.get(i)+"/";
			
			// 각 항목의 가격 값을 가져오자.....
			BeautyVO beautyVO = new BeautyVO();
			beautyVO = beautyDAO.searchPrice((String) typeList.get(i));
			System.out.println("price!!!!"+beautyVO.getBtm_price());
			totalPrice += beautyVO.getBtm_price();
			System.out.println(totalPrice);
		}
		
		BeautyServiceVO beautyServiceVO = new BeautyServiceVO();
		beautyServiceVO.setBtm_type(btm_type);
		beautyServiceVO.setBty_ox("예약");
		beautyServiceVO.setAnimal_num(animalNum);
		beautyServiceVO.setBty_dt(registerDate);
		beautyServiceVO.setBty_price(totalPrice);
		
		int result = beautyDAO.registerBeauty(beautyServiceVO);
		
		return beautyRegister;
		
	}
	
	
	// beautyView.jsp에서 미용하기~ 버튼 누르면 beautyCam.jsp로 넘어가라
	@RequestMapping("/beautyCam.dodam")
	public ModelAndView showBeautyCam(BeautyServiceVO beautyServiceVO){
		
		ModelAndView mv = new ModelAndView();
		
		// 분류가 필요함, 그냥 cam을 보는 화면 그리고 미용하기를 통해 들어오는 화면
		
		if(beautyServiceVO.getBty_code()==null){
			// 선택1) 그냥 beautyCam.jsp를 들어갈때,
			
		}else{
			BeautyServiceVO beautyOne = new BeautyServiceVO();
			beautyOne = beautyDAO.searchBeautyOne(beautyServiceVO);


			mv.addObject("bty_code", beautyServiceVO.getBty_code());
			mv.addObject("btm_type", beautyOne.getBtm_type());
			mv.addObject("bty_price", beautyOne.getBty_price());
			mv.addObject("animal_num", beautyOne.getAnimal_num());
		}
		
		mv.setViewName("/beauty/beautyCam");
		return mv;
	}
	
	// beautyCam.jsp에서 미용을 완료 했다고 '완료' 버튼을 눌렀을때, update table을!! (완료라고)
	@RequestMapping("/beautyDone.dodam")
	public ModelAndView beautyDone(BeautyServiceVO beautyServiceVO){
		
		// 1. 미용을 완료했으면, 완료라고 update 해줘야하는데, 여기서 primarykey값인 bty_code를 가져간다. 2. 수납테이블에 insert
		beautyDAO.doneBeautyService(beautyServiceVO);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/beauty/beautyView");
		
		return mv;
		
	}
}
