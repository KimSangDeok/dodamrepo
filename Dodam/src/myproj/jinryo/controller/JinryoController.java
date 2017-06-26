package myproj.jinryo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jinryo")
public class JinryoController {

	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/jinryo/"+url;
	}
	
	@RequestMapping("/monjinType.dodam")
	public String monjinType(){
		return "/jinryo/monjinTile.monjinTile";
	}
}
