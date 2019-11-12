package bclass.finalproject.lovemein.payment.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bclass.finalproject.lovemein.payment.model.dao.PaymentDao;
import bclass.finalproject.lovemein.payment.model.vo.Payment;

// 2019-11-06 : 최선혜 [결제관련] ServiceImplements 
@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao paymentDao;
	
	
/*	//해당 id에 대한 결제테이블에 대한 전체 테이블 정보
	@Override
	public List<Payment> payList(String u_no){
		
		return paymentDao.payList(u_no);
	}

	*/
	
	//총 목록 갯수 조회
	@Override
	public int getListCount(String u_no) {
		
		
		return paymentDao.getListCount(u_no);
	}

	
	//페이지 시작과 끝값
	@Override
	public List<Payment> selectList(HashMap<String, Object> map){
		return paymentDao.selectList(map);
	}

	//DB에 결제정보추가
	@Override
	public int paySuccess(Payment payment) {
		System.out.println(payment.toString());
		return paymentDao.paySuccess(payment);
	}
	
	@Override
	public int paySuccess2(Payment payment) {
		return paymentDao.paySuccess2(payment);
	}
	
	@Override
	public int userCoin(String u_no) {
		return paymentDao.userCoin(u_no);
	}
}
