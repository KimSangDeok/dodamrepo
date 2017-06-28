package myproj.customer.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import myproj.animal.dao.AnimalDAOImpl;
import myproj.animal.dto.AnimalVO;
import myproj.customer.dao.CustomerDAOImpl;
import myproj.customer.dto.CustomerVO;



@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	CustomerDAOImpl customerDAO;
	
	@Autowired
	AnimalDAOImpl animalDAO;

	
	@RequestMapping("/{url}.dodam")
	public String list(@PathVariable String url){
		return "/customer/"+url;
	}
	


	//전체 고객 검색 
		@RequestMapping("/customerView.dodam")
		public ModelAndView List(){
			
			List<CustomerVO> result = customerDAO.list();
			ModelAndView mv = new ModelAndView();
			mv.addObject("listModel" , result);
			mv.setViewName("/customer/customerView");
			return mv;
			
		}
	//부분 고객 검색 
		@RequestMapping("/infoSearchbyTel.dodam")
		@ResponseBody
		public List<AnimalVO> clickList(AnimalVO animalVO){
			
			List<AnimalVO> result = customerDAO.clicklist(animalVO);
			
			return result;
		}
		
	//고객 정보 등록
		
		@RequestMapping("/infoInsert.dodam")
		public ModelAndView infoInsert(CustomerVO customerVO, AnimalVO animalVO){
			
			
			String message= "고객 정보 등록 실패";
			int customer = customerDAO.cusInsert(customerVO);
			int animal = animalDAO.animalInsert(animalVO);
			
			if( customer >0 && animal>0 ) message = "고객 정보 등록 성공";
			
			ModelAndView mv= new ModelAndView();
			
			List<CustomerVO> result = customerDAO.list();
			mv.addObject("listModel" , result);
			mv.addObject("message",message);
			mv.addObject("customer",customer);
			mv.addObject("animal",animal);
			mv.setViewName("/customer/customerView");
			
			return mv;
			
		}
		
		// smsView.jsp에서 동물 전체 검색~~~~
		@RequestMapping("/smsView.dodam")
		public ModelAndView showSMSView(){
			
			// 전체 동물 검색 (+ 해당하는 동물의 고객명, 고객핸드폰번호도 검색!!)
			List<Map<String, String>> animalList = customerDAO.showAnimalList();
			ModelAndView mv = new ModelAndView();
			mv.addObject("animalList", animalList);
			mv.setViewName("/customer/smsView");
			return mv;
		}
}