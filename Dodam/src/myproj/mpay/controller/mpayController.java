package myproj.mpay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mpay")
public class mpayController {

	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/mpay/"+url;
	}
}
