package myproj.jinryo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import myproj.jinryo.service.JinryoService;

@Controller
@RequestMapping("/jinryo")
public class JinryoController {
	
	@Autowired
	JinryoService jinryoService;

	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/jinryo/"+url;
	}
	
	@RequestMapping("/monjinType.dodam")
	public String monjinType(){
		return "/jinryo/monjinTile.monjinTile";
	}
	
	
	@RequestMapping("/selectByAnimalNum.dodam")
	@ResponseBody
	public List<HashMap> selectByAnimalNum(String animal_num){
		
		List<HashMap> selectHistoryList = jinryoService.selectByAnimalNum(animal_num);
		return selectHistoryList;
	}
}
