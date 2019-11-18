package bclass.finalproject.lovemein.talk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import bclass.finalproject.lovemein.talk.model.service.TalkService;

public class TalkHandler extends TextWebSocketHandler {
	
	@Autowired
	private TalkService talkService;
	
	private static final Logger logger = LoggerFactory.getLogger(TalkHandler.class);
	
	private List<WebSocketSession> socketSessionList;
	public TalkHandler() {
		socketSessionList = new ArrayList<WebSocketSession>();
	}
	private HashMap<String, WebSocketSession> umap = new HashMap<String, WebSocketSession>();
	
	
	
	//session 연결 처리
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("session 연결됨!!!!!!!");
		//logger.info("연결" + session.getId());
		//umap.put(session.getId(), session);
		socketSessionList.add(session);
	}
	
	//session 닫기 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info(session.getId() + "의 session 연결 종료됨");
		socketSessionList.remove(session);
		//umap.remove(session.getId());
	}
	
	//메시지 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		logger.info(session.getId() + "가 전송한 text : " + message.getPayload());
		for(WebSocketSession websocketSession : socketSessionList) {
			//Gson gson = new Gson();
            //String msgJson = gson.toJson(messageVO);
            websocketSession.sendMessage(new TextMessage(message.getPayload()));
			
		}
	}



	//session 에러 처리
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
	}
	
	
	
	
	
	
	
}
