package bclass.finalproject.lovemein.feed.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bclass.finalproject.lovemein.feed.model.dao.FeedDao;
import bclass.finalproject.lovemein.feed.model.vo.Feed;
import bclass.finalproject.lovemein.feed.model.vo.FeedReply;
import bclass.finalproject.lovemein.likes.model.vo.Likes;

@Service("feedService")
public class FeedServiceImpl implements FeedService{
	
	@Autowired
	private FeedDao feedDao;
	
	@Override
	public int likeCount(String param) {
		
		return feedDao.likeCount(param);
	}

	@Override
	public List<Likes> sendLikeList(String param) {
		
		return feedDao.sendLikeList(param);
	}

	@Override
	public List<Feed> myFeedList(String param) {
		
		return feedDao.myFeedList(param);
	}

	@Override
	public List<Feed> feedLikeMethod(String param) {
		
		return feedDao.feedLikeMethod(param);
	}

	@Override
	public List<Feed> feedReplyMethod(String param) {
		
		return feedDao.feedReplyMethod(param);
	}

	@Override
	public List<FeedReply> feedReplyListMethod(String param) {
		
		return feedDao.feedReplyListMethod(param);
	}

	@Override
	public int insertReply(FeedReply feedReply) {
		
		return feedDao.insertReply(feedReply);
	}
	

}
