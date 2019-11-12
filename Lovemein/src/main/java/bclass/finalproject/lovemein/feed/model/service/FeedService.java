package bclass.finalproject.lovemein.feed.model.service;

import java.util.List;

import bclass.finalproject.lovemein.feed.model.vo.Feed;
import bclass.finalproject.lovemein.feed.model.vo.FeedLike;
import bclass.finalproject.lovemein.feed.model.vo.FeedModiReply;
import bclass.finalproject.lovemein.feed.model.vo.FeedReply;
import bclass.finalproject.lovemein.likes.model.vo.Likes;
import bclass.finalproject.lovemein.likes.model.vo.TargetLikeCheck;

public interface FeedService {

	int likeCount(String param);

	List<Likes> sendLikeList(String param);

	List<Feed> myFeedList(String param);

	List<Feed> feedLikeMethod(String param);

	List<Feed> feedReplyMethod(String param);

	List<FeedReply> feedReplyListMethod(String param);

	int insertReply(FeedReply feedReply);

	int replyDel(String param);

	int replyModi(FeedModiReply feedModiReply);

	List<Feed> feedLikeChkMethod(String u_no);

	int delLike(FeedLike feedLike);

	int plusLike(FeedLike feedLike);

	int insertFeed(Feed feed);

	int feedDel(String f_no);

	List<Feed> feedLikeChkTarget(TargetLikeCheck targetChk);

}
