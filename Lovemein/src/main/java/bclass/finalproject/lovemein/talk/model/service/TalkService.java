package bclass.finalproject.lovemein.talk.model.service;

import java.util.HashMap;
import java.util.List;

import bclass.finalproject.lovemein.talk.model.vo.Talk;
import bclass.finalproject.lovemein.talk.model.vo.TalkChat;
import bclass.finalproject.lovemein.talk.model.vo.TalkMission;
import bclass.finalproject.lovemein.talk.model.vo.TalkPartner;
import bclass.finalproject.lovemein.talk.model.vo.TalkReport;

public interface TalkService {

	TalkChat getTalkChat(Talk talk);

	int insertChat(Talk talk);

	List<Talk> getTalk(Talk talk);

	TalkPartner getPatnerInfo(String c_to_uno);
	
	TalkPartner getPartnerFeed(String c_to_uno);

	int insetTalk(Talk talk);

	List<Talk> readTalk(Talk talk);

	int insertUserMission(TalkMission talkMission);

	int insertReport(TalkReport talkReport);

	List<TalkMission> userMissionList(HashMap<String, Object> map);



}
