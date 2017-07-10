package myproj.mpay.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import myproj.beauty.dao.BeautyDAO;
import myproj.mpay.dto.MpayDAO;

@Controller
@RequestMapping("/mpay")
public class MpayController {

	@Autowired
	MpayDAO mpayDAO;
	
	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/mpay/"+url;
	}
	
	// mpayView.jsp 에서 날짜가 set 되었을 때 그 날의 시간대별 접수고객을 가져온다.
	@RequestMapping("/mpayView1Change.dodam")
	@ResponseBody
	public List<Map<String, Object>> showMpayView1(String selectDay){
		
		List<Map<String, Object>> resultMpay1;
		resultMpay1 = mpayDAO.showMpayView1(selectDay);
		
		return resultMpay1;
	}
	
	
	
	
	
	// mpayView3.jsp 에서 날짜가 set 되었을 때 그 날의 시간대별 매출별 건수를 가져온다.
	@RequestMapping("/mpayView3Change.dodam")
	@ResponseBody
	public List<Map<String, Object>> showMpayView3(String selectYY){
	
		//List에 진료, 입원및호텔, 미용 기록을 모두 넣어줘라~~
		List<Map<String, Object>> resultMpay3 = new ArrayList<Map<String, Object>>();
		resultMpay3.addAll(mpayDAO.showMpayView3Jinryo(selectYY));
		resultMpay3.addAll(mpayDAO.showMpayView3Stay(selectYY));
		resultMpay3.addAll(mpayDAO.showMpayView3Beauty(selectYY));
		
		return resultMpay3;
	}
	
}
