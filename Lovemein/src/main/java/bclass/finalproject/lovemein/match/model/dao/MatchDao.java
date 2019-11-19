package bclass.finalproject.lovemein.match.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bclass.finalproject.lovemein.match.model.vo.Match;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;

@Repository("matchDao")
public class MatchDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Match> matchListMethod(HashMap<String, Object> map) {
		return sqlSession.selectList("matchListMethod", map);
	}

}
