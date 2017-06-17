package myproj.counter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/counter")
public class counterController {

	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/counter/"+url;
	}
}
