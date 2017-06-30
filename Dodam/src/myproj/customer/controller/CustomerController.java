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
import myproj.customer.dto.SmsVO;



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
			
			// 1. 전체 동물 검색 (+ 해당하는 동물의 고객명, 고객핸드폰번호도 검색!!)
			List<Map<String, String>> animalList = customerDAO.showAnimalList();
			
			// 2. 전체 favorite list, 즉 sms 테이블의 즐겨찾기 내역 가져오기
			List<Map<String, String>> favoriteList = customerDAO.showFavoriteList();

			
			
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("animalList", animalList);
			mv.addObject("favoriteList", favoriteList);
			mv.setViewName("/customer/smsView");
			return mv;
		}
		
		// smsView.jsp에서 즐겨찾기 메세지 등록
		@RequestMapping("/favoriteSMS.dodam")
		@ResponseBody
		public List<Map<String, String>> RegisterFavoriteSMS(SmsVO smsVO){
			
			int result = customerDAO.registerFavoriteSMS(smsVO);
			
			List<Map<String, String>> favoriteList = null;
			if(result==1){	// 등록에 성공했다면, 다시 favoriteList 전체를 불러서 return해 주자.
				favoriteList = customerDAO.showFavoriteList();				
			}
			
			return favoriteList;
		}
}