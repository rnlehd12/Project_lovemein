package bclass.finalproject.lovemein.match.model.service;

import java.util.HashMap;
import java.util.List;

import bclass.finalproject.lovemein.match.model.vo.Match;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;

public interface MatchService {

	List<Match> matchListMethod(HashMap<String, Object> map);
}
