package myproj.customer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import myproj.animal.dto.AnimalVO;
import myproj.customer.dao.CustomerDAOImpl;
import myproj.customer.dto.CustomerVO;



@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	CustomerDAOImpl customerDAO;
	
//	@Autowired
//	AnimalDAOImpl animalDAO;
	
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
			
			System.out.println(">>검색하려는 고객 핸드폰"+animalVO.getCus_tel());
			
			List<AnimalVO> result = customerDAO.clicklist(animalVO);
			System.out.println("resultssss :"+result.get(0).getAnimal_name());
			return result;
		}
		
		
		
}