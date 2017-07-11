package myproj.payment.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Autowired
	SqlSessionTemplate payment;

	// 수납대기 리스트
	@Override
	public List<Map<String, String>> waitinglist() {

		return payment.selectList("payment.waitinglist");
	}

	// 수납목록 리스트(미용)
	@Override
	public List<Map<String, String>> btpaylist(int animal_num) {

		return payment.selectList("payment.btpaylist", animal_num);
	}

	// 수납목록 리스트(입원/호텔)
	@Override
	public List<Map<String, String>> stpaylist(int animal_num) {

		return payment.selectList("payment.stpaylist", animal_num);
	}

	// 수납목록 리스트(진료)
	@Override
	public List<Map<String, String>> trpaylist(int animal_num) {

		return payment.selectList("payment.trpaylist", animal_num);
	}

	// 수납대기 삭제
	@Override
	public int listDelete(int animal_num) {

		return payment.delete("payment.listdel", animal_num);
	}

	// 결제하기
	@Override
	public int paymentOk(int animal_num) {

		return payment.update("payment.paymentok", animal_num);
	}
}
