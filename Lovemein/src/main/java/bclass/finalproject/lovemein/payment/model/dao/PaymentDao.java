package bclass.finalproject.lovemein.payment.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bclass.finalproject.lovemein.payment.model.vo.Payment;

//2019-11-06 : 최선혜 [결제관련] ServiceDao

@Repository("paymentDao")
public class PaymentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
/*
	public List<Payment> payList(String u_no) {
		// 결제리스트 가져오는 Dao
		return sqlSession.selectList("paymentMapper.payList",u_no);
	}
*/


	public int getListCount(String u_no) {
		//총 목록 갯수 조회
		return sqlSession.selectOne("paymentMapper.getListCount", u_no);
	}


	
	public List<Payment> selectList(HashMap<String, Object> map) {
		//페이지 시작과 끝값
		return sqlSession.selectList("paymentMapper.selectList", map);
	}



	public int paySuccess(Payment payment) {
		// TODO Auto-generated method stub
		return sqlSession.insert("paymentMapper.paySuccess", payment);
	}



	public int Insertcoin(Payment payment) {
		// TODO Auto-generated method stub
		return sqlSession.update("paymentMapper.Insertcoin", payment);
	}



	public int userCoin(String u_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("paymentMapper.userCoin", u_no);
	}
	
	
	
	
}
