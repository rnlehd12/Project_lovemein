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

	public List<Likes> fromMeListMethod(String senderNo) {
		return sqlSession.selectList("fromMeList", senderNo);
	}

	public List<Likes> addfromMeListMethod(HashMap<String, Object> map) {
		return sqlSession.selectList("addfromMeList", map);
	}
	
	
}
