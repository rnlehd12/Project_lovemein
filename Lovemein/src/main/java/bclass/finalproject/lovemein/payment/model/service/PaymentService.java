package bclass.finalproject.lovemein.payment.model.service;

import java.util.HashMap;
import java.util.List;

import bclass.finalproject.lovemein.payment.model.vo.Payment;

//2019-11-06 : 최선혜 [결제관련] Service
public interface PaymentService {



/*	//아이디에 맞는 결제정보 전체전회
	List<Payment> payList(String u_no);
*/
	//총 목록 갯수 조회
	int getListCount(String u_no);

	//시작과 끝값
	List<Payment> selectList(HashMap<String, Object> map);

	//DB에 payment테이블에 결제정보 추가
	int paySuccess(Payment payment);
	
	//DB user테이블에 coin 정보추가
	int paySuccess2(Payment payment);

	int userCoin(String u_no);

}
