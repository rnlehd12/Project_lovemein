package bclass.finalproject.lovemein.feed.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bclass.finalproject.lovemein.feed.model.vo.Feed;
import bclass.finalproject.lovemein.feed.model.vo.FeedLike;
import bclass.finalproject.lovemein.feed.model.vo.FeedModiReply;
import bclass.finalproject.lovemein.feed.model.vo.FeedReply;
import bclass.finalproject.lovemein.likes.model.vo.Likes;
import bclass.finalproject.lovemein.likes.model.vo.TargetLikeCheck;

//피드 DAO by 귀정
@Repository("feedDao")
public class FeedDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int likeCount(String param) {
		
		return sqlSession.selectOne("feedMapper.likeCount",param);
	}

	public List<Likes> sendLikeList(String param) {
		
		return sqlSession.selectList("feedMapper.sendLikeList",param);
	}

	public List<Feed> myFeedList(String param) {
		
		return sqlSession.selectList("feedMapper.myFeedList",param);
	}

	public List<Feed> feedLikeMethod(String param) {
		
		return sqlSession.selectList("feedMapper.feedLikeMethod",param);
	}

	public List<Feed> feedReplyMethod(String param) {
		
		return sqlSession.selectList("feedMapper.feedReplyMethod",param);
	}

	public List<FeedReply> feedReplyListMethod(String param) {
		
		return sqlSession.selectList("feedMapper.feedReplyListMethod",param);
		
	}

	public int insertReply(FeedReply feedReply) {
		
		return sqlSession.insert("feedMapper.insertReply",feedReply);
	}

	public int replyDel(String param) {
		
		return sqlSession.insert("feedMapper.replyDel",param);
	}

	public int replyModi(FeedModiReply feedModiReply) {
		
		return sqlSession.update("feedMapper.replyModi",feedModiReply);
	}

	public List<Feed> feedLikeChk(String u_no) {
		
		return sqlSession.selectList("feedMapper.feedLikeChk",u_no);
	}

	public int delLike(FeedLike feedLike) {
		
		return sqlSession.delete("feedMapper.delLike", feedLike);
	}

	public int plusLike(FeedLike feedLike) {
		
		return sqlSession.insert("feedMapper.plusLike", feedLike);
	}

	public int insertFeed(Feed feed) {
		
		return sqlSession.insert("feedMapper.insertFeed", feed);
	}

	public int feedDel(String f_no) {
		
		return sqlSession.delete("feedMapper.feedDel", f_no);
	}

	public List<Feed> feedLikeChkTarget(TargetLikeCheck targetChk) {
		
		return sqlSession.selectList("feedMapper.feedLikeChkTarget", targetChk);
	}
}
