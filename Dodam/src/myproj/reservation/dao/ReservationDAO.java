package myproj.reservation.dao;

import java.util.List;

import org.json.simple.JSONArray;

import myproj.reservation.dto.ReservationVO;

public interface ReservationDAO {

	//화면 전환 할 때 오늘의 예약현황 띄워주는 부분
	List<ReservationVO> reservationlist();
	
	//화면전환 할 때 달력에 예약현황 띄워주는 부분
	JSONArray calendarlist(); 
	
	//해당날짜를 클릭하면 오늘의 예약현황에 보여주는 부분
	List<ReservationVO> todayreservation(String todaydate);
	
	//예약 정보를 입력
	int reservinsert(ReservationVO reservationVO);

	//DB에서 예약 정보 가져오기 
	List<ReservationVO> bringlist(String today);
	
	//드래그 했을 때 수정 가능 한 시간 얻어 오기
	List<ReservationVO> possibleReservation(ReservationVO reservationVO);
	
	//드래그 했을 때 예약 수정하기
	int reserveUpdate(ReservationVO reservationVO);
	
	//드래스 했을 때 예약 삭제 하기
	int deleteReservation(ReservationVO reservationVO);
	
	//휴대전화로 검색 해 오는 부분
	List<ReservationVO> custelSearch(String cus_tel);
	
	//오늘의 예약현황에서 리스트 클릭 했을 때 상단바에 정보 보여주는 부분
	List<ReservationVO> listInfomation(ReservationVO reservationVO);
	
	
	/////////////////////////////접수 부분///////////////////////////////////
	//접수 등록하는 부분(실질적으로는 예약에서 접수 시간과 접수 여부를 업데이트 시키는 부분)
	int counterInsert(ReservationVO reservationVO);
	
	//접수 대기자 불러 오는 부분
	List<ReservationVO> counterlist(String today);
}
