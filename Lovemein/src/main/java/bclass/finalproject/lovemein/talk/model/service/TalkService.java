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
	
	//chat 생성
	int insertChat(HashMap<String, Object> tcmap);

	//chat 조회
	Chat getTalkChat(Talk talk);
	
	//해당 채팅방 채팅 조회
	List<Talk> getTalkList(Chat chat);

	//상대방(TalkPartner) 조회
	TalkPartner getPatnerInfo(String receiver);

	// 유저미션 등록
	int insertMissionMethod(TalkMission talkMission);

	int insertReport(TalkReport talkReport);

	// 유저미션 리스트
	List<TalkMission> userMissionList(HashMap<String, Object> map);
	
	// 채팅 목록
	List<TalkChat> chatListMethod(HashMap<String, Object> cmap);

	//유저미션 검색
	List<TalkMission> userMSearchList(HashMap<String, Object> map);

	// 관리자미션 목록
	List<TalkMission> adminMissionList(HashMap<String, Object> map);

	//관리자미션 검색
	List<TalkMission> adminMSearchList(HashMap<String, Object> map);
	
	//관리자미션 상세페이지조회
	TalkMission adminMDetailMethod(TalkMission talkMission);

	int mstaUpdateMethod(HashMap<String, Object> map);

	//채팅등록
	int insertTalk(Talk talk);

	//최근 채팅 1개 조회
	Talk getOneTalk(Talk talk);
	
	//해당 해당 c_no의 talk테이블의 c_read 전부 업데이트
	int cReadUpdate(Talk talk);

	TalkMission mstaMethod(HashMap<String, Object> map);






}
