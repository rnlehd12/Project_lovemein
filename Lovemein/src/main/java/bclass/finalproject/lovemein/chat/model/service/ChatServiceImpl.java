package bclass.finalproject.lovemein.chat.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bclass.finalproject.lovemein.chat.model.dao.ChatDao;
import bclass.finalproject.lovemein.chat.model.vo.Chat;

@Service("chatService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDao chatDao;
	
	@Override
	public List<Chat> chatListMethod(HashMap<String, Object> map) {
		return chatDao.chatListMethod(map);
	}

}
