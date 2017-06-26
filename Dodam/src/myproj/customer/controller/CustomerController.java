package myproj.customer.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/customer")
public class CustomerController {

	@RequestMapping("/{url}.dodam")
	public String showList(@PathVariable String url){
		return "/customer/"+url;
	}
	
	
}
