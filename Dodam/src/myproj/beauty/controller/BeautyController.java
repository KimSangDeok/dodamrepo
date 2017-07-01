package myproj.beauty.controller;

import java.lang.annotation.Repeatable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
		
		System.out.println(date[0]);
		System.out.println(date[1]);
		
		HashMap<String, String> dateMap = new HashMap<String, String>();
		dateMap.put("from_date", date[0]);
		dateMap.put("to_date", date[1]);

		System.out.println("MMMMMMMM"+from_to_date);
//		System.out.println("MMMMMMMM"+dateMap.get("from_date"));
//		System.out.println("MMMMMMMM"+dateMap.get("to_date"));
		
		
		
		beautyServiceList = beautyDAO.changeDateBeautyList(dateMap);
		System.out.println(beautyServiceList.size()	);
		System.out.println(beautyServiceList);
		return beautyServiceList;
	}
}
