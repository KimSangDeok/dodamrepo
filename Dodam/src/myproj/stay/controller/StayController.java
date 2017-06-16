package myproj.stay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/stay")
public class StayController {

	@RequestMapping("/{url}.dodam")
	public String showList(@PathVariable String url){
		System.out.println("stay를 타자.");
		return "/stay/"+url;
	}
	
	
}
