package myproj.counter.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import myproj.main.dao.MainDAOImpl;
import myproj.main.dto.MainVO;
import myproj.reservation.dao.ReservationDAO;
import myproj.reservation.dto.ReservationVO;

@Controller
@RequestMapping("/counter")
public class CounterController {

	@Autowired
	ReservationDAO reservationDAO;

	@Autowired
	MainDAOImpl mainDAO;
	
	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/counter/"+url;
	}
	
	@RequestMapping("/counterView.dodam")
	public ModelAndView counterlist(){
		System.out.println("왱");
//		System.out.println("세션 들어온놈"+session.getAttribute("animalnum"));
		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy.MM.dd", Locale.KOREA );
		Date td = new Date();
		String today = sdf.format(td);
		System.out.println(today);
		List<MainVO> doctor = mainDAO.doctorSelect();
		List<ReservationVO> counterlist = reservationDAO.counterlist(today);
		ModelAndView mv = new ModelAndView();
		System.out.println("싸이즈"+counterlist.size());
		mv.addObject("counterlist",counterlist);
		mv.addObject("perName", doctor);
		mv.setViewName("/counter/counterView");

		return mv;
	}
	
	@RequestMapping("/counterInsert.dodam")
	public String counterInsert(ReservationVO reservationVO){
		
		reservationDAO.counterInsert(reservationVO);
		
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/counter/counterView");

		return "redirect:/counter/counterView.dodam";
	}
	
	
}
