package bclass.finalproject.lovemein.talk.controller;

import java.util.HashMap;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bclass.finalproject.lovemein.talk.model.service.TalkService;
import bclass.finalproject.lovemein.talk.model.vo.Talk;
import bclass.finalproject.lovemein.talk.model.vo.TalkChat;

@Controller
public class TalkController {
	
	@Autowired
	private TalkService talkService;
	
	private static final Logger logger = LoggerFactory.getLogger(TalkController.class);

	private String sender = null;
	private String receiver = null;
	
	@RequestMapping("talk.do")
	public ModelAndView talkViewMethod(Talk talk, ModelAndView mv) {
		logger.info("talk.do 실행. talk : " +  talk.getC_from_uno()+"," +talk.getC_to_uno());
		sender = talk.getC_from_uno();
		receiver = talk.getC_to_uno();
		
		mv.setViewName("talk/talkView");
		//1.chat정보 없을 경우 생성시도(미션만들고 + insert), 2. 채팅/미션정보 출력
		
		//1.chat정보 없을 경우 생성시도(있으면 -1 리턴)
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
		tcmap.put("c_from_uno", talk.getC_from_uno());
		tcmap.put("c_to_uno", talk.getC_to_uno());
		tcmap.put("c_mission", randdomM);
		
		int insertResult = talkService.insertChat(tcmap);
		if(insertResult > 0) {
			logger.info("insertChat() 수행하고 옴. insertResult : " + insertResult);
		} else {
			logger.info("insertChat() 실패. 이미 chat 있음");
				
		}
		
		
		//2. 채팅/미션정보 출력
		TalkChat talkChat = talkService.getTalkChat(talk);
		logger.info(talkChat.toString());
		mv.addObject("talkChat",talkChat);
//		--------------------------------------------------------
		
//		//대화정보 리스트
		//from_uno/to_uno로 oneTalk 가져오기
	/*	List<Talk> oneTalk = new ArrayList<Talk>();
		oneTalk = talkService.getTalk(talk);*/
		
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
//		//상대 기본정보 가져오기
		//상대회원정보 출력
//		//vo TalkPartner 만들기 c_to_no, c_to_uno의 기본정보
		//TalkPartner partnerInfo = talkService.getPatnerInfo(talk.getC_to_uno());
		//mv.addObject("partnerInfo ", partnerInfo );
//		-----------------------------------------------------------
//		// 상대 최근피드 가져오기
		//상대회원피드 출력
//		//vo TalkFeed 만들기 c_to_no, 최근피드사진
		//TalkPartner partnerFeed = talkService.getPartnerFeed(talk.getC_to_uno());
		//if(partnerFeed != null) {
		// mv.addObject("partnerFeed",partnerFeed);
		//} else {
		//mv.addObject("partnerFeed", "");
		//빈이미지
		//}
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
	
}
