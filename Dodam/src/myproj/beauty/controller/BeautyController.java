package myproj.beauty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/beauty")
public class BeautyController {

	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/beauty/"+url;
	}
}
