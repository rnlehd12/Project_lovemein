package bclass.finalproject.lovemein.talk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bclass.finalproject.lovemein.talk.model.service.TalkService;
import bclass.finalproject.lovemein.talk.model.vo.Chat;
import bclass.finalproject.lovemein.talk.model.vo.Talk;
import bclass.finalproject.lovemein.talk.model.vo.TalkChat;
import bclass.finalproject.lovemein.talk.model.vo.TalkPartner;

@Controller
public class TalkController {
	
	@Autowired
	private TalkService talkService;
	
	private static final Logger logger = LoggerFactory.getLogger(TalkController.class);

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
		HashMap<String, Object> tcmap = new HashMap<>();
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
	
//		//2. 대화(talk)정보 출력
		//from_uno/to_uno로 oneTalk 가져오기
		//List<Talk> talkList = new ArrayList<Talk>();
		//talkList = talkService.getTalk(talk);
		
//		onetalk !=null { 
//		mv.addObject("onetalk","onetalk"); 
//		}else {
//		 
//		}
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
//		-----------------------------------------------------------
	
		//채팅입력
		//int result = talkService.insetTalk(talk);
		
		//if(result > 0) {
		//	List<Talk> readTalkList = new ArrayList<Talk>();
		//	readTalkList = talkService.readTalk(talk);
		//	mv.addObject("readTalkList",readTalkList);
		//}
	
		
		return mv;
	}

	/*
	@RequestMapping("insertMission.do")
	public ModelAndView insertUserMission(TalkMission talkMission, ModelAndView mv) {
		// 회원미션업로드
		int result = talkService.insertUserMission(talkMission);
		if(result>0){
			mv.addObject("result", result);
		} else {
			logger.info("미션업로드실패");
			//동작보내기
		}
			
		mv.setViewName("JsonView");
		
		return mv;
	}
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
		
	public ModelAndView userMissionList(TalkMission talkMission, ModelAndView mv) {
		//회원미션내역 리스트
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", "");
		
		List<TalkMission> MissionList = new ArrayList<TalkMission>();
		MissionList = talkService.userMissionList(map);
		
		mv.addObject("MissionList", MissionList);
		
		mv.setViewName("mission/myMissionListView");
		
		return mv;
	}

		*/
	
	////////////////////////////chat
		
	@RequestMapping("moveChat.do")
	public String moveChatMethod() {
		return "chat/chatListView";
	}

	@RequestMapping(value="chatList.do", method=RequestMethod.POST)
	public void chatListMethod(HttpServletResponse response, 
			@RequestParam("loginNo") String loginNo, 
			@RequestParam("btNum") String btNum) throws IOException {
		logger.info("chatList.do 실행. loginNo : " +  loginNo, ", btNum : " + btNum);
		int startRow = 1 + (Integer.parseInt(btNum)*10);
		int endRow = startRow + 9;
		HashMap<String, Object> cmap = new HashMap<>();
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
			
			// chat from/to uno 중에서 loginUser 뺀 나머지 유저의 프로필이미지 넣기
			if(talkChat.getC_from_uno() == loginNo) {
				TalkPartner partner = talkService.getPatnerInfo(talkChat.getC_no());
				talkChat.setT_profile(partner.getP_profileImg());
			} else {
				TalkPartner partner = talkService.getPatnerInfo(talkChat.getC_from_uno());
				talkChat.setT_profile(partner.getP_profileImg());
			}

			logger.info(talkChat.toString());
			JSONObject job = new JSONObject();
			
			job.put("c_no", talkChat.getC_no());
			/*c_no t_no  t_con t_date t_read t_from_uno t_to_uno t_profile*/
			job.put("t_no", talkChat.getT_no());
			job.put("t_con", URLEncoder.encode(talkChat.getT_con(), "utf-8"));
			job.put("t_date", talkChat.getT_date());
			if(talkChat.getT_profile() == null) {
				job.put("t_read", "0");
			} else {
				job.put("t_read", talkChat.getT_read());
			}
			job.put("t_from_uno", talkChat.getT_from_uno());
			job.put("t_to_uno", talkChat.getT_to_uno());
			if(talkChat.getT_profile() == null) {
				job.put("u_rec_profile", URLEncoder.encode("nullProfile.png", "utf-8"));
			} else {
				job.put("t_profile", URLEncoder.encode(talkChat.getT_profile(), "utf-8"));
			}
//			job.put("c_from_uno", talkChat.getC_from_uno());
//			job.put("c_to_uno", talkChat.getC_to_uno());
//			job.put("c_mission", URLEncoder.encode(talkChat.getC_mission(), "utf-8"));
//			job.put("c_readc", URLEncoder.encode(talkChat.getC_readc(), "utf-8"));
//			job.put("c_nreadc", URLEncoder.encode(talkChat.getC_nreadc(), "utf-8"));
			jarr.add(job);
		}
		jsonO.put("list", jarr);
		
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
	
	
	
	
	
}	
	
	
	
	
