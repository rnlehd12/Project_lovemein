package bclass.finalproject.lovemein.chat.model.service;

import java.util.HashMap;
import java.util.List;

import bclass.finalproject.lovemein.chat.model.vo.Chat;

public interface ChatService {

	List<Chat> chatListMethod(HashMap<String, Object> map);

}
