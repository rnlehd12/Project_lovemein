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
	
	public List<Talk> getTalk(Talk talk) {
		return sqlSession.selectList("getTalk", talk);
	}
	
	public TalkPartner getPatnerInfo(String receiver) {
		return sqlSession.selectOne("getPatnerInfo", receiver);
	}
	
	public int insetTalk(Talk talk) {
		return sqlSession.insert("insetTalk", talk);
	}
	
	public List<Talk> readTalk(Talk talk) {
		return sqlSession.selectList("readTalk", talk);
	}
	
	public int insertUserMission(TalkMission talkMission) {
		return sqlSession.insert("insertUserMission", talkMission);
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




}
