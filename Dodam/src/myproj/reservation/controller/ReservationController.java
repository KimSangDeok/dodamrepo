package myproj.reservation.controller;

import java.util.Date;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import myproj.main.dao.MainDAOImpl;
import myproj.main.dto.MainVO;
import myproj.reservation.dao.ReservationDAOImpl;
import myproj.reservation.dto.ReservationVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	ReservationDAOImpl reservDAO;
	@Autowired
	MainDAOImpl mainDAO;
	
	
	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/reservation/"+url;
	}
	//예약 DB등록
	@RequestMapping("/reservInsert.dodam")
	public String reservInsert(ReservationVO reservationVO){
		int reservation = reservDAO.reservinsert(reservationVO);
		
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("reservModel", reservation);
//		mv.setViewName("/reservation/book");
		return "redirect:book.dodam";
	}
	//더블클릭하면 그 날짜에 예약하기로 넘어가는 부분changepage.dodam
			@RequestMapping("/changepage.dodam")
			public String changepage(String date){			
//				ModelAndView mv = new ModelAndView();
//				mv.addObject("date",date); 
//				mv.setViewName("/reservation/book");
				
				return "redirect:book.dodam";
			}
	
	
	
//	예약스케줄에서 내역뿌려주기
	@RequestMapping("/book.dodam")
	public ModelAndView date(String date){
		
		System.out.println("date : "+date);
		ModelAndView mv = new ModelAndView();
		List<MainVO> doctor = mainDAO.doctorSelect();
		List<ReservationVO> result = reservDAO.bringlist(date);
		
		System.out.println("result 갯수"+result.size());
		
		mv.addObject("result",result);
		mv.addObject("perName",doctor);
		mv.addObject("clickdate",date);
		mv.setViewName("/reservation/book");
		
		return mv;
	}
	
}
