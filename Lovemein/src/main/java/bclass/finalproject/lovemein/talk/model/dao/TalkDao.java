package bclass.finalproject.lovemein.talk.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bclass.finalproject.lovemein.talk.model.vo.Chat;
import bclass.finalproject.lovemein.talk.model.vo.Talk;
import bclass.finalproject.lovemein.talk.model.vo.TalkChat;
import bclass.finalproject.lovemein.talk.model.vo.TalkMission;
import bclass.finalproject.lovemein.talk.model.vo.TalkPartner;
import bclass.finalproject.lovemein.talk.model.vo.TalkReport;

@Repository("talkDao")
public class TalkDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertChat(HashMap<String, Object> tcmap) {
		return sqlSession.insert("insertChat", tcmap);
	}
	
	public Chat getTalkChat(Talk talk) {
		return sqlSession.selectOne("getTalkChat", talk);
	}
	
	public List<Talk> getTalkList(Chat chat) {
		return sqlSession.selectList("getTalkList", chat);
	}
	
	public TalkPartner getPatnerInfo(String receiver) {
		return sqlSession.selectOne("getPatnerInfo", receiver);
	}
	

	public int insertMissionMethod(TalkMission talkMission) {
		return sqlSession.insert("insertMissionMethod", talkMission);
	}

	public int insertReport(TalkReport talkReport) {
		return sqlSession.insert("insertReport", talkReport);
	}
	
	public List<TalkMission> userMissionList(HashMap<String, Object> map) {
		return sqlSession.selectList("userMissionList", map);
	}

	public List<TalkChat> chatListMethod(HashMap<String, Object> cmap) {
		return sqlSession.selectList("chatListMethod", cmap);
	}

	public List<TalkMission> userMSearchList(HashMap<String, Object> map) {
		return sqlSession.selectList("userMSearchList", map);
	}

	public List<TalkMission> adminMissionList(HashMap<String, Object> map) {
		return sqlSession.selectList("adminMissionList", map);
	}

	public List<TalkMission> adminMSearchList(HashMap<String, Object> map) {
		return sqlSession.selectList("adminMSearchList", map);
	}

	public TalkMission adminMDetailMethod(TalkMission talkMission) {
		return sqlSession.selectOne("adminMDetailMethod", talkMission);
	}

	public int mstaUpdateMethod(HashMap<String, Object> map) {
		return sqlSession.update("mstaUpdateMethod", map);
	}

	public int insertTalk(Talk talk) {
		return sqlSession.insert("insertTalk", talk);
	}

	public Talk getOneTalk(Talk talk) {
		return sqlSession.selectOne("getOneTalk", talk);
	}

	public int cReadUpdate(Talk talk) {
		System.out.println("talkDao의 cReadUpdate : " + talk.getT_from_uno()
		+ ", " + talk.getT_to_uno());
		return sqlSession.update("cReadUpdate", talk);
	}

	public TalkMission mstaMethod(HashMap<String, Object> map) {
		return sqlSession.selectOne("mstaMethod", map);
	}




}
