package myproj.reservation.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.reservation.dto.ReservationVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO{

	@Autowired
	SqlSessionTemplate reservation;
//////////////////////////////////////reservationView.jsp부분	
	//화면 전환 할 때 오늘의 예약현황 띄워주는 부분
	@Override
	public List<ReservationVO> reservationlist() {
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String str = sd.format(new Date());
		String[] today = str.split(" ");
		String todate = today[0];
		
		return reservation.selectList("reservation.reservationlist",todate);
	}

	//화면전환 할 때 달력에 예약현황 띄워주는 부분
	@Override
	public JSONArray calendarlist() {
		
		List<ReservationVO> list = reservation.selectList("reservation.calendarlist");
		JSONObject obj = new JSONObject();

		JSONArray jArray = new JSONArray();
			
		
		for(int i=0; i<list.size();i++){
			
			JSONObject sObject = new JSONObject();
			//날짜가 내가 등록한 시간이랑 같이 나와서 날짜부분만 자르는 부분
			String date = list.get(i).getRsvt_dt();
			String[] start = date.split(" ");
			String color = "";
			//서비스 타입에 따라서 색깔 지정해 주려고 함.
			String type = list.get(i).getService_type();
//			System.out.println(type);
			if(type.equals("진료")){
				color = "#F596E8";		//빨간색
			}else if(type.equals("미용")){
				color = "#E6A235";		//파란색
			}else if(type.equals("호텔")){	
				color = "#96F5A7";		//초록색
			}
//			System.out.println(type);
			sObject.put("title",list.get(i).getDoctor_name()+"("+list.get(i).getRsvt_time()+")");
			sObject.put("start",start[0]);
//			System.out.println("스따뜨"+start[0]);
			sObject.put("color",color);
			sObject.put("textColor","black");
			sObject.put("font-size","20");
			sObject.put("tip","보호자(동물)="+list.get(i).getCus_name()+"("+list.get(i).getAnimal_name()+")");

			jArray.add(sObject);
			obj.put(null, jArray);
		}
//		System.out.println("ㅋㅋㅋ"+jArray);
		return jArray;
	}

	//해당날짜를 클릭하면 오늘의 예약현황에 보여주는 부분
	@Override
	public List<ReservationVO> todayreservation(String todaydate) {
//		System.out.println("제발제발"+reservation.selectList("reservation.todayreservation",todaydate));
		List<ReservationVO> list = reservation.selectList("reservation.todayreservation",todaydate);
		
		System.out.println("애니멀 넘버"+list.get(0).getAnimal_num());
		return list;
	}
	
	//드래그 했을 때 예약 가능한 시간 얻어오는 부분
	@Override
	public List<ReservationVO> possibleReservation(ReservationVO reservationVO) {
//		System.out.println("브이오"+reservationVO);
		List<ReservationVO> list = reservation.selectList("reservation.passible",reservationVO);
//		System.out.println("리스트왔다!!"+list);
		return list;
	}

	//드래그 했을 때 예약 수정 하는 부분
	@Override
	public int reserveUpdate(ReservationVO reservationVO) {
		String[] date = reservationVO.getRsvt_dt().split("/");
		String firstdate = date[0];
		String laterdate = date[1];
		
		String[] time = reservationVO.getRsvt_time().split("/");
		String firsttime = time[0];
		String latertime = time[1];
		
		HashMap map = new HashMap();
		map.put("firstdate", firstdate);
		map.put("laterdate", laterdate);
		map.put("firsttime", firsttime);
		map.put("latertime", latertime);
		map.put("doctor_name", reservationVO.getDoctor_name());
		int result = reservation.update("reservation.reserveUpdate",map);
		
		return result;
	}
	
	//드래그 했을 때 예약 수정하는 부분
	@Override
	public int deleteReservation(ReservationVO reservationVO) {
		
		int result = reservation.delete("reservation.deleteReservation",reservationVO);
		
		return result;
	}
	
	//오늘의 예약현황에서 리스트 클릭 했을 때 상단바에 정보 보여주는 부분
	@Override
	public List<ReservationVO> listInfomation(ReservationVO reservationVO) {
		
		List<ReservationVO> list = reservation.selectList("reservation.listInfomation",reservationVO);
		System.out.println(list.get(0).getAnimal_breed());

		return list;
	}
	
	
	/////////////////////////////////book.jsp에 해당하는 부분
	//예약을 DB에 넣는 부분
	@Override
	public int reservinsert(ReservationVO reservationVO) {
		String custel1 = reservationVO.getCus_tel().substring(0, 3);
		String custel2 = reservationVO.getCus_tel().substring(3,7);
		String custel3 = reservationVO.getCus_tel().substring(7,11);
		
		reservationVO.setCus_tel(custel1 + "-" + custel2 + "-" + custel3);
//		System.out.println("커스텔"+reservationVO.getCus_tel());
		String animal_num = reservation.selectOne("reservation.animalnumSearch",reservationVO);
		
		reservationVO.setAnimal_num(animal_num);
//		System.out.println(reservationVO.getAnimal_num()+"/"+reservationVO.getRsvt_dt()+"/"+reservationVO.getPer_id()+"/"+reservationVO.getRsvt_time()+"/"+reservationVO.getService_type()+"/"+reservationVO.getDoctor_name());
		return reservation.insert("reservation.reserveInsert",reservationVO) ;
	}

	@Override
	public List<ReservationVO> bringlist(String today) {
//		System.out.println("넌 날짜야"+today);
		
		return reservation.selectList("reservation.bringList", today);
	
	}

	//휴대 전화로 검색 해 오는 부분
	@Override
	public List<ReservationVO> custelSearch(String cus_tel) {
//		System.out.println("들어온놈"+cus_tel);
		String custel1 = cus_tel.substring(0, 3);
		String custel2 = cus_tel.substring(3,7);
		String custel3 = cus_tel.substring(7,11);
		
		String tel = custel1 + "-" + custel2 + "-" + custel3;

		List<ReservationVO> list = reservation.selectList("reservation.custelSearch", tel);
		
		return list;
	}

	

	

	

}
