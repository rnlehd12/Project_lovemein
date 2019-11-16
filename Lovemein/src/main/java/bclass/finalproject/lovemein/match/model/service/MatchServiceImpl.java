package bclass.finalproject.lovemein.match.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bclass.finalproject.lovemein.match.model.dao.MatchDao;
import bclass.finalproject.lovemein.match.model.vo.Match;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;

@Service("matchService")
public class MatchServiceImpl implements MatchService{

	@Autowired
	private MatchDao matchDao;

	@Override
	public List<Match> matchListMethod(HashMap<String, Object> map) {
		return matchDao.matchListMethod(map);
	}
	


}
