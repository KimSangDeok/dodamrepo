package myproj.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment")
public class paymentController {

	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/payment/"+url;
	}
	
}
