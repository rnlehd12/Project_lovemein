package bclass.finalproject.lovemein.chat.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bclass.finalproject.lovemein.chat.model.vo.Chat;


@Repository("chatDao")
public class ChatDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Chat> chatListMethod(HashMap<String, Object> map) {
		return sqlSession.selectList("chatListMethod", map);
	}
	
	
	
}
