package myproj.goods.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@RequestMapping("/{url}.dodam")
	public String showList(@PathVariable String url){
		System.out.println("페이지 전환!!!");
		return "/goods/"+url;
	}
}
