package myproj.reservation.dao;

import java.util.List;

import myproj.reservation.dto.ReservationVO;

public interface ReservationDAO {

	//예약 정보를 입력
	int reservinsert(ReservationVO reservationVO);

	//DB에서 예약 정보 가져오기 
	List<ReservationVO> bringlist(String date);
}
