package bclass.finalproject.lovemein.feed.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bclass.finalproject.lovemein.feed.model.dao.FeedDao;
import bclass.finalproject.lovemein.feed.model.vo.Feed;
import bclass.finalproject.lovemein.feed.model.vo.FeedLike;
import bclass.finalproject.lovemein.feed.model.vo.FeedModiReply;
import bclass.finalproject.lovemein.feed.model.vo.FeedReply;
import bclass.finalproject.lovemein.likes.model.vo.Likes;
import bclass.finalproject.lovemein.likes.model.vo.TargetLikeCheck;

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

	@Override
	public int replyDel(String param) {
		
		return feedDao.replyDel(param);
		
	}

	@Override
	public int replyModi(FeedModiReply feedModiReply) {
		
		return feedDao.replyModi(feedModiReply);
	}

	@Override
	public List<Feed> feedLikeChkMethod(String u_no) {
		
		return feedDao.feedLikeChk(u_no);
	}

	@Override
	public int delLike(FeedLike feedLike) {
		
		return feedDao.delLike(feedLike);
	}

	@Override
	public int plusLike(FeedLike feedLike) {
		
		return feedDao.plusLike(feedLike);
	}

	@Override
	public int insertFeed(Feed feed) {
		
		return feedDao.insertFeed(feed);
	}

	@Override
	public int feedDel(String f_no) {
		
		return feedDao.feedDel(f_no);
	}

	@Override
	public List<Feed> feedLikeChkTarget(TargetLikeCheck targetChk) {
		
		return feedDao.feedLikeChkTarget(targetChk);
	}

	@Override
	public int updateFeed(Feed feed) {
		
		return feedDao.updateFeed(feed);
	}

	@Override
	public List<Feed> allFeed() {
		
		return feedDao.allFeed();
	}

	@Override
	public List<FeedLike> allFeedHeartChk(String u_no) {
		
		return feedDao.allFeedHeartChk(u_no);
	}

	@Override
	public void golikeTarget(TargetLikeCheck targetchk) {
		
		feedDao.golikeTarget(targetchk);
		
	}

	@Override
	public TargetLikeCheck targetLikeCheck(TargetLikeCheck target) {
		
		return feedDao.targetLikeCheck(target);
	}

	@Override
	public void unLikeTarget(TargetLikeCheck targetchk) {
		
		feedDao.unLikeTarget(targetchk);
		
	}

	@Override
	public void outCoin(String loginUno) {
		
		feedDao.outCoin(loginUno);
		
	}

	@Override
	public int selectCoin(String loginUno) {
		
		return feedDao.selectCoin(loginUno);
	}

	
	

}
