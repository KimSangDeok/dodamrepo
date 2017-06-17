package myproj.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation")
public class reservationController {

	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/reservation/"+url;
	}
	
}
