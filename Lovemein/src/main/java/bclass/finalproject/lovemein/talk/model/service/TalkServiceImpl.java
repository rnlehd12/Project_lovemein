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
	public List<Talk> getTalk(Talk talk) {
		return talkDao.getTalk(talk);
	}

	@Override
	public TalkPartner getPatnerInfo(String receiver) {
		return talkDao.getPatnerInfo(receiver);
	}



	@Override
	public int insetTalk(Talk talk) {
		return talkDao.insetTalk(talk);
	}

	@Override
	public List<Talk> readTalk(Talk talk) {
		return talkDao.readTalk(talk);
	}

	@Override
	public int insertUserMission(TalkMission talkMission) {
		return talkDao.insertUserMission(talkMission);
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




}
