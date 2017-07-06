package myproj.reservation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.reservation.dto.ReservationVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO{

	@Autowired
	SqlSessionTemplate reservation;
	
	@Override
	public int reservinsert(ReservationVO reservationVO) {
		return reservation.insert("reservation.reservInsert",reservationVO) ;
	}

	@Override
	public List<ReservationVO> bringlist(String date) {
//		System.out.println("넌 날짜야"+date);
		
		return reservation.selectList("reservation.bringList", date);
	
	}

}
