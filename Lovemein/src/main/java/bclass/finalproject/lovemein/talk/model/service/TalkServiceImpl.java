package bclass.finalproject.lovemein.talk.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bclass.finalproject.lovemein.talk.model.dao.TalkDao;
import bclass.finalproject.lovemein.talk.model.vo.Chat;
import bclass.finalproject.lovemein.talk.model.vo.Talk;
import bclass.finalproject.lovemein.talk.model.vo.TalkChat;
import bclass.finalproject.lovemein.talk.model.vo.TalkMission;
import bclass.finalproject.lovemein.talk.model.vo.TalkPartner;
import bclass.finalproject.lovemein.talk.model.vo.TalkReport;

@Service("talkService")
public class TalkServiceImpl implements TalkService{

	@Autowired
	private TalkDao talkDao;


	@Override
	public int insertChat(HashMap<String, Object> tcmap) {
		return talkDao.insertChat(tcmap);
	}
	
	@Override
	public Chat getTalkChat(Talk talk) {
		return talkDao.getTalkChat(talk);
	}


	@Override
	public List<Talk> getTalkList(Chat chat) {
		return talkDao.getTalkList(chat);
	}

	@Override
	public TalkPartner getPatnerInfo(String receiver) {
		return talkDao.getPatnerInfo(receiver);
	}

	@Override
	public int insertMissionMethod(TalkMission talkMission) {
		return talkDao.insertMissionMethod(talkMission);
	}

	@Override
	public int insertReport(TalkReport talkReport) {
		return talkDao.insertReport(talkReport);
	}

	@Override
	public List<TalkMission> userMissionList(HashMap<String, Object> map) {
		return talkDao.userMissionList(map);
	}

	@Override
	public List<TalkChat> chatListMethod(HashMap<String, Object> cmap) {
		return talkDao.chatListMethod(cmap);
	}

	@Override
	public List<TalkMission> userMSearchList(HashMap<String, Object> map) {
		return talkDao.userMSearchList(map);
	}


	@Override
	public List<TalkMission> adminMissionList(HashMap<String, Object> map) {
		return talkDao.adminMissionList(map);
	}

	@Override
	public List<TalkMission> adminMSearchList(HashMap<String, Object> map) {
		return talkDao.adminMSearchList(map);
	}

	@Override
	public TalkMission adminMDetailMethod(TalkMission talkMission) {
		return talkDao.adminMDetailMethod(talkMission);
	}

	@Override
	public int mstaUpdateMethod(HashMap<String, Object> map) {
		return talkDao.mstaUpdateMethod(map);
	}

	@Override
	public int insertTalk(Talk talk) {
		return talkDao.insertTalk(talk);
	}

	@Override
	public Talk getOneTalk(Talk talk) {
		return talkDao.getOneTalk(talk);
	}

	@Override
	public int cReadUpdate(Talk talk) {
		return talkDao.cReadUpdate(talk);
	}

	@Override
	public TalkMission mstaMethod(HashMap<String, Object> map) {
		return talkDao.mstaMethod(map);
	}





}
