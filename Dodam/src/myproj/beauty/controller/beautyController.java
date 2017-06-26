package myproj.beauty.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.interceptor.BeanFactoryTransactionAttributeSourceAdvisor;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import myproj.beauty.dao.beautyDAO;
import myproj.beauty.dto.beautyVO;

@Controller
@RequestMapping("/beauty")
public class beautyController {

	@Autowired
	beautyDAO beautyDAO;
	
	
	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/beauty/"+url;
	}
	
	
	// 미용 화면을 보자
	@RequestMapping("/beautyView.dodam")
	public ModelAndView showBeautyView(){

		List<beautyVO> beautyOptionList;
		
		// 1. 미용 옵션을 가져온다.
		beautyOptionList = beautyDAO.searchBeautyOptionList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("beautyOption", beautyOptionList);
		mv.setViewName("/beauty/beautyView");
		
		return mv;
	}
	
	
	@RequestMapping("/registerBeautyOption.dodam")
	public String registerBeautyOption(beautyVO beautyVO){
		// ajax로 미용 옵션을 추가하는 method
		
		int result = beautyDAO.registerBeautyOption(beautyVO);
		
		return beautyVO.getBtm_type();
		
		
		
	}

	
	
	
	
}
