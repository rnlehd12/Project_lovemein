package bclass.finalproject.lovemein.feed.model.service;

import java.util.List;

import bclass.finalproject.lovemein.feed.model.vo.Feed;
import bclass.finalproject.lovemein.feed.model.vo.FeedReply;
import bclass.finalproject.lovemein.likes.model.vo.Likes;

public interface FeedService {

	int likeCount(String param);

	List<Likes> sendLikeList(String param);

	List<Feed> myFeedList(String param);

	List<Feed> feedLikeMethod(String param);

	List<Feed> feedReplyMethod(String param);

	List<FeedReply> feedReplyListMethod(String param);

	int insertReply(FeedReply feedReply);

}
