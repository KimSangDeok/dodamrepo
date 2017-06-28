package myproj.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import myproj.main.dao.MainDAOImpl;
import myproj.main.dto.MainVO;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	MainDAOImpl mainDao;

	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/main/"+url+".notile";
	}
	
	//로그인
	@RequestMapping("/login.dodam")
	public ModelAndView login(MainVO vo, HttpSession session){
		String message = "아이디 또는 비밀번호를 다시 확인하세요.";
		int result = 0;

		MainVO reVO = mainDao.memberLogin(vo);
		if( reVO != null ){
			result = 1;
			message = "로그인 성공";
			//session.setAttribute("userName", reVO.getUserName());
			//session.setAttribute("sessionTime", new Date().toString());
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("message", message);
		mv.addObject("result", result);
		mv.setViewName("main/login_ok");

		return mv;
	}

}
