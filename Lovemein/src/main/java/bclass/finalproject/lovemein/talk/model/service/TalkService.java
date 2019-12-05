package bclass.finalproject.lovemein.talk.model.service;

import java.util.HashMap;
import java.util.List;

import bclass.finalproject.lovemein.talk.model.vo.Chat;
import bclass.finalproject.lovemein.talk.model.vo.Talk;
import bclass.finalproject.lovemein.talk.model.vo.TalkChat;
import bclass.finalproject.lovemein.talk.model.vo.TalkMission;
import bclass.finalproject.lovemein.talk.model.vo.TalkPartner;
import bclass.finalproject.lovemein.talk.model.vo.TalkReport;

public interface TalkService {
	
	int insertChat(HashMap<String, Object> tcmap);

	Chat getTalkChat(Talk talk);
	
	List<Talk> getTalk(Talk talk);

	TalkPartner getPatnerInfo(String receiver);
	

	int insetTalk(Talk talk);

	List<Talk> readTalk(Talk talk);

	int insertUserMission(TalkMission talkMission);

	int insertReport(TalkReport talkReport);

	List<TalkMission> userMissionList(HashMap<String, Object> map);

	List<TalkChat> chatListMethod(HashMap<String, Object> cmap);

	List<TalkMission> userMSearchList(HashMap<String, Object> map);






}
