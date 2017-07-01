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
	
	@RequestMapping("/monjin.dodam")
	public ModelAndView selectTreeMenu( String type){
		
		ModelAndView mv = new ModelAndView();
		
		if(type.equals("monjinPopup")){
			
			mv.setViewName("/jinryo/treeMenu/monjin.treeTile");
			mv.addObject("bigMenus", jinryoService.selectMonjin().get("bigMenus"));
			mv.addObject("midMenus", jinryoService.selectMonjin().get("midMenus"));
			return mv;
		}else if(type.equals("")){
			
		}
		return mv;
		
	}
	
	@RequestMapping("/selectByAnimalNum.dodam")
	@ResponseBody
	public List<HashMap> selectByAnimalNum(String animal_num){
		
		List<HashMap> selectHistoryList = jinryoService.selectByAnimalNum(animal_num);
		return selectHistoryList;
	}
	
	@RequestMapping("/selectMonjin.dodam")
	@ResponseBody
	public Map selectMonjin(){

		Map selectMonjin = jinryoService.selectMonjin();
		return selectMonjin;
	}
}
