package bclass.finalproject.lovemein.likes.model.service;

import java.util.HashMap;
import java.util.List;

import bclass.finalproject.lovemein.likes.model.vo.Likes;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;

public interface LikesService {

	/*List<AllUsers> sendLikesList(int u_no);*/


	List<Likes> addFromMeListMethod(HashMap<String, Object> map);

	List<Likes> addToMeListMethod(HashMap<String, Object> map);

	int insertLikesMethod(Likes likes);

	int deleteLikesMethod(Likes likes);
	
}
