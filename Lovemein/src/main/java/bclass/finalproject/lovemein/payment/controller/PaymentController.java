package bclass.finalproject.lovemein.payment.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bclass.finalproject.lovemein.payment.model.service.PaymentService;
import bclass.finalproject.lovemein.payment.model.vo.Payment;
import bclass.finalproject.lovemein.users.model.service.UsersService;



@Controller
public class PaymentController {


	@Autowired
	private PaymentService paymentService;
	@Autowired
	private UsersService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	

	
	//결제 메인 페이지
	@RequestMapping("payMain.do")
	public ModelAndView payMainMethod(ModelAndView mv) {
		
		
		
		
		
		mv.setViewName("payment/payMain");
		
		return mv;
	}
	
	
	//결제 내역 리스트 페이지
	@RequestMapping("payList.do")
	public ModelAndView payListMethod(@RequestParam("u_no")String u_no,@RequestParam(name="page", required=false) String page,  ModelAndView mv) {
	

	/*	
	 * 결제목록불러오는
	 * List<Payment> list = paymentService.payList(u_no);
		for(Payment p : list) {
			System.out.println(p.toString());
		}
		mv.addObject("list", list);
		mv.setViewName("payment/payList");
		
		return mv;
		*/
		
		
	
		/*페이징*/
		
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//페이징 처리
		int limit = 10;  //한 페이지에 출력할 목록 갯수
		int listCount = paymentService.getListCount(u_no);  //총 목록 갯수 조회
	
		logger.info(currentPage + ", " + listCount);
		//페이지 수 계산
		int maxPage = (int)((double)listCount / limit + 0.9);  //목록이 11개이면 총 2페이지가 됨.
		//현재 페이지가 포함된 페이지 그룹의 시작값
		int startPage = (int)((double)currentPage / limit + 0.9);
		//현재 페이지가 포함된 페이지 그룹의 끝값
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage)
			endPage = maxPage;
		
		//쿼리문에 반영할 현재 페이지에 출력할 목록의 시작행과 끝행 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("u_no", u_no);
		
		//시작과 끝값
		List<Payment> listp = paymentService.selectList(map);
		
		logger.info(listp.toString());
	
		if(listp != null && listp.size() > 0) {
			mv.addObject("listp", listp); //리스트에 담은 전체 정보
			mv.addObject("listCount", listCount); //전체갯수
			mv.addObject("maxPage", maxPage); // 맨마지막페이지 
			mv.addObject("currentPage", currentPage); //해당페이지 기본값 1
			mv.addObject("startPage", startPage); //첫페이지
			mv.addObject("endPage", endPage); //끝페이지
			mv.addObject("limit", limit); //한페이지당 출력할갯수 기본값10개
			
			mv.setViewName("payment/payList");
		}else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패!");
			mv.setViewName("payment/paymentNone");
		}
		
		return mv;
		

	}

		//결제성공페이지 보내는 컨트롤러
		@RequestMapping("payOk.do")
		public String payOkMethod() {

			return "payment/paySuccess";
		}
		
		
}
