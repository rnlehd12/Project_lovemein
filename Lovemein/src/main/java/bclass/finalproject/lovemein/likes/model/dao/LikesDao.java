package bclass.finalproject.lovemein.likes.model.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bclass.finalproject.lovemein.likes.model.vo.Likes;

@Repository("likesDao")
public class LikesDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Likes> addFromMeListMethod(HashMap<String, Object> map) {
		return sqlSession.selectList("addFromMeList", map);
	}

	public List<Likes> addToMeListMethod(HashMap<String, Object> map) {
		return sqlSession.selectList("addToMeList", map);
	}
	
	
}
