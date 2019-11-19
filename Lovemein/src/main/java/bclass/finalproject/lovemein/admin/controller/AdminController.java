package bclass.finalproject.lovemein.admin.controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bclass.finalproject.lovemein.admin.model.service.AdminService;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;

@Controller
public class AdminController {

	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	//관리자 메인 보여주는 컨트롤러
	@RequestMapping("adminMain.do")
	public String adminMain() {
	
		
		return "admin/adminMain";
		
	}

	//회원목록 페이지 보여주는 컨트롤러
	@RequestMapping("adminMemberList.do")
	public ModelAndView adminMemberList(ModelAndView mv,@RequestParam(name="page", required=false) String page) {
	
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		//페이징 처리
		int limit = 10;  //한 페이지에 출력할 목록 갯수
		int listCount = adminService.memberListCount();
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
	
		
		List<AllUsers> listm = adminService.memberList(map);
		
		if(listm != null && listm.size() > 0) {
			mv.addObject("listm", listm); //리스트에 담은 전체 정보
			mv.addObject("listCount", listCount); //전체갯수
			mv.addObject("maxPage", maxPage); // 맨마지막페이지 
			mv.addObject("currentPage", currentPage); //해당페이지 기본값 1
			mv.addObject("startPage", startPage); //첫페이지
			mv.addObject("endPage", endPage); //끝페이지
			mv.addObject("limit", limit); //한페이지당 출력할갯수 기본값10개
			
			mv.setViewName("admin/adminMemberList");
		}else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패!");
			mv.setViewName("common/error");
		}
		
		return mv;
		
		
	}

	//*회원 검색 컨트롤러
	@RequestMapping(value="memberSearchList.do" /*, method=RequestMethod.POST*/)
	public ModelAndView memberSearchListMethod(ModelAndView mv, 									
			@RequestParam(name="page", required=false) String page,
											@RequestParam(name="search", required=false) String search) {
		
		
		/*날짜포맷하는 코드*/
		int a = search.indexOf("-");
		if(a == 4) {
		 search = search.replace("-", "/").substring(2);
		
		}

		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}

		//페이징 처리
		int limit = 10;  //한 페이지에 출력할 목록 갯수
		
		int listCount = adminService.memberSearchListCount(search);
		
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
		System.out.println("endROw : " +endRow);
		System.out.println("endpage : " +endPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("search", search);
		map.put("listcount", listCount);
		
		List<AllUsers> listsm = adminService.memberSearchList(map);
		
		
		for(AllUsers u : listsm) {
			System.out.println(u.toString());
		}
		
		
		if(listsm != null && listsm.size() > 0) {
			mv.addObject("search",search);
			mv.addObject("listsm", listsm); //리스트에 담은 전체 정보
			mv.addObject("listCount", listCount); //전체갯수
			mv.addObject("maxPage", maxPage); // 맨마지막페이지 
			mv.addObject("currentPage", currentPage); //해당페이지 기본값 1
			mv.addObject("startPage", startPage); //첫페이지
			mv.addObject("endPage", endPage); //끝페이지
			mv.addObject("limit", limit); //한페이지당 출력할갯수 기본값10개
			
			mv.setViewName("admin/adminSearchMemberList");
		}else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패!");
			mv.setViewName("common/error");
		}
		
		
		
		
		
		return mv;
	}
	
	//관리자 : 회원 상세보기 컨트롤러
	@RequestMapping("memberSelect.do")
	public ModelAndView memberSelectMethod(ModelAndView mv, String u_no){
	
		
		
		
		
		
		
		mv.setViewName("admin/adminMemberSelect");
	return mv;
	}

	@RequestMapping("memberDelete.do")
	public String memberDeleteMethod(@RequestParam(name="u_no")String u_no) {
		
		
		
		
		return "admin/adminMemberList";
	}
	
	/*공지사항*/
	//공지사항 페이지 보여주는 컨트롤러
	@RequestMapping("adminNoticeMain.do")
	public String adminNoiceMain() {
	
		
		
		
		
		
		return "admin/adminNoticeMain";
		
	}
	
	
	//공지사항 페이지 보여주는 컨트롤러
	@RequestMapping("adminReportList.do")
	public String adminReportList() {
	
		return "admin/adminReportList";
		
	}
	
	
	
	
	
}


