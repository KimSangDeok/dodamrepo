package myproj.customer.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
		//동물 추가하는 코딩
	
		@RequestMapping("/infoaddInsert.dodam")
		public ModelAndView infoaddInsert(AnimalVO animalVO){
			int animal = animalDAO.animalInsert(animalVO);
			
			ModelAndView mv= new ModelAndView();
			
			List<CustomerVO> result = customerDAO.list();
			mv.addObject("listModel" , result);
			mv.addObject("animal",animal);
			mv.setViewName("/customer/customerView");
			
			return mv;
		}

		//고객과 동물 수정하는 코딩
		@RequestMapping("/editCustomer.dodam")
		public ModelAndView editView(String phoneNum){
			System.out.println("phoneNum :"+phoneNum);
			
			ModelAndView mv = new ModelAndView();
			CustomerVO cvo = customerDAO.cusSelect(phoneNum);
			List<AnimalVO> avo = animalDAO.animalSelect(phoneNum);
			mv.addObject("cusInfo",cvo); //cusInfo이름으로 view에다가 정보를 뿌려주면 됨
			mv.addObject("aniInfo",avo);
			for( AnimalVO v : avo){
				System.out.println(v.getAnimal_num());
			}
			mv.setViewName("/customer/editCustomer");
			
			return mv;
			
		}
		//고객의 정보 수정한 것을 DB에 삽입
			@RequestMapping("/editInfoInsert.dodam")
			@ResponseBody //ajax를 쓰기위한 responseBody
			public String editinfoInsert(MultipartHttpServletRequest multi, CustomerVO customerVO, AnimalVO animalVO){
				//MultipartHttpServletRequest : 파일 업로드 할때 ajax를 쓰려면 필요 
//				System.out.println("멀티 텔이당 : "+multi.getParameter("cus_tel"));
//				System.out.println("vo텔에 담겼나 >>"+customerVO.getCus_tel());

				int customer = customerDAO.cuseditInsert(customerVO);
				String msg="고객수정실패";
				if(customer>0) msg="고객수정 완료";
				
				return msg;
				
			}
		
		//동물의 정보를 수정한 것을 DB에 삽입
			@RequestMapping("/editanimal.dodam")
			@ResponseBody
			public String editanimal(MultipartHttpServletRequest multi, AnimalVO animalVO){
				
//					System.out.println("멀티 xtye이당 : "+multi.getParameter("animal_type"));
//					System.out.println("getAnimal_type >>"+animalVO.getAnimal_type());
				
				int animal = animalDAO.animaleditInsert(animalVO);
				String msg="동물수정실패";
				if(animal>0) msg="동물수정 완료";
				
				return msg;
					
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