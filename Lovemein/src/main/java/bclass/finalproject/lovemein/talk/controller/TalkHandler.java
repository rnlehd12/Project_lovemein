package bclass.finalproject.lovemein.talk.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import bclass.finalproject.lovemein.talk.model.service.TalkService;
import bclass.finalproject.lovemein.talk.model.vo.Talk;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;

public class TalkHandler extends TextWebSocketHandler {
	
	@Autowired
	private TalkService talkService;
	
	private static final Logger logger = LoggerFactory.getLogger(TalkHandler.class);
	
	private List<WebSocketSession> socketSessionList; //세션 정보를 넣을 list
	
	public TalkHandler() {
		socketSessionList = new ArrayList<WebSocketSession>();
	}
	
	
	private HashMap<String, WebSocketSession> umap = new HashMap<String, WebSocketSession>();
	// 아이디와 세선정보를 넣을 map
	
	
	//session 연결 처리
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("session 연결됨!!!!!!!");
		logger.info("연결 + 연결 userid : " + session.getId());
		//list와 map에 저장
		umap.put(session.getId(), session);
		socketSessionList.add(session);
	}
	
	//session 닫기 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info(session.getId() + "의 session 연결 종료됨");
		
		//list와 map에서 삭제
		socketSessionList.remove(session);
		umap.remove(session.getId());
	}
	
	//메시지 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//사용자가 작성한 메시지 내용 : getPayload()으로 가져오기
		logger.info(session.getId() + "가 전송한 text(JSON으로 옴) : " + message.getPayload());
		
		//빈 map 생성
		Map<String, Object> map = null;
		
		//json을 Gson으로 바꿈
		Talk talk = Talk.convertMessage(message.getPayload());
	      
	    //바꾼 내용(GSON: javaObject talk객체로 바꿈) 확인
		System.out.println("GSON으로 변환된 text : " + talk.toString());
		
		//x: 바꾼 talk 객체로 chat 정보 가져오기
		/*c_no u_no p_no textInpu*/
		//바꾼 talk 객체로 talk insert 처리
		/////(가져온 talk에서 talk 객체의 fromuno가  메시지 보낸 사람인지, touno가 메시지 보낸 사람인지 확인)
		/////남은 한사람을 talvo에 메시지 받는 사람 찾아서 넣기
		
		//talk정보 없을 경우 생성시도(있으면 -1 리턴)
		int insertResult = talkService.insertTalk(talk);
		Talk OneTalk = null;
		if(insertResult > 0) {
			logger.info("insertChat() 수행하고 옴. insertResult : " + insertResult);
			System.out.println("GSON으로 변환된 text : " + talk.toString());
			OneTalk = talkService.getOneTalk(talk);
			logger.info("getOneTalk() 수행하고 옴. OneTalk : " + OneTalk.toString());
		} else {
			logger.info("insertChat() 실패. 이미 chat 있음");				
		}
		
		
		//talk socketSession  처리
		for(WebSocketSession websocketSession : socketSessionList) {
			//getAttributes로 소켓에 담긴 아이디 가져와서 umap 정보 불러오기
			map = websocketSession.getAttributes();
			AllUsers loginMember = (AllUsers)map.get("loginMember");
			logger.info("for문 안에서 getAttributes map AllUsers 정보 : " + loginMember.getU_no());
			logger.info("for문 안에서 getAttributes String map 정보 : " + map.toString());
			logger.info("for문 안에서 talk getT_from_uno정보 : " + talk.getT_from_uno());
			
			//if (loginMember.getU_no().equals(OneTalk.getT_from_uno())) {
				Gson gson = new Gson();
	            String msgJson = gson.toJson(talk);
	         //   websocketSession.sendMessage(new TextMessage(msgJson));
	            websocketSession.sendMessage(new TextMessage(message.getPayload()));
			//}	
		}
		
		
	}



	//session 에러 처리
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
		//super.handleTransportError(session, exception);
	}
	
	private void log(String logmsg) {

		System.out.println(new Date() + " : " + logmsg);

	}
	
	
	
	
	
}
