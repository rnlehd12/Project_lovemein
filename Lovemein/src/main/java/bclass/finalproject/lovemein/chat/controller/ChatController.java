package bclass.finalproject.lovemein.chat.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bclass.finalproject.lovemein.chat.model.service.ChatService;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;


@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);


	
	@RequestMapping("chatList.do")
	public ModelAndView chatListMethod(ModelAndView mv, HttpSession session,
			AllUsers allUsers) {
		allUsers = (AllUsers)session.getAttribute("loginMember");
		int startNo = 1;
		logger.info("chatList 실행, allUser(로그인객체) : " + allUsers.getU_no()+", startNo : " +startNo);
		
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("startNo", startNo);
		
		/*List<Chat> chatList = new ArrayList<Chat>();
		chatList = chatService.chatListMethod(map);
				*/
		mv.addObject("chatList", "chatList");
		mv.setViewName("JsonView");
		mv.setViewName("chat/chatListView");
		
		return mv;
	};
	
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
