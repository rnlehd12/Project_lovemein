package bclass.finalproject.lovemein.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import bclass.finalproject.lovemein.admin.model.service.AdminService;
import bclass.finalproject.lovemein.admin.model.vo.Notice;
import bclass.finalproject.lovemein.admin.model.vo.Report;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;
import bclass.finalproject.lovemein.users.model.vo.Users;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminService;

	// 관리자 메인 보여주는 컨트롤러
	@RequestMapping("adminMain.do")
	public String adminMain() {
		return "admin/adminMain";
	}

	// 회원목록 페이지 보여주는 컨트롤러
	@RequestMapping("adminMemberList.do")
	public ModelAndView adminMemberList(ModelAndView mv, @RequestParam(name = "page", required = false) String page) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		// 페이징 처리
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		int listCount = adminService.memberListCount();
		logger.info(currentPage + ", " + listCount);
		// 페이지 수 계산
		int maxPage = (int) ((double) listCount / limit + 0.9); // 목록이 11개이면 총 2페이지가 됨.
		// 현재 페이지가 포함된 페이지 그룹의 시작값
		int startPage = (int) ((double) currentPage / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝값
		int endPage = startPage + limit - 1;

		if (maxPage < endPage)
			endPage = maxPage;

		// 쿼리문에 반영할 현재 페이지에 출력할 목록의 시작행과 끝행 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		List<AllUsers> listm = adminService.memberList(map);

		if (listm != null && listm.size() > 0) {
			mv.addObject("listm", listm); // 리스트에 담은 전체 정보
			mv.addObject("listCount", listCount); // 전체갯수
			mv.addObject("maxPage", maxPage); // 맨마지막페이지
			mv.addObject("currentPage", currentPage); // 해당페이지 기본값 1
			mv.addObject("startPage", startPage); // 첫페이지
			mv.addObject("endPage", endPage); // 끝페이지
			mv.addObject("limit", limit); // 한페이지당 출력할갯수 기본값10개

			mv.setViewName("admin/adminMemberList");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패!");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// *회원 검색 컨트롤러
	@RequestMapping(value = "memberSearchList.do" /* , method=RequestMethod.POST */)
	public ModelAndView memberSearchListMethod(ModelAndView mv,Users users,
			@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "search", required = false) String search,
			@RequestParam(name="searchmenu", required=false)String searchmenu ) {

		
		System.out.println("serach : " + search);
		System.out.println("serach 2: " + searchmenu);
		

		if(searchmenu.equals("join_date")) {
		/* 날짜포맷하는 코드 */
		int a = search.indexOf("-");
			if (a == 4) {
				search = search.replace("-", "/").substring(2);
			System.out.println(search);
			}
		}
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		HashMap<String, Object> mmap = new HashMap<String, Object>();
		mmap.put("search", search);
		mmap.put("searchmenu", searchmenu);

		int listCount = adminService.memberSearchListCount(mmap);

		logger.info(currentPage + ", " + listCount);

		// 페이지 수 계산
		int maxPage = (int) ((double) listCount / limit + 0.9); // 목록이 11개이면 총 2페이지가 됨.
		// 현재 페이지가 포함된 페이지 그룹의 시작값
		int startPage = (int) ((double) currentPage / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝값
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;

		// 쿼리문에 반영할 현재 페이지에 출력할 목록의 시작행과 끝행 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		System.out.println("endROw : " + endRow);
		System.out.println("endpage : " + endPage);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("search", search);
		map.put("searchmenu", searchmenu);
		map.put("listcount", listCount);

		List<AllUsers> listsm = adminService.memberSearchList(map);

		for (AllUsers u : listsm) {
			System.out.println(u.toString());
		}

		if (listsm != null && listsm.size() > 0) {
			mv.addObject("search", search);
			mv.addObject("searchmenu", searchmenu);
			mv.addObject("listsm", listsm); // 리스트에 담은 전체 정보
			mv.addObject("listCount", listCount); // 전체갯수
			mv.addObject("maxPage", maxPage); // 맨마지막페이지
			mv.addObject("currentPage", currentPage); // 해당페이지 기본값 1
			mv.addObject("startPage", startPage); // 첫페이지
			mv.addObject("endPage", endPage); // 끝페이지
			mv.addObject("limit", limit); // 한페이지당 출력할갯수 기본값10개

			mv.setViewName("admin/adminSearchMemberList");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패!");
			mv.setViewName("admin/adminSearchNone");
		}

		return mv;
	}

	// 관리자 : 회원 상세보기 컨트롤러
	@RequestMapping("memberSelect.do")
	public ModelAndView memberSelectMethod(ModelAndView mv, @RequestParam(name = "u_no") String u_no) {

		AllUsers member = adminService.memberSelect(u_no);

		System.out.println(member.toString());
		if (member != null) {
			mv.addObject("member", member);
			mv.setViewName("admin/adminMemberSelect");
		}
		return mv;
	}

	// 관리자 : 회원 수정 컨트롤러
	@RequestMapping("memberUpdate.do")
	public ModelAndView memberUpdateMethod(ModelAndView mv, Users users, 
																		@RequestParam(name = "u_no") String u_no,
																		@RequestParam(name = "u_name") String u_name, 
																		@RequestParam(name = "u_coin") int u_coin,
																		@RequestParam(name = "u_intro") String u_intro) {

		// 유저 정보
		AllUsers member = adminService.memberSelect(u_no);

		if (member != null) {

			mv.addObject("member", member);
			mv.setViewName("admin/adminUpdateMember");
		}
		return mv;
	}

	//관리자: form에서 넘겨받은 회원 수정완료하는 컨트롤러
	@RequestMapping(value = "memberUpdateResult.do", method = RequestMethod.POST)
	public ModelAndView memberUpdateResultMethod(ModelAndView mv, 
																				HttpServletRequest req, Users users,
																				MultipartHttpServletRequest multiFile,
			@RequestParam(name = "imgfile", required = false) MultipartFile upload,
			@RequestParam(name = "u_no") String u_no, @RequestParam(name = "u_name") String u_name,
			@RequestParam(name = "u_coin") int u_coin, @RequestParam(name = "u_intro") String u_intro) {
		
		
		/*이미지파일 저장하기*/
		if (upload.getOriginalFilename() != null && !(upload.getOriginalFilename().equals(""))) {
			// 업로드된 원본 파일명 추출
			String newFileName = upload.getOriginalFilename();
			users.setU_profile(newFileName);
			// 파일 저장 폴더 지정
			String path = req.getSession().getServletContext().getRealPath("resources/images/admin/member");
			
			try {
				//저장한 파일로 저장하기
				upload.transferTo(new File(path + "\\" + newFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 수정페이지에서 받아온 변수들 vo에 저장
		users.setU_no(u_no);
		users.setU_name(u_name);
		users.setU_coin(u_coin);
		users.setU_intro(u_intro);

		int result = adminService.memberUpdate(users);
		if (result > 0) {
			mv.setViewName("redirect:adminMemberList.do");
		}
		return mv;
	}

	// 회원삭제 컨트롤러
	@RequestMapping("memberDelete.do")
	public ModelAndView memberDeleteMethod(ModelAndView mv, @RequestParam(name = "u_no") String u_no) {

		int result = adminService.memberDelete(u_no);

		if (result > 0) {
			mv.setViewName("redirect:adminMemberList.do");
		}
		return mv;
	}

	/* 공지사항 */
	// 공지사항 페이지 보여주는 컨트롤러
	@RequestMapping("adminNoticeMain.do")
	public ModelAndView adminNoiceMain(ModelAndView mv, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		List<Notice> listn = adminService.noticeList();
		int result = adminService.noticeListCount();

		System.out.println(" 공지 : " + listn.toString());
		if (listn != null) {
			mv.addObject("listn", listn);
			mv.addObject("result", result);
			mv.setViewName("admin/adminNoticeMain");
		}
		return mv;
	}

	// 공지사항 더보기
	@RequestMapping("adminNoticeMainAjax.do")
	public ModelAndView adminNoiceMainAjax(ModelAndView mv, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		List<Notice> listn = adminService.noticeList();
		int result = adminService.noticeListCount();

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for (Notice notice : listn) {

			System.out.println(sdf.format(notice.getN_date()));
			notice.setParseDate(sdf.format(notice.getN_date()));
			System.out.println("ns:" + notice.getN_simg());
		}

		if (listn.size() > 0) {
			JSONObject sendJSON = new JSONObject();
			JSONArray jarr = new JSONArray();

			for (Notice notice : listn) {
				// 객체 저장용 json 객체 생성
				JSONObject job = new JSONObject();

				job.put("n_no", notice.getN_no());
				job.put("n_img", notice.getN_img());
				job.put("n_title", URLEncoder.encode(notice.getN_title(), "UTF-8"));
				job.put("u_no", notice.getU_no());
				job.put("n_text", URLEncoder.encode(notice.getN_text(), "UTF-8"));
				job.put("n_date", notice.getParseDate());
				job.put("n_simg", notice.getN_simg());
				// 배열에 저장
				jarr.add(job);
			}

			sendJSON.put("list", jarr);
			sendJSON.put("result", result);
			mv.setViewName("JsonView");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print(sendJSON.toString());
			out.flush();
			out.close();
		}
		return mv;

	}

	// 공지사항 글씨기 버튼 클릭하면 글쓰기 페이지로 넘어감
	@RequestMapping("adminNoticeinsert.do")
	public String adminNoticeInsertMethod() {

		return "admin/adminNoticeInsert";
	}

	//공지사항 글쓰기 페이지에서 저장완료하는 컨트롤러
	@RequestMapping(value = "adminNoticeInsertResult.do", method = RequestMethod.POST)
	public ModelAndView adminNoticeResultMethod(ModelAndView mv, HttpServletRequest req,
			@RequestParam(name = "n_title") String n_title,
			@RequestParam(name = "n_sumimg", required = false) MultipartFile upload,
			@RequestParam(name = "n_text") String n_text, Notice notice) {

		// 이전 사진 이름 simg
		// 새로 들어온 사진 이름 추출
		String newFileName = upload.getOriginalFilename();

		// 저장할 경로
		String path = req.getSession().getServletContext().getRealPath("resources/images/admin/notice/notice_s");

		// 이미지파일 저장하기
		if (newFileName != null && !(newFileName.equals(""))) {
			
			//파일이름 날짜로 만들어서 바꿔주기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ newFileName.substring(newFileName.lastIndexOf(".") + 1);

			try {
				upload.transferTo(new File(path + "\\" + renameFileName));
				notice.setN_simg(renameFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		notice.setN_title(n_title); // 공지사항제목
		notice.setN_text(n_text);

		int result = adminService.noticeInsert(notice);

		mv.setViewName("redirect:adminNoticeMain.do");
		return mv;
	}

	// 서버에 파일 url저장
	@RequestMapping("adminNoticeInsertFile.do")
	public String amdinNoticeInsertFileMethod(HttpServletRequest req, HttpServletResponse resp,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {

		/* URL */
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		System.out.println("전송 : " + multiFile.toString());

		// 파일명 다시 정의하기
		MultipartFile file = multiFile.getFile("upload");
		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						String fileName = file.getName();
						System.out.println("이름1: " + file.getName());

						byte[] bytes = file.getBytes();
						HttpSession session = req.getSession();
						String uploadPath = session.getServletContext().getRealPath("resources/images/admin/notice/");// webapp

						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}

						// 파일명 중복되지않게 랜덤값으로 파일명주기
						fileName = UUID.randomUUID().toString();

						// 저장할폴더+파일명
						uploadPath = uploadPath + "/" + fileName;

						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						printWriter = resp.getWriter();
						resp.setContentType("text/html");
						String fileUrl = req.getContextPath() + "/resources/images/admin/notice/" + fileName;

						/* int a = adminService.noticeUrlInsert(fileUrl); */
						// json 데이터로 등록
						// {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
						// 이런 형태로 리턴이 나가야함.
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);

						printWriter.println(json);
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					} // finally

				} // if
			} // if
		} // if
		return null;

	} // 메소드

	// 공지사항 수정페이지 보여주는 컨트롤러
	@RequestMapping("adminNoticeUpdate.do")
	public ModelAndView adminNoticeUpdateMethod(ModelAndView mv, @RequestParam(name = "n_no") String n_no) {

		Notice notice = new Notice();
		notice = adminService.noticeSelect(n_no);

		mv.addObject("notice", notice);
		mv.setViewName("admin/adminNoticeUpdate");
		return mv;
	}

	// 공지사항수정
	@RequestMapping(value = "adminNoticeUpdateResult.do", method = RequestMethod.POST)
	public ModelAndView adminNoticeUpdateResultMethod(ModelAndView mv, HttpServletRequest req,
			@RequestParam(name = "n_no") String n_no, @RequestParam(name = "n_title") String n_title,
			@RequestParam(name = "n_sumimg", required = false) MultipartFile upload,
			@RequestParam(name = "n_simg") String n_simg, @RequestParam(name = "n_text") String n_text, Notice notice) {

		// 이전 사진 이름 simg
		// 새로 들어온 사진 이름 추출
		String newFileName = upload.getOriginalFilename();

		// 저장할 경로
		String path = req.getSession().getServletContext().getRealPath("resources/images/admin/notice/notice_s");

		File OFile = new File(path + "/" + n_simg);
		// board 객체에 원본파일명 기록함
		// 이미지파일 저장하기
		if (newFileName != null && !(newFileName.equals(""))) {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ newFileName.substring(newFileName.lastIndexOf(".") + 1);

			// 새사진있으면 이전사진 삭제함.
			OFile.delete();

			// 파일 저장 폴더 지정

			try {
				upload.transferTo(new File(path + "\\" + renameFileName));
				notice.setN_simg(renameFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		System.out.println("공지사항 수정 : " + notice.toString());
		notice.setN_no(n_no);
		notice.setN_title(n_title); // 공지사항제목
		notice.setN_text(n_text);

		// int result = adminService.noticeInsert(notice);
		int result = adminService.noticeUpdate(notice);

		mv.setViewName("redirect:adminNoticeMain.do");
		return mv;
	}

	// 공지사항 수정 : 서버로 파일 전송 보내는 컨트롤러ajax
	@RequestMapping("adminNoticeUpdateFile.do")
	public String amdinNoticeUpdateFileMethod(HttpServletRequest req, HttpServletResponse resp,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {

		/* URL */
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		System.out.println("전송 : " + multiFile.toString());

		// 파일명 다시 정의하기
		MultipartFile file = multiFile.getFile("upload");
		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						String fileName = file.getName();
						System.out.println("이름1: " + file.getName());

						byte[] bytes = file.getBytes();
						HttpSession session = req.getSession();
						String Path = session.getServletContext().getRealPath("resources/images/admin/notice/");// webapp

						File uploadFile = new File(Path);
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}

						// 파일명 중복되지않게 랜덤값으로 파일명주기
						fileName = UUID.randomUUID().toString();

						// 저장할폴더+파일명
						Path = Path + "/" + fileName;
						
						/*새 파일 패스에 생성하기 : 
						 FileOutputStream 은 무조건 해당 파일을 생성한다.*/ 
						out = new FileOutputStream(new File(Path));
						
						//새 파일을 바이트로 작성하기
						out.write(bytes);

						printWriter = resp.getWriter();
						resp.setContentType("text/html");
						String fileUrl = req.getContextPath() + "/resources/images/admin/notice/" + fileName;

						/* int a = adminService.noticeUrlInsert(fileUrl); */
						// json 데이터로 등록
						// {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
						// 이런 형태로 리턴이 나가야함.
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);

						printWriter.println(json);
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					} // finally
				} // if
			} // if
		} // if
		return null;

	} // 메소드

	// 공지사항 상세보기 보여주는 컨트롤러
	@RequestMapping("adminNoticeSelect.do")
	public ModelAndView adminNoticeSelectMethod(ModelAndView mv, @RequestParam(name = "n_no") String n_no) {

		Notice notice = adminService.noticeSelect(n_no);

		mv.addObject("notice", notice);
		mv.setViewName("admin/adminNoticeSelect");
		return mv;
	}

	// 공지사항 삭제 컨트롤러
	@RequestMapping("adminNoticeDelete.do")
	public ModelAndView adminNoticeDelteMethod(ModelAndView mv, @RequestParam(name = "n_no") String n_no) {

		int result = adminService.noticeDelete(n_no);

		mv.setViewName("redirect:adminNoticeMain.do");
		return mv;
	}

	// 신고 페이지 보여주는 컨트롤러
	@RequestMapping("adminReportList.do")
	public ModelAndView adminReportList(ModelAndView mv, @RequestParam(name = "page", required = false) String page) {

		int currentPage = 1;

		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10; // 한 페이지에 출력할 목록 갯수

		// 갯수 가져오기
		int listCount = adminService.reportListCount();

		logger.info(currentPage + ", " + listCount);

		// 페이지 수 계산
		int maxPage = (int) ((double) listCount / limit + 0.9); // 목록이 11개이면 총 2페이지가 됨.
		// 현재 페이지가 포함된 페이지 그룹의 시작값
		int startPage = (int) ((double) currentPage / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝값
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;

		// 쿼리문에 반영할 현재 페이지에 출력할 목록의 시작행과 끝행 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		logger.info(startRow + "," + endRow);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		System.out.println("endrow: " + endRow);
		List<Report> listr = adminService.reportList(map);

		for (Report r : listr) {
			System.out.println(r.toString());
		}

		if (listr != null && listr.size() > 0) {
			mv.addObject("listr", listr); // 리스트에 담은 전체 정보
			mv.addObject("listCount", listCount); // 전체갯수
			mv.addObject("maxPage", maxPage); // 맨마지막페이지
			mv.addObject("currentPage", currentPage); // 해당페이지 기본값 1
			mv.addObject("startPage", startPage); // 첫페이지
			mv.addObject("endPage", endPage); // 끝페이지
			mv.addObject("limit", limit); // 한페이지당 출력할갯수 기본값10개

			mv.setViewName("admin/adminReportList");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패!");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 관리자 : 신고 상세보기 컨트롤러
	@RequestMapping("adminReportDetail.do")
	public ModelAndView reportSelectMethod(ModelAndView mv, @RequestParam(name = "r_no") String r_no, Report report) {

		report.setR_no(r_no);
		Report rlist = adminService.reportSelect(report);

		if (rlist != null) {
			mv.addObject("rlist", rlist);
			mv.setViewName("admin/adminReportDetail");
		}
		return mv;
	}

	// 신고확인처리
	@RequestMapping("adminReportResult.do")
	public ModelAndView reportResultMethod(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			@RequestParam(name = "r_no") String r_no, Report report) throws Exception {

		// report VO에 앞단에서 가져온 신고번호 담기
		report.setR_no(r_no);

		// 신고처리 업데이트
		int result = adminService.reportResult(report);
		// 확인처리여부가져오는 코드
		List<Report> list = adminService.reportYN(r_no);

		if (result > 0 && list != null) {
			JSONObject sendJson = new JSONObject();
			JSONArray jarr = new JSONArray();

			for (Report r : list) {
				JSONObject job = new JSONObject();
				job.put("r_yn", URLEncoder.encode(r.getR_yn(), "utf-8"));
				jarr.add(job);
			}
			
			sendJson.put("list", jarr);

			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(sendJson.toJSONString());
			out.flush();
			out.close();
		}
		mv.setViewName("JsonView");
		return mv;
	}

	// 신고검색
	@RequestMapping("adminSearchReportList.do")
	public ModelAndView reportSearchListMethod(ModelAndView mv,
			@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "sselect", required = false) String sselect,
			@RequestParam(name = "result_text", required = false) String result_text) {

		/*
		 * 옵션값: sselect 나머지 텍스트값 :result_text 처리현황여부 : re_yn
		 */

		logger.info(result_text);
		logger.info(sselect);

		Report report = new Report();
		HashMap<String, Object> map = new HashMap<String, Object>();

		report.setSearchOption(sselect);// 조건값

		if (result_text.equals(",Y") || result_text.equals(",N")) {
			report.setSearchResult(result_text.substring(1));
		} else if (sselect.equals("r_date")) {
			// 날짜값
			result_text.split(result_text);
			String str = result_text;
			String arrayStr = "";
			String[] array = str.split("");

			// 출력
			for (int i = 0; i < array.length; i++) {
				System.out.println(i + "번 : " + array[i]);
				if (i == 10 || i == 11)
					continue; 
				// array의 10번과11번 인덱스 빼고 문자열로만들기
				arrayStr += array[i];
			}
			System.out.println("continue로 ,, 뺀 값 : " + arrayStr);

			/* 날짜포맷하는 코드 */
			int a = arrayStr.indexOf("-");
			if (a == 4) {
				arrayStr = arrayStr.replace("-", "/").substring(2);

			}

			System.out.println(" 날짜포맷 : " + arrayStr);
			report.setSearchResult(arrayStr);
		} else {
			report.setSearchResult(result_text);
		}
		map.put("searchOption", report.getSearchOption());
		map.put("searchResult", report.getSearchResult());
		System.out.println("옵션값 : " + report.getSearchOption());
		System.out.println("내용값 : " + report.getSearchResult());

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10; // 한 페이지에 출력할 목록 갯수

		int listCount = adminService.reportSearchListCount(map);

		logger.info("신고 리스트 :  " + currentPage + ", " + listCount);

		// 페이지 수 계산
		int maxPage = (int) ((double) listCount / limit + 0.9); // 목록이 11개이면 총 2페이지가 됨.
		// 현재 페이지가 포함된 페이지 그룹의 시작값
		int startPage = (int) ((double) currentPage / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝값
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;

		// 쿼리문에 반영할 현재 페이지에 출력할 목록의 시작행과 끝행 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		System.out.println("endROw : " + endRow);
		System.out.println("endpage : " + endPage);

		HashMap<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("startRow", startRow);
		rmap.put("endRow", endRow);
		rmap.put("listCount", listCount);
		rmap.put("searchOption", report.getSearchOption());
		rmap.put("searchResult", report.getSearchResult());

		List<Report> listsr = adminService.reportSearchList(rmap);

		for (Report r : listsr) {
			System.out.println(r.toString());
		}
		if (listsr != null && listsr.size() > 0) {

			mv.addObject("listsr", listsr); // 리스트에 담은 전체 정보
			mv.addObject("listCount", listCount); // 전체갯수
			mv.addObject("maxPage", maxPage); // 맨마지막페이지
			mv.addObject("currentPage", currentPage); // 해당페이지 기본값 1
			mv.addObject("startPage", startPage); // 첫페이지
			mv.addObject("endPage", endPage); // 끝페이지
			mv.addObject("limit", limit); // 한페이지당 출력할갯수 기본값10개
			mv.addObject("result_text", report.getSearchResult());
			mv.addObject("sselect", report.getSearchOption());

			mv.setViewName("admin/adminReportSearchList");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패!");
			mv.setViewName("admin/adminSearchNone");
		}
		return mv;
	}

}
