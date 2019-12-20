//
//public class ChatWebSocketHandler extends TextWebSocketHandler {
//
//	@Inject
//	private ChatDAO dao;
//
//	private List<WebSocketSession> connectedUsers;
//
//	public ChatWebSocketHandler() {
//	      connectedUsers = new ArrayList<WebSocketSession>();
//	   }
//
//	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
//
//	@Override
//
//	public void afterConnectionEstablished(
//
//			WebSocketSession session) throws Exception {
// /* message.message_content = $("#message").val()
//  message.TUTOR_USER_user_id = '${TUTOR_USER_user_id}'
//  message.USER_user_id = '${profile.user_id}'
//  message.CLASS_class_id = '${class_id}'
//  message.message_sender = '${profile.user_id}'*/
//		log(session.getId() + " 연결 됨!!");
//
//		users.put(session.getId(), session);
//		connectedUsers.add(session);
//	}
//
//	@Override
//
//	public void afterConnectionClosed(
//
//			WebSocketSession session, CloseStatus status) throws Exception {
//
//		log(session.getId() + " 연결 종료됨");
//		connectedUsers.remove(session);
//		users.remove(session.getId());
//
//	}
//
//
//	@Override
//	   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//
//		System.out.println(message.getPayload());
//
//		  Map<String, Object> map = null;
//		  
//		  //전송온 정보를 json을 Gson으로 바꿈(talkvO에 java object로 저장됨)
//	      MessageVO messageVO = MessageVO.convertMessage(message.getPayload());
//	      
//	      //바꾼 내용 확인
//	      System.out.println("1 : " + messageVO.toString());
//
//	      //chatvo에 set으로 유저,방정보,상대 이름 넣기
//	      ChatRoomVO roomVO  = new ChatRoomVO();
//	      roomVO.setCLASS_class_id(messageVO.getCLASS_class_id()); //클래스
//	      roomVO.setTUTOR_USER_user_id(messageVO.getTUTOR_USER_user_id()); //튜터
//	      roomVO.setUSER_user_id(messageVO.getUSER_user_id()); //유저
//	      
//	      //chatvo에 있는 정보로 chat방 없으면 만들고 있으면 방정보 전부 가져오기
//	      ChatRoomVO croom =null;
//	      if(!messageVO.getUSER_user_id().equals(messageVO.getTUTOR_USER_user_id())) {
//	    	  //본인한테 보내는지 확인
//	    	  System.out.println("a");
//	    	  if(dao.isRoom(roomVO) == null ) {
//	    		  System.out.println("b");
//	    		  dao.createRoom(roomVO);
//	    		  System.out.println("d");
//	    		  croom = dao.isRoom(roomVO);
//	    	  }else {
//	    		  System.out.println("C");
//	    		  croom = dao.isRoom(roomVO);
//	    	  }
//	      }else {
//    		  croom = dao.isRoom(roomVO);
//    	  }
//	      
//	      //가져온 방 정보중 chat id도 talkvO에 넣기
//	      messageVO.setCHATROOM_chatroom_id(croom.getChatroom_id());
//	      //chat정보에서 chat의 fromuno가  메시지 보낸 사람인지, touno가 메시지 보낸 사람인지 확인
//	      if(croom.getUSER_user_id().equals(messageVO.getMessage_sender())) {
//	    	  
//	    	  //남은 한사람을 talkvo에 메시지 받는 사람 찾아서 넣기
//	    	  messageVO.setMessage_receiver(roomVO.getTUTOR_USER_user_id());
//	      }else {
//	    	  messageVO.setMessage_receiver(roomVO.getUSER_user_id());
//	      }
//	      
//	      
//	      //for문으로 소켓세션반복해서
//	      for (WebSocketSession websocketSession : connectedUsers) {
//	    	  // map에서 userid와 session 정보를 꺼내기
//	         map = websocketSession.getAttributes();
//	         UserVO login = (UserVO) map.get("login");
//
//	         ///받는사람
//	         //로그인한유저가 메시지 보낸유저와 같으면 
//	         if (login.getUser_id().equals(messageVO.getMessage_sender())) {
//
//	        	 //gson을 사용하여 javaObject를 다시 json으로 바꾸고
//	            Gson gson = new Gson();
//	            String msgJson = gson.toJson(messageVO);
//	         
//	            //session에 넣어서 메시지를 보냄
//	            websocketSession.sendMessage(new TextMessage(msgJson));
//	         }
//
//
//	      }
//	   }
//
//	@Override
//
//	public void handleTransportError(
//
//			WebSocketSession session, Throwable exception) throws Exception {
//
//		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
//
//	}
//
//	private void log(String logmsg) {
//
//		System.out.println(new Date() + " : " + logmsg);
//
//	}
//
//}