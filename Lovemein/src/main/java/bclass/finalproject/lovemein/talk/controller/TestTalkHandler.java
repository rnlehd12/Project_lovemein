package bclass.finalproject.lovemein.talk.controller;

public class TestTalkHandler {
	@Autowired
	private ChatDAO dao;
	private List<WebSocketSession> connectedUsers;
	public ChatWebSocketHandler() {
	      connectedUsers = new ArrayList<WebSocketSession>();
	   }
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(
			WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨!!");
		users.put(session.getId(), session); // 맵에 유저아이디와 웹소켓 넣기
		connectedUsers.add(session); //리스트에 넣기
	}//연결시 :유저아이디와 웹소켓을 받아와서 맵에 넣고 맵을 리스트에 넣기
	
	
	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + " 연결 종료됨");
		connectedUsers.remove(session);
		users.remove(session.getId()); /// 맵에서 제거
	} /// 연결종료시
	
	@Override
	   protected void handleTextMessage(WebSocketSession session, 
			   TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		
		  Map<String, Object> map = null; ///맵생성
	      MessageVO messageVO = MessageVO.convertMessage(message.getPayload());
	      System.out.println("1 : " + messageVO.toString()); /// 메시지 변환?
	      ChatRoomVO roomVO  = new ChatRoomVO();
	      
	      roomVO.setCLASS_class_id(messageVO.getCLASS_class_id()); //클래스
	      roomVO.setTUTOR_USER_user_id(messageVO.getTUTOR_USER_user_id()); //튜터
	      roomVO.setUSER_user_id(messageVO.getUSER_user_id()); //유저
	      ChatRoomVO croom =null;
	      if(!messageVO.getUSER_user_id().equals(messageVO.getTUTOR_USER_user_id())) {
	    	  System.out.println("a");
	    	  if(dao.isRoom(roomVO) == null ) {
	    		  System.out.println("b");
	    		  dao.createRoom(roomVO);
	    		  System.out.println("d");
	    		  croom = dao.isRoom(roomVO);
	    	  }else {
	    		  System.out.println("C");
	    		  croom = dao.isRoom(roomVO);
	    	  }
	      }else {
    		  croom = dao.isRoom(roomVO);
    	  }
	      messageVO.setCHATROOM_chatroom_id(croom.getChatroom_id());
	      if(croom.getUSER_user_id().equals(messageVO.getMessage_sender())) {

	    	  messageVO.setMessage_receiver(roomVO.getTUTOR_USER_user_id());
	      }else {
	    	  messageVO.setMessage_receiver(roomVO.getUSER_user_id());
	      }




	      for (WebSocketSession websocketSession : connectedUsers) {
	         map = websocketSession.getAttributes();
	         UserVO login = (UserVO) map.get("login");

	         //받는사람
	         if (login.getUser_id().equals(messageVO.getMessage_sender())) {

	            Gson gson = new Gson();
	            String msgJson = gson.toJson(messageVO);
	            websocketSession.sendMessage(new TextMessage(msgJson));
	         }


	      }
	   }

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);

	}

}
