package bclass.finalproject.lovemein.match.model.service;

import java.util.List;

import bclass.finalproject.lovemein.users.model.vo.AllUsers;

public interface MatchService {

	List<AllUsers> matchListMethod(AllUsers loginUser);
}
