//
//public class MessageVO {
//	
//	private String message_id;
//	private String message_sender;
//	private String message_receiver;
//	private String message_content;
//	private Date message_sendTime;
//	private Date message_readTime;
//	private String CHATROOM_chatroom_id;
//	private String USER_user_id;
//	private String TUTOR_USER_user_id;
//	private int CLASS_class_id;
//	private String user_profileImagePath;
//	private String receiver_user_profileImagePath;
//	private String user_name;
//	private String receiver_user_name;
//	private String class_name;
//	private int class_id;
//	private String TUTOR_tutor_id;
//	private String tutor_name;
//	private String tuti_id;
//	private int unReadCount;
//	
//	
//	public static MessageVO convertMessage(String source) {
//		MessageVO message = new MessageVO();
//		Gson gson = new Gson();
//		message = gson.fromJson(source,  MessageVO.class);
//		return message;
//	}
//}
/////////////////	
//	public class ChatRoomVO {
//
//		
//		private String chatroom_id;
//		private String USER_user_id;
//		private String TUTOR_USER_user_id;
//		private int CLASS_class_id;
//		
//	}
//	
//
//public interface ChatDAO {
//
//	public void createRoom(ChatRoomVO vo)throws Exception;
//	public ChatRoomVO isRoom(ChatRoomVO vo)throws Exception;
//	public void insertMessage(MessageVO vo)throws Exception;
//	public String getPartner(ChatRoomVO vo)throws Exception;
//	public String getProfile(String str)throws Exception;
//	public String getName(String str)throws Exception;
//	public List<MessageVO> getMessageList(String str)throws Exception;
//	public List<ChatRoomVO> getRoomList(String str)throws Exception;
//	public List<ChatRoomVO> getRoomList2(String str)throws Exception;
//	public MessageVO getRecentMessage(String str)throws Exception;
//	//public String isGetMessageList(String str)throws Exception;
//	
//	public String getTutorId(String str)throws Exception;
//	public List<ChatRoomVO> getRoomListTutor(String str)throws Exception;
//	public void updateReadTime(int class_id , String user_id , String TUTOR_USER_user_id)throws Exception;
//	public void updateReadTimeTutor(int class_id , String user_id , String TUTOR_USER_user_id)throws Exception;
//	
//	public int getUnReadCount(String TUTOR_USER_user_id, int class_id, String user_id)throws Exception;
//	public int getUnReadCountTutor(String TUTOR_USER_user_id, int class_id, String user_id)throws Exception;
//	
//	public int getAllCount(String str);
//	
//}
//
//
//@Repository
//public class ChatDAOImpl implements ChatDAO{
//	
//	@Inject
//	private SqlSession session;
//
//	private static String namespace = "com.almom.mapper.ChatMapper";
//
//	
//	
//	@Override
//	public void createRoom(ChatRoomVO vo) throws Exception {
//		// TODO Auto-generated method stub
//		System.out.println("ㅅㅂ");
//		session.insert(namespace+".createRoom" , vo);
//		System.out.println("시팔");
//	}
//
//
//
//	@Override
//	public ChatRoomVO isRoom(ChatRoomVO vo) throws Exception {
//		// TODO Auto-generated method stub
//		
//		ChatRoomVO roomvo = null;
//		roomvo = session.selectOne(namespace+".isRoom", vo);
//		System.out.println("ss");
//		System.out.println(roomvo);
//		
//		return roomvo;
//	}
//
//
//
//	@Override
//	public void insertMessage(MessageVO vo) throws Exception {
//		// TODO Auto-generated method stub
//		
//		session.insert(namespace+".insertMessage" , vo);
//	}
//
//
//
//	@Override
//	public String getPartner(ChatRoomVO vo) throws Exception {
//		// TODO Auto-generated method stub
//		
//		List<MessageVO> mvo = session.selectList(namespace+".getPartner", vo);
//		
//		return mvo.get(0).getUSER_user_id();
//	}
//
//
//
//	@Override
//	public String getProfile(String str) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectOne(namespace+".getProfile" , str);
//	}
//
//
//
//	@Override
//	public String getName(String str) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectOne(namespace+".getName" , str);
//	}
//
//
//
//	@Override
//	public List<MessageVO> getMessageList(String str) throws Exception {
//		// TODO Auto-generated method stub
//
//			return session.selectList(namespace+".getMessageList" , str);
//		
//		
//	}
//
//
//
//	@Override
//	public List<ChatRoomVO> getRoomList(String str) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectList(namespace+".getRoomList",str);
//	}
//
//
//
//	@Override
//	public List<ChatRoomVO> getRoomList2(String str) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectList(namespace+".getRoomList2" , str);
//	}
//
//
//
//	@Override
//	public MessageVO getRecentMessage(String str) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectOne(namespace+".getRecentMessage" , str);
//	}
//
//
//
//	@Override
//	public String getTutorId(String str) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectOne(namespace+".getTutorId" , str) ;
//	}
//
//
//
//	@Override
//	public List<ChatRoomVO> getRoomListTutor(String str) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectList(namespace+".getRoomListTutor" , str);
//	}
//
//
//
//	@Override
//	public void updateReadTime(int class_id, String user_id, String TUTOR_USER_user_id) throws Exception {
//		// TODO Auto-generated method stub
//		
//		HashMap<String, Object> map = new HashMap<String, Object> ();
//		
//		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
//		map.put("USER_user_id", user_id);
//		map.put("CLASS_class_id", class_id);
//		session.update(namespace+".updateReadTime" , map);
//	}
//
//
//
//	@Override
//	public int getUnReadCount(String TUTOR_USER_user_id, int class_id, String user_id) throws Exception {
//		// TODO Auto-generated method stub
//		HashMap<String, Object> map = new HashMap<String, Object> ();
//		
//		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
//		map.put("USER_user_id", user_id);
//		map.put("CLASS_class_id", class_id);
//		
//		
//		return session.selectOne(namespace+".getUnReadCount" , map);
//	}
//
//
//
//	@Override
//	public int getAllCount(String str) {
//		// TODO Auto-generated method stub
//		HashMap<String, Object> map = new HashMap<String, Object> ();
//		
//		map.put("USER_user_id", str);
//		map.put("TUTOR_USER_user_id", str);
//		if(session.selectOne(namespace+".getAllCount" ,map) ==null) {
//			return 0;
//		}else {
//			
//			return session.selectOne(namespace+".getAllCount" ,map);
//		}
//		
//	}
//
//
//
//	@Override
//	public void updateReadTimeTutor(int class_id , String user_id , String TUTOR_USER_user_id) throws Exception {
//		// TODO Auto-generated method stub
//		HashMap<String, Object> map = new HashMap<String, Object> ();
//		
//		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
//		map.put("USER_user_id", user_id);
//		map.put("CLASS_class_id", class_id);
//		session.update(namespace+".updateReadTimeTutor" , map);
//	}
//
//
//
//	@Override
//	public int getUnReadCountTutor(String TUTOR_USER_user_id, int class_id, String user_id) throws Exception {
//		// TODO Auto-generated method stub
//		HashMap<String, Object> map = new HashMap<String, Object> ();
//		
//		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
//		map.put("USER_user_id", user_id);
//		map.put("CLASS_class_id", class_id);
//		
//		
//		return session.selectOne(namespace+".getUnReadCountTutor" , map);
//	}
//
//
//
//
//	
//}
//	