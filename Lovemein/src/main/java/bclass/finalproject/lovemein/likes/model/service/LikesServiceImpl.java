package bclass.finalproject.lovemein.likes.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bclass.finalproject.lovemein.likes.model.dao.LikesDao;
import bclass.finalproject.lovemein.likes.model.vo.Likes;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;

@Service("likesService")
public class LikesServiceImpl implements LikesService{

	@Autowired
	private LikesDao likesDao;

	@Override
	public List<Likes> addFromMeListMethod(HashMap<String, Object> map) {
		return likesDao.addFromMeListMethod(map);
	}

	@Override
	public List<Likes> addToMeListMethod(HashMap<String, Object> map) {
		return likesDao.addToMeListMethod(map);
	}


	@Override
	public int insertLikesMethod(Likes likes) {
		return likesDao.insertLikesMethod(likes);
	}

	@Override
	public int deleteLikesMethod(Likes likes) {
		return likesDao.deleteLikesMethod(likes);
	}


}
