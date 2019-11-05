package bclass.finalproject.lovemein.feed.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bclass.finalproject.lovemein.feed.model.vo.Feed;
import bclass.finalproject.lovemein.feed.model.vo.FeedReply;
import bclass.finalproject.lovemein.likes.model.vo.Likes;

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
}
