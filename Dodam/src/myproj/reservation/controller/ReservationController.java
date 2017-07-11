package myproj.reservation.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import myproj.main.dao.MainDAOImpl;
import myproj.main.dto.MainVO;
import myproj.reservation.dao.ReservationDAO;
import myproj.reservation.dto.ReservationVO;

	@Controller
	@RequestMapping("/reservation")
	public class ReservationController {

	@Autowired
	ReservationDAO reservationDAO;
	
	@Autowired
	MainDAOImpl mainDAO;
	
	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/reservation/"+url;
	}
	//////////////////////reservationView.jsp부분
	//예약현황 들어가면 예약 내역 찍어주기
	@RequestMapping("/reservationView.dodam")
	public ModelAndView reservationlist(ReservationVO reservationVO){
		
		ModelAndView mv = new ModelAndView();
		List<ReservationVO> list = reservationDAO.reservationlist();
		int size = list.size();
		for(int i=0; i<size; i++){
			String[] listdate = list.get(i).getRsvt_dt().split(" ");
			list.get(i).setRsvt_dt(listdate[0]);
		}
		
		mv.addObject("reservationlist", list);
		mv.addObject("listsize",size);
		mv.setViewName("/reservation/reservationView");

		return mv;
	}
	
	
	//예약현황 들어가면 달력에 내역 찍어주기
		@RequestMapping("/calendarlist.dodam")
		@ResponseBody
		public JSONArray calendarlist(){
			
			JSONArray array = reservationDAO.calendarlist();
			
			return array;
		}
	
		//날짜를 클릭하면 오늘의 예약현황에 뿌려주는 부분
		@RequestMapping("/todayreservation.dodam")
		@ResponseBody
		public List<ReservationVO> todayreservation(String todaydate){
			List<ReservationVO> list = reservationDAO.todayreservation(todaydate);
//			System.out.println("날짜 리스트란다"+list.size());
			int size = list.size();
			for(int i=0; i<size; i++){
				String[] listdate = list.get(i).getRsvt_dt().split(" ");
				list.get(i).setRsvt_dt(listdate[0]);
			}
			return list;
		}	
		
		//더블클릭하면 그 날짜에 예약하기로 넘어가는 부분
		@RequestMapping("/changepage.dodam")
		public ModelAndView changepage(String today){
			
			ModelAndView mv = new ModelAndView();
			List<MainVO> doctor = mainDAO.doctorSelect();
			List<ReservationVO> result = reservationDAO.bringlist(today);
			
//			System.out.println("result 갯수"+result.size());
			
			mv.addObject("result",result);
			mv.addObject("perName",doctor);
			mv.addObject("clickdate",today);
			mv.setViewName("/reservation/book");
			
			return mv;
		}
		
		//드래그했을 때 그 날짜에 담당선생님의 예약된 시간 구해오는 부분
		@RequestMapping("/possibleReservation.dodam")
		@ResponseBody
		public List<ReservationVO> possibleReservation(String title, String afterdate,String firsttime){
			
			ReservationVO reservationVO = new ReservationVO();
			reservationVO.setDoctor_name(title);
			reservationVO.setRsvt_dt(afterdate);
//			reservationVO.getRsvt_time();
//			System.out.println("가랏브이오1"+reservationVO.getDoctor_name());
//			System.out.println("가랏브이오2"+reservationVO.getRsvt_dt());
			List<ReservationVO> list = reservationDAO.possibleReservation(reservationVO);

			return list;
		}	
		
		//드래그해서 예약 수정. popup창에서 submit 누르면 들어오는 부분deleteReservation
				@RequestMapping("/reserveUpdate.dodam")
				public String reservUpdate(String doctor_name, String firstdate, String firsttime, String laterdate, String latertime){
//					System.out.println("으하하하하하하하"+doctor_name + "/" +firsttime+ "/" + firstdate + "/" + laterdate + "/" + latertime);
					
					ReservationVO reservationVO = new ReservationVO();
					
					reservationVO.setDoctor_name(doctor_name);
					reservationVO.setRsvt_dt(firstdate+"/"+laterdate);
					reservationVO.setRsvt_time(firsttime+"/"+latertime);
					
					int result = reservationDAO.reserveUpdate(reservationVO);
//					System.out.println(result);
					return "redirect:reservationView.dodam";
				}
		
			//드래그해서 예약 삭제 하는 부분
			@RequestMapping("/deleteReservation.dodam")
			public String reservUpdate(ReservationVO reservationVO){
//				System.out.println("으하하하하하하하"+ reservationVO.getDoctor_name()+ "/" +reservationVO.getRsvt_dt()+ "/" +reservationVO.getRsvt_time());
				System.out.println("의사의사"+reservationVO.getDoctor_name());
				System.out.println("시간시간"+reservationVO.getRsvt_time());
				
				ModelAndView mv = new ModelAndView();
				int result = reservationDAO.deleteReservation(reservationVO);
				
//				mv.setViewName("/reservation/reservationView");
				return "redirect:reservationView.dodam";
			}
	
			//오늘의 예약현황에서 리스트를 클릭했을 때 상단바에 정보 뜨는 부분
			@RequestMapping("/listInfomation.dodam")
//			@ResponseBody
			public String listInfomation(ReservationVO reservationVO, HttpSession session){
				List<ReservationVO> result = reservationDAO.listInfomation(reservationVO);
				session.setAttribute("cusname", result.get(0).getCus_name());
				session.setAttribute("doctorname",result.get(0).getDoctor_name());
				session.setAttribute("custel",result.get(0).getCus_tel());
				session.setAttribute("animalname",result.get(0).getAnimal_name());
				session.setAttribute("animalbreed",result.get(0).getAnimal_breed());
				session.setAttribute("animalnum",result.get(0).getAnimal_num());
				session.setAttribute("rsvtdt",result.get(0).getRsvt_dt());

				
				return "redirect:/counter/counterView.dodam";
			}
		
		
	////////////////////book.jsp부분
		
		//예약 DB등록
		@RequestMapping("/reserveInsert.dodam")
		public String reservInsert(ReservationVO reservationVO){
//			System.out.println("예약하기");
		int reservation = reservationDAO.reservinsert(reservationVO);
//		System.out.println("예약하기121212");
		return "redirect:changepage.dodam?today="+reservationVO.getRsvt_dt();
		}
		
//		예약하기 탭을 누르면 오늘날짜가 찍히면서 스케줄표에 예약스케줄에서 내역뿌려주기
		@RequestMapping("/book.dodam")
		public ModelAndView date(){
			
			SimpleDateFormat sd = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
			String str = sd.format(new Date());
			String[] todate = str.split(" ");
			String today = todate[0];
//			System.out.println("오늘은:"+today);
//			System.out.println("today : "+today);
			ModelAndView mv = new ModelAndView();
			List<MainVO> doctor = mainDAO.doctorSelect();
			List<ReservationVO> result = reservationDAO.bringlist(today);
			
//			System.out.println("result 갯수"+result.size());
			
			mv.addObject("result",result);
			mv.addObject("perName",doctor);
			mv.addObject("clickdate",today);
			mv.setViewName("/reservation/book");
			
//			System.out.println("의사 이름" + doctor.size());
			
			return mv; 
		}
		
	
		
		//휴대전화로 검색해 오는 부분
		@RequestMapping("/custelSearch.dodam")
		@ResponseBody
		public List<ReservationVO> custelSearch(String cus_tel){
			System.out.println("폰번호="+cus_tel);
			List<ReservationVO> result = reservationDAO.custelSearch(cus_tel);		
			return result;
		}
		
		//의사 수를 구해오는 부분
		@RequestMapping("/changedate1.dodam")
		@ResponseBody
		public List<MainVO> doctor(){
			List<MainVO> doctor = mainDAO.doctorSelect();					
			return doctor;
		}
		
		//날짜 바뀔때 그날의 예약 받아 오는 부분
		@RequestMapping("/changedate2.dodam")
		@ResponseBody
		public List<ReservationVO> changedate(String today){
			
			List<ReservationVO> list = reservationDAO.bringlist(today);
//			System.out.println(list.size());
			return list;
		}
		
		
		
		
}
