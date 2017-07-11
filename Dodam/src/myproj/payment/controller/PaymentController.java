package myproj.payment.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import myproj.payment.dao.PaymentDAO;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	PaymentDAO paymentDAO;

	@RequestMapping("/{url}.dodam")
	public String showList(@PathVariable String url){
		return "/payment/"+url;
	}

	// 수납대기 리스트
	@RequestMapping(value={"/paymentView.dodam"})
	@ResponseBody
	public ModelAndView waitinglist(){
		List<Map<String, String>> list = paymentDAO.waitinglist();
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("waitinglist",list); // 수납대기
		mv.setViewName("/payment/paymentView");
		return mv;
	}
	
	// 수납목록 리스트(ajax)
	@RequestMapping(value={"/selectPay.dodam"})
	@ResponseBody
	public ModelAndView selectPay(int animal_num){
		List<Map<String, String>> btpaylist = paymentDAO.btpaylist(animal_num); // 미용 리스트
		List<Map<String, String>> stpaylist = paymentDAO.stpaylist(animal_num); // 입원/호텔 리스트
		List<Map<String, String>> trpaylist = paymentDAO.trpaylist(animal_num); // 진료 리스트
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("btpaylist",btpaylist);
		mv.addObject("stpaylist",stpaylist);
		mv.addObject("trpaylist",trpaylist);
		mv.setViewName("jsonView"); // jsonView형태로
		return mv;
	}
	

	// 수납대기 삭제
	@RequestMapping("/listdel.dodam")
	public ModelAndView listdel(int animal_num){
		String state = "no";
		String message = "삭제실패";
		ModelAndView mv = new ModelAndView();
		int result = paymentDAO.listDelete(animal_num);

		if( result > 0 ){
			state = "yes";
			message = "삭제완료";
		}
		
		mv.addObject("message", message);
		mv.addObject("state", state);
		mv.setViewName("/payment/paydel_ok");
		return mv;
	}
	
	// 결제하기
	@RequestMapping("/payment.dodam")
	public ModelAndView payment(int animal_num){
		String state = "no";
		String message = "결제실패";
		ModelAndView mv = new ModelAndView();
		int result = paymentDAO.paymentOk(animal_num);
		
		if( result > 0 ){
			state = "yes";
			message = "결제완료";
		}

		mv.addObject("state", state);
		mv.addObject("message", message);
		mv.setViewName("/payment/payment_ok");
		return mv;
	}

}
