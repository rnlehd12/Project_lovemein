package bclass.finalproject.lovemein.talk.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bclass.finalproject.lovemein.talk.model.service.TalkService;
import bclass.finalproject.lovemein.talk.model.vo.Chat;
import bclass.finalproject.lovemein.talk.model.vo.Search;
import bclass.finalproject.lovemein.talk.model.vo.Talk;
import bclass.finalproject.lovemein.talk.model.vo.TalkChat;
import bclass.finalproject.lovemein.talk.model.vo.TalkMission;
import bclass.finalproject.lovemein.talk.model.vo.TalkPartner;

@Controller
public class TalkController {
	
	@Autowired
	private TalkService talkService;
	
	private static final Logger logger = LoggerFactory.getLogger(TalkController.class);

/*talkView관련 -----------------------------------------------------------------*/
	@RequestMapping("talkView.do")
	public ModelAndView talkViewMethod(Talk talk, ModelAndView mv) {
		logger.info("talkView.do 실행. talk : " +  talk.getT_from_uno()+"," +talk.getT_to_uno());
		
		String sender = talk.getT_from_uno();
		String receiver = talk.getT_to_uno();		
		
		mv.setViewName("talk/talkView");
		//1.채팅/미션(chat)정보 출력		
		//1.1 미션 랜덤 생성
		String[] marr = {
			"같이 한강에서 야경 사진을 찍고 업로드하세요!",
			"같이 최근 개봉한 영화를 보고 사진을 찍어 업로드하세요!",
			"같이 스포츠를 관람하고 사진을 찍어 업로드하세요!",
			"같이 보드게임을 하고 사진을 찍어 업로드하세요!",
			"같이 노래방에 가서 사진을 찍어 업로드하세요!",
			"같이 불꽃놀이를 보고 사진을 찍어 업로드하세요!",
			"같이 축제에 가서 사진을 찍어 업로드하세요!",
			"같이 맛있는 식사를 하고 사진을 찍어 업로드하세요!",
			"같이 운동을 하고 사진을 찍어 업로드하세요!",
		};
		String randdomM = marr[new Random().nextInt(marr.length)];
		logger.info("들어갈 미션 확인. randdomM : " + randdomM);
		//1.2 맵에 넣기
		HashMap<String, Object> tcmap = new HashMap<String, Object>();
		tcmap.put("t_from_uno", sender);
		tcmap.put("t_to_uno", receiver);
		tcmap.put("c_mission", randdomM);		
		//1.3 chat정보 없을 경우 생성시도(있으면 -1 리턴)
		int insertResult = talkService.insertChat(tcmap);
		if(insertResult > 0) {
			logger.info("insertChat() 수행하고 옴. insertResult : " + insertResult);
		} else {
			logger.info("insertChat() 실패. 이미 chat 있음");				
		}
	
		//1.4 채팅/미션정보 출력
		Chat chat = talkService.getTalkChat(talk);
		logger.info(chat.toString());
		mv.addObject("chat",chat);
//		--------------------------------------------------------
	
		//1.5 채팅 r_count Update
		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm:ss");;
		Date now = new Date(); 
		logger.info(now.toString());
		int cReadUpdate = talkService.cReadUpdate(talk);
		logger.info("cReadUpdate : "+cReadUpdate);
//		//2. 대화(talk)정보 출력
		//from_uno/to_uno로 talkList 가져오기
		logger.info("chat정보 출력: " + chat.toString());
		List<Talk> talkList = new ArrayList<Talk>();
		talkList = talkService.getTalkList(chat);
		logger.info(" 대화(talkList)정보 출력: " + talkList.toString());
		
		if(talkList.size() > 0)  { 
		mv.addObject("talkList",talkList); 
		}else {
			logger.info("대화(talk)정보 출력 실패 : "+ talkList.toString());
		}
		
		
//		----------------------------------------------------------------
//		///////////////////////////////////////////////////////////
//		Object oneChat = new Object();
//		{
//		oneChat= getOneChat ()
//		if(result > 0 //from_uno/to_uno가 같은 chat 있으면 ) //
//			getOneChat () //이전에 있던 chat obj 하나 가져오기(채팅창 정보)
//		else없으면 
//			insertOneChat() 하기// 미션추가
//			getOneChat ()	
//		}
		
//		mv.addObject("Obj","Obj")
		
//		-------------------------------------------------------------------------
		//3. 상대 회원 정보 출력 + 상대 피드도 함께 출력
		//vo TalkPartner 만들기 c_to_no, c_to_uno의 기본정보
		TalkPartner talkPartner = talkService.getPatnerInfo(receiver);
		mv.addObject("talkPartner", talkPartner);
		logger.info(talkPartner.toString());

		
		return mv;
	}
	
	/*미션입력*/
	@RequestMapping(value="insertMission.do", method=RequestMethod.POST)
	public void insertMissionMethod(HttpServletRequest request, HttpServletResponse response,
			TalkMission talkMission, @RequestParam(name="ms_file", required=false) MultipartFile msfile) throws IOException {
		logger.info("insertMission.do 실행");
		logger.info("ms_uid : " +  request.getParameter("ms_uid"));
		logger.info("파일이름 : " + msfile.getOriginalFilename());
//		ms_uid ms_pid ms_cno ms_cmission
		
		//1. talkMission에 정보넣기  ms_uid ms_pid ms_cno ms_cmission set
		talkMission.setC_from_uno(request.getParameter("ms_uid"));
		talkMission.setC_to_uno(request.getParameter("ms_pid"));;
		talkMission.setC_no(request.getParameter("ms_cno"));
		talkMission.setC_mission(request.getParameter("ms_cmission")); 
		//logger.info("talkMission의 ms_uid set 확인 : " + talkMission.getC_from_uno());
	
		//2. talkMission에 이미지넣기  m_con set
		if(msfile.getOriginalFilename() != null) {
			//업로드된 원본 파일명 추출
			String originalFileName = msfile.getOriginalFilename();
			//board 객체에 원본파일명 기록함
			//TalkMission.setBoard_original_filename(originalFileName);
			
			//파일 저장 폴더 지정
			String path = request.getSession().getServletContext().getRealPath("resources/images/mission");
			
			// 첨부된 파일이 있다면 파일명 바꾸기함
			try {
				//먼저 원본파일을 폴더에 저장함 
				msfile.transferTo(new File(path + "\\" + originalFileName));
				
				// "년월일시분초.확장자" 로 변경해 봄
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
						+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);

				// 지정 폴더에 업로드된 파일명 바꾸기 : File 클래스 renameTo()
				File originFile = new File(path + "\\" + originalFileName);
				File renameFile = new File(path + "\\" + renameFileName);

				if (!originFile.renameTo(renameFile)) {
					// renameTo() 가 실패한 경우에는 직접 바꾸기함
					int read = -1;
					byte[] buf = new byte[1024];
					// 한번에 읽을 배열 크기 지정

					FileInputStream fin = new FileInputStream(originFile);
					FileOutputStream fout = new FileOutputStream(renameFile);

					while ((read = fin.read(buf, 0, buf.length)) != -1) {
						fout.write(buf, 0, read);
					}

					fin.close();
					fout.close();
					originFile.delete(); // 원본파일 삭제함
				}

//				TalkMission.setBoard_rename_filename(renameFileName);
				talkMission.setM_con(renameFileName);
			
			} catch (Exception e) {
				e.printStackTrace();
			}			
		} // 첨부파일이 있다면
		logger.info("talkMission저장정보 : " + talkMission.toString());
		//3 mission정보 검색후 없을 경우 업로드처리(있으면 -1 리턴)
		/*int result = boardService.insertBoard(board);*/
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int insertResult = talkService.insertMissionMethod(talkMission);
		if(insertResult > 0) {
			logger.info("insertMissionMethod() 수행하고 옴. insertResult : " + insertResult);
			out.append("success");
			out.flush();
		} else {
			logger.info("insertMissionMethod() 실패. 이미 chat 있음");				
			out.append("fail");
			out.flush();
		}
		out.close();
		
	
	}
	/*
	@RequestMapping("insertReport.do")
	public ModelAndView insertReport(TalkReport talkReport, ModelAndView mv) {
		// 회원신고
		int result = talkService.insertReport(talkReport);
		mv.setViewName("JsonView");
		
		if(result>0){
			mv.addObject("result", result);
		} else {
			logger.info("미션업로드실패");
			//동작보내기
		}
		
		return mv;
	}
		*/

		
/*chatView관련 -----------------------------------------------------------------*/		
	@RequestMapping("moveChat.do")
	public String moveChatMethod() {
		return "chat/chatListView";
	}
	//12
	//10
	@RequestMapping(value="chatList.do", method=RequestMethod.POST)
	public void chatListMethod(HttpServletResponse response, 
			@RequestParam("loginNo") String loginNo, 
			@RequestParam("btNum") String btNum) throws IOException {
		logger.info("chatList.do 실행. loginNo : " +  loginNo, ", btNum : " + btNum);
		int startRow = 1 + (Integer.parseInt(btNum)*6);
		int endRow = startRow + 5;
		HashMap<String, Object> cmap = new HashMap<String, Object>();
		cmap.put("loginNo", loginNo);
		cmap.put("startRow", startRow);
		cmap.put("endRow", endRow);
		
		List<TalkChat> chatList = new ArrayList<TalkChat>();
		chatList = talkService.chatListMethod(cmap);
		
		JSONObject jsonO = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		/*String c_no, String t_no, String t_con, String t_date, 
		String t_read, String t_from_uno,
		String t_to_uno, String c_from_uno, String c_to_uno, 
		String c_mission, String c_readc, String c_nreadc*/
		for(TalkChat talkChat : chatList) {
			logger.info("talkChat.getT_profile 확인 " + talkChat.getT_profile() );
			logger.info("loginNo 확인 : " + loginNo );
			logger.info("talkChat.getC_from_uno 확인 : " + talkChat.getC_from_uno() );
			// chat from/to uno 중에서 loginUser가 아닌 상대유저의 프로필이미지 가져와 talkChat에 넣기
			if(talkChat.getC_from_uno().equals(loginNo)) {
				// from이 loginUser인 경우
				TalkPartner partner = talkService.getPatnerInfo(talkChat.getC_to_uno());
				//가져온 프로필이 null인지 확인
				if(partner.getP_profileImg().equals(null)) {
					logger.info("1. 프로필없는 경우 ");
					talkChat.setT_profile("nullProfile.png");
				} else {
					logger.info("2. 프로필있는 경우 :   " + partner.getP_profileImg() );
					talkChat.setT_profile(partner.getP_profileImg());
				}
			} else {
				// to이 loginUser인 경우
				TalkPartner partner = talkService.getPatnerInfo(talkChat.getC_from_uno());
				if(partner.getP_profileImg().equals(null)) {
					logger.info("3. 프로필없는 경우 ");
					talkChat.setT_profile("nullProfile.png");
				} else {
					logger.info("4 . 프로필있는 경우 :   " + partner.getP_profileImg() );
					talkChat.setT_profile(partner.getP_profileImg());
				}
				/*talkChat.setT_profile(partner.getP_profileImg());
				logger.info("프로필 확인3 " + partner.getP_profileImg() );*/
			}

			logger.info(talkChat.toString());
			JSONObject job = new JSONObject();
			
			job.put("c_no", talkChat.getC_no());
			/*c_no t_no  t_con t_date t_read t_from_uno t_to_uno t_profile*/
			job.put("t_no", talkChat.getT_no());
			job.put("t_con", URLEncoder.encode(talkChat.getT_con(), "utf-8"));
			job.put("t_date", talkChat.getT_date().toString());
			if(talkChat.getT_read() == null) {
				job.put("t_read", "0");
			} else {
				job.put("t_read", talkChat.getT_read());
			}
			job.put("t_from_uno", talkChat.getT_from_uno());
			job.put("t_to_uno", talkChat.getT_to_uno());
			//프로필
			
			job.put("t_profile", URLEncoder.encode(talkChat.getT_profile(), "utf-8"));
			
			/*if(talkChat.getT_profile() == null) {
				job.put("u_rec_profile", URLEncoder.encode("nullProfile.png", "utf-8"));
			} else {
				job.put("t_profile", URLEncoder.encode(talkChat.getT_profile(), "utf-8"));
			}*/
//			job.put("c_from_uno", talkChat.getC_from_uno());
//			job.put("c_to_uno", talkChat.getC_to_uno());
//			job.put("c_mission", URLEncoder.encode(talkChat.getC_mission(), "utf-8"));
//			job.put("c_readc", URLEncoder.encode(talkChat.getC_readc(), "utf-8"));
//			job.put("c_nreadc", URLEncoder.encode(talkChat.getC_nreadc(), "utf-8"));
			jarr.add(job);
		}
		jsonO.put("list", jarr);
		logger.info("jarr 들어간 jsonO 객체 확인 : " + jsonO.toJSONString());
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		out.println(jsonO.toJSONString());
		out.flush();
		out.close();
		//mv.addObject("chatList", chatList);		
	}
	
	
	
/*	@RequestMapping("chatList.do")
	public ModelAndView chatListMethod(ModelAndView mv, HttpSession session,
			AllUsers allUsers) {
		allUsers = (AllUsers)session.getAttribute("loginMember");
		int startNo = 1;
		logger.info("chatList 실행, allUser(로그인객체) : " + allUsers.getU_no()+", startNo : " +startNo);
		
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("startNo", startNo);
		
		List<Chat> chatList = new ArrayList<Chat>();
		chatList = chatService.chatListMethod(map);
				
		mv.addObject("chatList", "chatList");
		mv.setViewName("JsonView");
		mv.setViewName("chat/chatListView");
		
		return mv;
	};*/
	
/*myMissionListView관련 -----------------------------------------------------------------*/	
	@RequestMapping(value="userMission.do")
	public ModelAndView userMissionMetion(ModelAndView mv,
			@RequestParam("login_no") String loginNo,
			@RequestParam("page") String page) {
		logger.info("userMission.do 실행. loginNo값 : " + loginNo, ", page : " + page);
		
		//페이징
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		int limit = 10; //한 페이지 목록 수 
		
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit -1;
		
		//회원미션내역 리스트
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("loginNo", loginNo);
		
		logger.info("startRow : " + startRow, ", endRow : " + endRow);
				
				
		List<TalkMission> MissionList = new ArrayList<TalkMission>();
		MissionList = talkService.userMissionList(map);		
		int listCount = 0; // 총 목록 수
		
		//총 목록 수 구하기
		if (MissionList != null ) {
			listCount = Integer.parseInt(MissionList.get(0).getListcount());
			
			logger.info("MissionList : " + MissionList.toString());
		} else {
			logger.info("MissionList 를 받아오지 못함");
		}
	
		//m_con 찾기 //결과 넣기
		for(TalkMission talkMission : MissionList) {
			logger.info("TalkMission.m_con 확인 " + talkMission.getM_con() );
			// 없으면 기본이미지 넣기
			if(talkMission.getM_con() == null) {
				logger.info("userMission list 이미지없음");
				talkMission.setM_con("noImage.jpg");
			} 
			
			if (talkMission.getM_sta().equals("1")){
				talkMission.setM_sta("성공");
			} else if(talkMission.getM_sta().equals("0")) {
				logger.info("mission sta :  null");
				talkMission.setM_sta("미결");
			} else {
				talkMission.setM_sta("실패");
			}
		}	
		
		logger.info("listCount : " + listCount);
		int maxPage = (int)((double)listCount/limit + 0.9);
		int startPage = (int)((double)currentPage/limit + 0.9);
		int endPage = startPage + limit -1;
		
		if(maxPage <endPage) {
			endPage = maxPage;
		}
		logger.info("maxPage : " + maxPage + ", currentPage :" + currentPage 
				+", startPage : " +startPage +", endPage : " +endPage);
		if(MissionList != null && MissionList.size() >0) {
			mv.addObject("list", MissionList);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);

		} else {
			mv.addObject("message", currentPage + "페이지 조회가 실패했습니다. 새로고침해주십시오.");
		}
	
		/*mv.addObject("MissionList", MissionList);*/
		mv.setViewName("mission/myMissionListView");
		return mv;
	} 

	/*검색*/
	@RequestMapping(value="userMSearch.do")
	public ModelAndView userMSearch(ModelAndView mv,
			Search search) {
		String keyword = search.getKeyword();
		String type = search.getType();
		String page = search.getPage();
		String loginNo = search.getU_no();
		logger.info("keyword: " + keyword + ", type: " + type
				+ ", page: " + page + ", loginNo: " + loginNo);
		
		if(type.equals("m_sta") && keyword.equals("미결")) {
			keyword = "0";
		} else if (type.equals("m_sta") && keyword.equals("성공")){
			keyword = "1";
		} else if (type.equals("m_sta") && keyword.equals("실패")){
			keyword = "2";
		}
		logger.info("mission sta 검색시 keyword값 : " + keyword);
		//페이징
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		int limit = 10; //한 페이지 목록 수 
		
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit -1;
		
		//회원미션내역 리스트
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("loginNo", loginNo);
		map.put("type", type);
		map.put("keyword", keyword);
		
		logger.info("startRow : " + startRow+ ", endRow : " + endRow);
				
				
		List<TalkMission> MissionList = new ArrayList<TalkMission>();
		
		
		MissionList = talkService.userMSearchList(map);		
		int listCount = 0; // 총 목록 수
		logger.info("MissionList 를 받아오지 못함");
		//총 목록 수 구하기
		if (MissionList.size() != 0) {
			listCount = Integer.parseInt(MissionList.get(0).getListcount());
			
			logger.info("MissionList : " + MissionList.toString());
			
			//m_con 찾기 //결과 넣기
			for(TalkMission talkMission : MissionList) {
				logger.info("TalkMission.m_con 확인 " + talkMission.getM_con() );
				// 없으면 기본이미지 넣기
				if(talkMission.getM_con() == null) {
					logger.info("userMission list 이미지없음");
					talkMission.setM_con("noImage.jpg");
				} 
				
				if(talkMission.getM_sta().equals("0")) {
					logger.info("mission sta :  null");
					talkMission.setM_sta("미결");
				} else if (talkMission.getM_sta().equals("1")){
					talkMission.setM_sta("성공");
				} else {
					talkMission.setM_sta("실패");
				}
			}
		} else {
			
			logger.info("MissionList 를 받아오지 못함2");
		} 
	
	
		
		logger.info("listCount : " + listCount);
		int maxPage = (int)((double)listCount/limit + 0.9);
		int startPage = (int)((double)currentPage/limit + 0.9);
		int endPage = startPage + limit -1;
		
		if(maxPage <endPage) {
			endPage = maxPage;
		}
		logger.info("maxPage : " + maxPage + ", currentPage :" + currentPage 
				+", startPage : " +startPage +", endPage : " +endPage);
		if(MissionList != null && MissionList.size() >0) {
			mv.addObject("list", MissionList);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);

		} else {
			if(type.equals("u.u_name")) {
				mv.addObject("type", "상대회원");
			} else if (type.equals("c_mission")){
				mv.addObject("type", "미션");
			} else if (type.equals("m_con")){
				mv.addObject("type", "이미지");
			} else{
				mv.addObject("type", "결과");
			} 
			
			mv.addObject("listCount", listCount);
			mv.addObject("keyword", keyword);

			mv.addObject("listCount", listCount);
		}
		
		
		//mv.addObject("list", "list");
		mv.setViewName("mission/myMissionListView");
		return mv;
	}
	
// adminMission.do 관련 --------------------------------------------------------
	@RequestMapping(value="adminMission.do")
	public ModelAndView adminMissionMetion(ModelAndView mv,
			@RequestParam("page") String page) {
		logger.info("adminMission.do 실행. page : " + page);
		
		//페이징
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		int limit = 10; //한 페이지 목록 수 
		
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit -1;
		
		//회원미션내역 리스트
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		logger.info("startRow : " + startRow, ", endRow : " + endRow);
				
			
		List<TalkMission> MissionList = new ArrayList<TalkMission>();
		MissionList = talkService.adminMissionList(map);		
		int listCount = 0; // 총 목록 수
		
		//총 목록 수 구하기
		if (MissionList != null ) {
			listCount = Integer.parseInt(MissionList.get(0).getListcount());
			
			logger.info("MissionList : " + MissionList.toString());
		} else {
			logger.info("MissionList 를 받아오지 못함");
		}
	
		//m_con 찾기 //결과 넣기
		for(TalkMission talkMission : MissionList) {
			logger.info("TalkMission.m_con 확인 " + talkMission.getM_con() );
			// 없으면 기본이미지 넣기
			if(talkMission.getM_con() == null) {
				logger.info("userMission list 이미지없음");
				talkMission.setM_con("noImage.jpg");
			} 
			
			if (talkMission.getM_sta().equals("1")){
				talkMission.setM_sta("성공");
			} else if(talkMission.getM_sta().equals("0")) {
				logger.info("mission sta :  null");
				talkMission.setM_sta("미결");
			} else {
				talkMission.setM_sta("실패");
			}
		}	
		
		logger.info("listCount : " + listCount);
		int maxPage = (int)((double)listCount/limit + 0.9);
		int startPage = (int)((double)currentPage/limit + 0.9);
		int endPage = startPage + limit -1;
		
		if(maxPage <endPage) {
			endPage = maxPage;
		}
		logger.info("maxPage : " + maxPage + ", currentPage :" + currentPage 
				+", startPage : " +startPage +", endPage : " +endPage);
		if(MissionList != null && MissionList.size() >0) { 
			mv.addObject("list", MissionList);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);

		} else {
			mv.addObject("message", currentPage + "페이지 조회가 실패했습니다. 새로고침해주십시오.");
		}
	
		/*mv.addObject("list", "list");
		mv.addObject("listCount", 	1);
		mv.addObject("maxPage", 12);
		mv.addObject("currentPage", 1);
		mv.addObject("startPage", 1);
		mv.addObject("endPage", 9);
		mv.addObject("limit", limit);*/
		/*mv.addObject("MissionList", MissionList);*/
		mv.setViewName("mission/adminMissionListView");
		return mv;
	} 

	/*검색*/
	@RequestMapping(value="adminMSearch.do")
	public ModelAndView adminMSearch(ModelAndView mv,
			Search search) {
		String keyword = search.getKeyword();
		String type = search.getType();
		String page = search.getPage();
		String loginNo = search.getU_no();
		logger.info("keyword: " + keyword + ", type: " + type
				+ ", page: " + page + ", loginNo: " + loginNo);
		
		if(type.equals("m_sta") && keyword.equals("미결")) {
			keyword = "0";
		} else if (type.equals("m_sta") && keyword.equals("성공")){
			keyword = "1";
		} else if (type.equals("m_sta") && keyword.equals("실패")){
			keyword = "2";
		}
		logger.info("mission sta 검색시 keyword값 : " + keyword);
		//페이징
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		int limit = 10; //한 페이지 목록 수 
		
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit -1;
		
		//회원미션내역 리스트
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		//map.put("loginNo", loginNo);
		map.put("type", type);
		map.put("keyword", keyword);
		
		logger.info("startRow : " + startRow+ ", endRow : " + endRow);
				
				
		List<TalkMission> MissionList = new ArrayList<TalkMission>();
		
		
		MissionList = talkService.adminMSearchList(map);		
		int listCount = 0; // 총 목록 수
		logger.info("MissionList 를 받아오지 못함");
		//총 목록 수 구하기
		if (MissionList.size() != 0) {
			listCount = Integer.parseInt(MissionList.get(0).getListcount());
			
			logger.info("MissionList : " + MissionList.toString());
			
			//m_con 찾기 //결과 넣기
			for(TalkMission talkMission : MissionList) {
				logger.info("TalkMission.m_con 확인 " + talkMission.getM_con() );
				// 없으면 기본이미지 넣기
				if(talkMission.getM_con() == null) {
					logger.info("userMission list 이미지없음");
					talkMission.setM_con("noImage.jpg");
				} 
				
				if(talkMission.getM_sta().equals("0")) {
					logger.info("mission sta :  null");
					talkMission.setM_sta("미결");
				} else if (talkMission.getM_sta().equals("1")){
					talkMission.setM_sta("성공");
				} else {
					talkMission.setM_sta("실패");
				}
			}
		} else {
			
			logger.info("MissionList 를 받아오지 못함2");
		} 
	
	
		
		logger.info("listCount : " + listCount);
		int maxPage = (int)((double)listCount/limit + 0.9);
		int startPage = (int)((double)currentPage/limit + 0.9);
		int endPage = startPage + limit -1;
		
		if(maxPage <endPage) {
			endPage = maxPage;
		}
		logger.info("maxPage : " + maxPage + ", currentPage :" + currentPage 
				+", startPage : " +startPage +", endPage : " +endPage);
		if(MissionList != null && MissionList.size() >0) {
			mv.addObject("list", MissionList);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);

		} else {
			if(type.equals("u.u_name")) {
				mv.addObject("type", "상대회원");
			} else if (type.equals("c_mission")){
				mv.addObject("type", "미션");
			} else if (type.equals("m_con")){
				mv.addObject("type", "이미지");
			} else{
				mv.addObject("type", "결과");
			} 
			
			mv.addObject("listCount", listCount);
			mv.addObject("keyword", keyword);

			mv.addObject("listCount", listCount);
		}
		
		
		//mv.addObject("list", "list");
		mv.setViewName("mission/adminMissionListView");
		return mv;
	}
	
//adminMDetail----------------------------	
	@RequestMapping("adminMDetail.do")
	public ModelAndView adminMDetailMethod (ModelAndView mv,
			TalkMission talkMission) {
		logger.info("adminMDetail 실행. c_from_uno : " + talkMission.getC_from_uno() 
		+ ", c_to_uno : " +talkMission.getC_to_uno() );
		talkMission = talkService.adminMDetailMethod(talkMission);
		logger.info("adminMDetailMethod 다녀옴. c_from_uno : " + talkMission.getC_from_uno() 
		+ ", c_to_uno : " +talkMission.getC_to_uno() );
		if(talkMission.getM_sta().equals("0")) {
			logger.info("mission sta :  null");
			talkMission.setM_sta("미결");
		} else if (talkMission.getM_sta().equals("1")){
			talkMission.setM_sta("성공");
		} else {
			talkMission.setM_sta("실패");
		}		
		mv.addObject("talkMission", talkMission);
		mv.setViewName("mission/adminMissionDetailView");
		
		return mv;
	}
	
	//관리자 미션상세 미션상태 ajax
	@RequestMapping(value="mstaMethod.do", method=RequestMethod.POST)
	public void mstaMethod(HttpServletResponse response,
			@RequestParam("c_from_uno") String c_from_uno, 
			@RequestParam("c_to_uno") String c_to_uno) throws IOException{
		logger.info("mstaMethod 실행. c_from_uno : " + c_from_uno
				+ ", c_to_uno : " +c_to_uno);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("c_from_uno", c_from_uno);
		map.put("c_to_uno", c_to_uno);
		
		TalkMission talkMission = new TalkMission();
		talkMission = talkService.mstaMethod(map);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
	
		
		if(talkMission.getM_sta().equals("0")) {
			logger.info("talkMission.getM_sta() : " + talkMission.getM_sta());
			out.append("0");
			out.flush();
		} else if (talkMission.getM_sta().equals("1")){
			logger.info("talkMission.getM_sta() : " + talkMission.getM_sta());				
			out.append("1");
			out.flush();
		} else {
			logger.info("talkMission.getM_sta() : " + talkMission.getM_sta());				
			out.append("2");
			out.flush();
		}
		out.close();
	}
	//관리자 미션상세 미션상태변경
	@RequestMapping(value="mstaUpdate.do", method=RequestMethod.POST)
	public void mstaUpdateMethod (HttpServletResponse response,
			@RequestParam("c_from_uno") String c_from_uno, 
			@RequestParam("c_to_uno") String c_to_uno, 
			@RequestParam("btnVal") String btnval) throws IOException {
		logger.info("mstaUpdate 실행. c_from_uno : " + c_from_uno
		+ ", c_to_uno : " +c_to_uno + ", btnval : " +btnval );
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("c_from_uno", c_from_uno);
		map.put("c_to_uno", c_to_uno);
		map.put("btnval", btnval);
		
		//TalkMission talkMission = new TalkMission();
		int updateResult = talkService.mstaUpdateMethod(map);
		//updateResult = Integer.parseInt(talkMission.getM_sta());
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
	
		if(updateResult > 0) {
			logger.info("insertMissionMethod() 수행하고 옴. insertResult : " + updateResult);
			out.append("success");
			out.flush();
		} else {
			logger.info("insertMissionMethod() 실패. 이미 chat 있음");				
			out.append("fail");
			out.flush();
		}
		out.close();
	}

	
	
}	