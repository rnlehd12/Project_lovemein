package bclass.finalproject.lovemein.talk.controller;

public class testvo1 {
/*메시지vo*/
	public class MessageVO {	
		private String message_id;
		private String message_sender;
		private String message_receiver;
		private String message_content;
		private Date message_sendTime;
		private Date message_readTime;
		private String CHATROOM_chatroom_id;
		private String USER_user_id;
		private String TUTOR_USER_user_id;
		private int CLASS_class_id;
		private String user_profileImagePath;
		private String receiver_user_profileImagePath;
		private String user_name;
		private String receiver_user_name;
		private String class_name;
		private int class_id;
		private String TUTOR_tutor_id;
		private String tutor_name;
		private String tuti_id;
		private int unReadCount;
	
		public static MessageVO convertMessage(String source) {
			MessageVO message = new MessageVO();
			Gson gson = new Gson();
			message = gson.fromJson(source,  MessageVO.class);
			return message;
		}
	}	
/*채팅vo*/
	public class ChatRoomVO {

		
		private String chatroom_id;
		private String USER_user_id;
		private String TUTOR_USER_user_id;
		private int CLASS_class_id;
	}
}
