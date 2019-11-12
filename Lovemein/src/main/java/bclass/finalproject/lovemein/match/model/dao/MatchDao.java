package bclass.finalproject.lovemein.match.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bclass.finalproject.lovemein.users.model.vo.AllUsers;

@Repository("matchDao")
public class MatchDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<AllUsers> matchListMethod(AllUsers loginUser) {
		return sqlSession.selectList("usersMapper.matchList", loginUser);
	}

}
