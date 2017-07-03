package myproj.jinryo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import myproj.jinryo.service.JinryoService;

@Controller
@RequestMapping({"/jinryo","/jinryo/treeMenu"})
public class JinryoController {
	
	@Autowired
	JinryoService jinryoService;

	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/jinryo/"+url;
	}
	
	
	/**
	 * @param type 차트생성의 팝업창 종류
	 * @return ModelAndView (사용될 메뉴들의 리스트)
	 * 차트생성의 TreeMenu가 사용되는 팝업창에서 사용
	 */
	@RequestMapping("/monjin.dodam")
	public ModelAndView selectTreeMenu(String type){
		
		ModelAndView mv = new ModelAndView();
		
		if(type.equals("monjinPopup")){
			
			Map monjinMap = jinryoService.selectMonjin();
			mv.setViewName("/jinryo/treeMenu/monjin.treeTile");
			mv.addObject("bigMenus", monjinMap.get("bigMenus"));
			mv.addObject("midMenus", monjinMap.get("midMenus"));
			return mv;
		}else if(type.equals("")){
			
		}
		return mv;
	}
	
	/**
	 * @param bigMenu 대메뉴값
	 * @param midMenu 중메뉴값
	 * @return List<HashMap> 소메뉴의 질문들
	 * 대메뉴와 중메뉴에 해당하는 소메뉴 질문리스트
	 */
	@RequestMapping("/smMonjin.dodam")
	@ResponseBody
	public List<HashMap> smMonjin(String bigMenu, String midMenu){
		
		List<HashMap> smData = jinryoService.selectSmMonjin(bigMenu, midMenu);
		return smData;
	}
	
	/**
	 * @param animal_num 동물의 번호
	 * @return List<HashMap> 주인 정보, 진료내역정보
	 * 동물의 번호로 주인의 정보와 진료내역
	 */
	@RequestMapping("/selectByAnimalNum.dodam")
	@ResponseBody
	public List<HashMap> selectByAnimalNum(String animal_num){
		
		List<HashMap> selectHistoryList = jinryoService.selectByAnimalNum(animal_num);
		return selectHistoryList;
	}
}
